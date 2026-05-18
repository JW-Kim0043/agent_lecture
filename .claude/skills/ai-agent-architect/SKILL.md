---
name: ai-agent-architect
description: AI Agent 아키텍처 캔버스를 설계한다 — Loop·Tool·MCP·Multi-Agent·Memory·Observability·HITL·FailureMode·Cost 등 8~12개 다이어그램과 의사결정 매트릭스를 정의해 가이드/슬라이드의 단일 진실 원천을 만든다. "아키텍처 그리자", "다이어그램", "의사결정 매트릭스" 발화에서 호출.
metadata:
  type: architecture
---

# AI Agent Architect — 캔버스 설계자

## 언제 호출되나
- lecture-orchestrator Step 3
- 사용자가 "그림 그려야겠는데", "토폴로지 비교", "Multi-Agent 설계" 발화
- guide-writer / pt-html이 호출되기 전 — 이 skill의 산출물이 두 skill의 단일 입력

## 역할 한 줄
**가이드와 슬라이드 사이에 사실 불일치가 일어나지 않도록, 모든 다이어그램·표·결정 기준을 한 파일에 박제한다.**

## 청중 가정 (반복)
SW/Cloud 아키텍트 — 익숙한 비유로 진입한다. 모든 새 캔버스에는 "기존에 알던 ___ 와 비슷하지만 ___ 가 다르다" 한 줄을 강제.

| AI 개념 | 익숙한 비유 | 차이 |
|---|---|---|
| Agent Loop | Reactor pattern | dispatcher가 LLM = 비결정적 |
| Tool Use | RPC + JSON Schema | 호출자가 LLM, 실패 시 재계획 |
| MCP | OpenAPI / Service Mesh | 통신 표준 + 자기서술 |
| State + Checkpointer | Event Sourcing snapshot | trajectory 단위 replay |
| Multi-Agent | MSA + 메시지 버스 | 라우팅이 비결정 |
| HITL | Approval workflow / Manager review | LLM이 escalate 결정 |
| Observability | APM + Distributed Tracing | LLM call이 1 span |
| Guardrails | WAF + 입출력 sanitizer | 의미적 필터 포함 |
| Cost Cap | Cloud Budget Alert | per-trace 토큰 회계 |

## 표준 캔버스 카탈로그 (12개)
> 강의에 다 넣지 말 것 — Ch별로 1~2개씩 8~10개 선택. 사용자와 상의해 픽스.

### C1. Agent 4-요소 정의 (Ch1)
- 다이어그램: 4개 박스 — Loop / Tools / State / Policy
- 결정 기준: 단일 LLM 호출에서 4요소 중 무엇이 빠졌나로 챗봇 vs Agent 판정

### C2. Agent가 만드는 5가지 새 문제 (Ch1)
- 비결정성 / Fan-out 비용 / 무한루프 / 실패 복구 / 권한 탈취
- 각 문제별 실제 사고 사례 1줄

### C3. 추론 패턴 진화 타임라인 (Ch2)
- ReAct (2022) → ReWOO (2023) → Plan-and-Act (2024) → Reflexion (2024) → LATS / ToT (2024) → Reasoning-model native (2025+)
- 가로축: 자율성 ↑, 세로축: 비용 ↑

### C4. 패턴 선택 의사결정 트리 (Ch2)
- 입력: 작업 길이, 도구 수, 실패 비용, 응답 시간 SLA
- 출력: 권장 패턴 + 이유

### C5. Tool Use 4-요소 (Ch3)
- Tool Registry · Tool Executor · Result Formatter · Policy Layer
- 각 요소를 RPC 스택의 어디에 매핑

### C6. MCP 도입 의사결정 (Ch3)
- Tool 수 N, 에이전트 수 M의 N×M 통합 비용 곡선
- 도입 손익분기: ___ 이상에서 MCP 채택 권장

### C7. Multi-Agent 토폴로지 4종 (Ch4)
- Single (Tool-rich) / Supervisor / Hierarchical / Network·Swarm
- 각 토폴로지의 SLA·비용·복잡도 비교표

### C8. Single vs Multi 의사결정 (Ch4)
- Anthropic "Building effective agents" 가이드 기준
- 복잡도가 낮으면 Workflow, 중간이면 Single Agent + Tools, 높으면 Multi
- A2A·ACP 도입 시점

### C9. Memory 3계층 (Ch5)
- Short-term (대화 컨텍스트) / Long-term Episodic / Long-term Semantic-Procedural
- 저장소 매핑: Vector DB · KV · Graph · Relational
- "Event Sourcing의 snapshot + projection"으로 비유

### C10. Observability 트레이스 모델 (Ch5)
- Trace = 한 번의 사용자 요청
- Span = LLM call, Tool call, Memory I/O
- 측정 지표: latency, token cost, tool success rate, loop depth, decision quality

### C11. 안전·HITL 토폴로지 (Ch6)
- 3가지 개입 지점: Pre-tool (사전 승인) / Mid-loop (중간 검토) / Post-output (사후 검토)
- Approve / Edit / Reject 패턴
- 비용·신뢰의 트레이드오프 곡선

### C12. 프로덕션 체크리스트 (Ch6)
- Reliability (Retry, Circuit Breaker, Fallback)
- Eval (Offline benchmark + Online canary)
- Cost (per-trace cap, model cascade)
- Security (Tool allowlist, prompt injection, PII)
- Governance (Audit log, change control)

## 산출 형식 (`lecture/02-architecture-canvas.md`)

```markdown
# Architecture Canvas — 단일 진실 원천 (작성일: YYYY-MM-DD)

## 강의에 사용될 캔버스 인덱스
| ID | 제목 | 챕터 | 슬라이드 # | 가이드 § |
|---|---|---|---|---|
| C1 | Agent 4-요소 | Ch1 | S3 | §1.2 |
| ...

## 각 캔버스
### C1. Agent 4-요소 정의
**다이어그램 (텍스트 명세)**
```
┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐
│  Loop   │  │  Tools  │  │  State  │  │ Policy  │
│ (제어)  │  │ (액션)  │  │(메모리) │  │ (제약)  │
└─────────┘  └─────────┘  └─────────┘  └─────────┘
```
**기존 비유**: Reactor pattern — 단, dispatcher가 LLM이라 비결정적
**의사결정 기준**: 4요소 중 ≥3 보유 시 Agent로 분류
**핵심 메시지 (1줄)**: 챗봇은 1-shot, Agent는 loop가 본질
**가이드/슬라이드 양쪽에서 동일 표현 사용**: "Agent = Loop + Tools + State + Policy"

### C2. ...
```

## 다이어그램 표현 규칙
1. **텍스트 ASCII 또는 Mermaid 둘 중 하나** — 사용자 결정
   - ASCII: PT HTML과 가이드에서 그대로 코드블록으로 보여줄 수 있어 단순
   - Mermaid: HTML 슬라이드에서 렌더 가능, 깔끔하지만 환경 의존
2. **모든 다이어그램은 가이드와 슬라이드에서 픽셀 단위로 동일** — 두 산출물에서 다시 그리지 않는다, 이 파일이 원본
3. **버전 표시**: `<!-- canvas:C1 v2 -->` 같은 마커를 가이드/슬라이드에 박아 추적

## 절차
1. `01-curriculum.md` 읽기
2. 챕터별 핵심 슬라이드 후보 수만큼 캔버스 정의
3. 각 캔버스마다 사용자에게 핵심 메시지 한 줄 컨펌
4. 위 형식으로 작성
5. **시각화 후 검토 요청** — 사용자가 화이트보드에 직접 그려보겠다고 하면 ASCII로 출력해 보여줌

## 절대 하지 말 것
- 사용자 컨펌 없이 캔버스 12개 다 채우기 (강의 시간 초과)
- 슬라이드/가이드에서 이 파일과 다른 표현으로 다이어그램을 다시 그리기
- "예시"로 가짜 회사·사건 이름 만들어 넣기 (실명·실제 사건만)
