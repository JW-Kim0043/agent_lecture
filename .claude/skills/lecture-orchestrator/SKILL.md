---
name: lecture-orchestrator
description: AI Agent 2시간 강의 자료(기획→아키텍처→가이드→HTML PT)를 단계별로 사용자와 상의하며 만드는 메타 워크플로. "강의자료 만들자", "PT 만들자", "Agent 강의 준비" 같은 발화에서 가장 먼저 호출되어 다른 ai-agent-* skill을 순서대로 오케스트레이션한다.
metadata:
  type: workflow
---

# Lecture Orchestrator — AI Agent 2시간 강의 메인 워크플로

## 언제 이 skill을 쓰나
사용자가 "AI Agent 강의 자료 만들자", "PT 시작", "가이드 + 슬라이드 같이 작업" 같이 **여러 산출물을 하나의 강의로 묶는 작업**을 요청할 때. 단일 작업(예: "트렌드만 정리해줘")이면 해당 단일 skill을 직접 호출한다.

## 전제 (수강 대상)
- **기존 SW/Cloud 아키텍트** → AI 아키텍트로 전환 중
- AI 입문 수준은 아니지만, LLM/Agent 고유 용어는 풀어줘야 안정적
- 예시: "Sidecar는 알지만 'Agentic Loop의 Critic'은 처음일 수 있다"

## 강의 메타 정보 (모든 산출물의 공유 컨텍스트)
- **주제**: AI Agent 아키텍처 (RAG/Gateway는 본 강의 범위 외)
- **시간**: 약 2시간 (Q&A 포함 가정)
- **목표**: 수강생이 끝나고 "우리 조직의 Agent 시스템을 화이트보드에 그릴 수 있다"
- **핵심 정의(스레드)**: `Agent = Loop + Tools + State + Policy`
- **2026 신생 표준**: MCP(Tool 표준), A2A·ACP(Agent 간 통신), Computer Use, Agentic Memory, Skills

## 4단계 파이프라인
모든 단계마다 사용자에게 결정권을 넘긴다 — **AskUserQuestion으로 분기**, 사용자가 OK 한 뒤에야 다음 단계로.

### Step 1. 트렌드 동기화 — `ai-agent-trends`
**목표**: 본 강의에 반영할 최신 트렌드 컷오프와 다룰 항목 픽스.
**산출**: `lecture/00-trends-snapshot.md` (강의에서 다룰 트렌드 9~12개 + 출처 + "왜 다루는가")
**사용자 결정**: 어느 트렌드를 깊게/얕게 다룰지

### Step 2. 강의 기획 — `ai-agent-planner`
**목표**: 2시간을 챕터·시간·도착점으로 쪼개기.
**산출**: `lecture/01-curriculum.md` (학습목표 5개, 챕터 6개, 챕터별 분 단위 시간표, 슬라이드 후보 카운트)
**사용자 결정**: 챕터 구성·우선순위·생략 항목

### Step 3. 아키텍처 캔버스 — `ai-agent-architect`
**목표**: 강의에서 그릴 모든 다이어그램과 의사결정 매트릭스 정의.
**산출**: `lecture/02-architecture-canvas.md` (8~12개 캔버스: Loop 구조, Tool/MCP, Multi-Agent 토폴로지, Memory 계층, Observability, Failure Mode, Security/HITL 등)
**사용자 결정**: 어느 캔버스를 핵심 슬라이드로 승격할지

### Step 4-A. 가이드 문서 — `ai-agent-guide-writer`
**목표**: 강의 후 수강생이 가져갈 **읽는 문서**(슬라이드 아닌 산문).
**산출**: `lecture/03-guide.md` (챕터별 narrative + 체크리스트 + 의사결정 트리)
**사용자 결정**: 톤(친절체/요약체), 코드 분량, 체크리스트 형식

### Step 4-B. PT HTML — `ai-agent-pt-html`
**목표**: 강의 중 띄울 **HTML 슬라이드**(reveal.js 또는 정적 HTML).
**산출**: `lecture/04-slides.html` (+ `lecture/04-slides-script.md` — 강사 스크립트)
**사용자 결정**: 슬라이드 시스템(reveal.js / 정적 / Marp), 디자인 톤

> 4-A와 4-B는 **반드시 같은 `lecture/02-architecture-canvas.md`를 단일 진실 원천**으로 쓴다. 가이드와 슬라이드 사이에 사실이 어긋나면 안 된다.

## 오케스트레이션 룰
1. **컨텍스트 파일 먼저 읽기**: `lecture/` 디렉터리에 이미 산출물이 있으면 그걸 먼저 읽고 어디부터 재개할지 사용자에게 묻는다.
2. **단계 점프 허용**: 사용자가 "Step 2부터", "Step 4-B만"이라고 말하면 그 skill을 직접 호출. 단, 의존 산출물이 없으면 경고하고 무엇부터 시작할지 묻는다.
3. **TaskCreate 활용**: 4단계를 task로 등록하고 단계 완료 시 즉시 TaskUpdate.
4. **각 skill 호출은 Skill 도구로**: 직접 SKILL.md 내용을 복붙하지 않는다. `Skill(skill="ai-agent-planner")` 형태로 위임.
5. **사용자 결정을 강요하지 않음**: 사용자가 "알아서 해줘"라고 하면 합리적 default를 적용하되, 적용한 default를 명시적으로 보고.

## Auto 모드
사용자가 단계별 멈춤을 줄이고 싶어할 때 사용하는 보조 모드.

### 활성화 / 비활성화
- 활성화 발화: `/auto`, `/auto on`, `auto 모드`, `알아서 가자`, `자동으로`
- 비활성화 발화: `/auto off`, `다시 단계별로`, `매번 물어봐`
- 세션 시작 시 default = **off** (단계별 확인). 한 번 켜면 해당 세션 내내 유지.

### Auto on 동작
1. 4단계를 default 결정으로 자동 진행 — AskUserQuestion을 매 단계에서 호출하지 않음
2. **고정 checkpoint 2개**에서만 멈춤:
   - **CP-1 (Step 2 완료 직후)**: `01-curriculum.md` 작성 후 챕터 구성·시간배분 사용자 컨펌. 여기서 OK 받지 못하면 이후 단계 모두 잘못된 입력으로 진행됨.
   - **CP-2 (Step 3 완료 직후)**: `02-architecture-canvas.md` 작성 후 캔버스 인덱스 사용자 컨펌. 여기서 OK 받지 못하면 가이드/슬라이드가 틀린 다이어그램으로 채워짐.
3. CP가 아닌 곳에서 적용한 default는 **단계 끝마다 1줄로 보고**:
   - 예: `[auto] Step 1: Memory를 별도 챕터로 분리, LangGraph 코드 5분 default 적용`
4. 다음 상황에서는 auto에도 불구하고 **반드시 멈춤**:
   - 외부 사실(버전·벤치마크) 충돌 또는 출처 불명
   - 사용자가 명시적으로 결정해달라고 한 항목
   - 위험 작업 (settings.json 변경, git push, 파일 대량 삭제 등)
5. Auto 종료 시 `lecture/` 디렉터리에 **`auto-decisions.md`**를 남겨 자동 결정 내역과 적용 시각을 기록

### Auto off 시 동작
- 모든 단계마다 AskUserQuestion으로 멈춰 확인 (default 워크플로)

### Auto와 Claude Code 권한 모드의 관계
- 본 skill의 auto 모드는 **콘텐츠 결정 자동화**일 뿐, 도구 호출 권한과는 별개
- 도구 권한을 묶고 싶으면 `--permission-mode acceptEdits` 또는 `update-config` skill로 settings.json 수정 — 사용자가 명시 요청 시에만 처리

### 첫 발화 응답 분기 (auto 적용)
1. `lecture/` 존재 여부 확인
2. 사용자 발화에 auto 키워드가 있으면 즉시 auto on, 없으면 단계별 모드
3. auto on이면: "auto 모드로 진행합니다. CP-1(커리큘럼)과 CP-2(아키텍처 캔버스)에서만 확인 요청드립니다." 한 줄 안내

## 파일 레이아웃 규약
```
<project>/lecture/
  ├─ 00-trends-snapshot.md        # ai-agent-trends
  ├─ 01-curriculum.md             # ai-agent-planner
  ├─ 02-architecture-canvas.md    # ai-agent-architect (Single Source of Truth)
  ├─ 03-guide.md                  # ai-agent-guide-writer
  ├─ 04-slides.html               # ai-agent-pt-html
  ├─ 04-slides-script.md          # ai-agent-pt-html
  └─ assets/                      # 이미지·다이어그램
```

## 첫 발화 응답 템플릿
사용자가 강의 작업을 시작하면 다음을 한다:
1. `lecture/` 디렉터리 존재 여부 확인 (Bash `ls`)
2. 있으면 → 어디까지 됐는지 보고 + 재개 지점 질문
3. 없으면 → 4단계 개요를 1줄씩 설명하고 Step 1부터 진행 동의 요청

## 절대 하지 말 것
- 사용자 확인 없이 4단계를 한 번에 끝까지 돌리기 (각 단계마다 멈춰 결정 요청)
- 기존 `slides/section-3-*.md` 내용을 그대로 차용 (흐름만 참고, 콘텐츠는 새로 작성 — 사용자 요청)
- RAG/Gateway 챕터를 강의 본문에 넣기 (사용자가 선언한 범위 외)
