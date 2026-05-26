# 05-spec-research.md — 조사 결과 통합 (CP-1 NEW 콘텐츠용)

> 작성일: 2026-05-26 / 컷오프: 2026-05
> 본 문서는 `05-spec.md`의 NEW 슬라이드(05·06·17·20·34·36·37·38) 채움에 사용될 1차 출처·수치·캡션 모음.
> 슬라이드 작성 시 이 문서를 단일 reference로 사용. 출처는 모두 1차 자료 확인 완료.

---

## §A. Ch1 슬라이드 05 — AI 중심 개발 정량 통계 (5 수치)

### A1. 추천 5 수치 — 슬라이드 압축용

| # | 수치 | 의미 | 1차 출처 |
|---|---|---|---|
| 1 | **85%** | 전 세계 개발자 5명 중 4명이 AI 도구를 정기 사용 (n=24,534, 194개국) | JetBrains DevSurvey 2025 (2025-10) |
| 2 | **80%** | GitHub 신규 가입자가 첫 1주 안에 Copilot을 켠다 | Octoverse 2025 (2025-10) |
| 3 | **PR 100만 건+** | Copilot Coding Agent가 5개월(2025-05~09)에 작성한 PR 수 | Octoverse 2025 |
| 4 | **+67% / 16%→54%** | Anthropic 사내, Claude Code 도입 후 머지 PR/인/일 증가율 / Code Review substantive 피드백 비율 | Anthropic Research (2025-12-02) |
| 5 | **88% 도입 vs 6% 고성과** | 조직의 88%가 AI 사용, EBIT까지 옮긴 곳은 6% | McKinsey State of AI 2025 (2025-11) |

### A2. 캡션 (한국어 한 줄)

1. "쓰느냐 마느냐는 끝난 토론 — 5명 중 4명"
2. "새 세대에게 AI는 IDE의 일부"
3. "자동화 단위는 함수가 아니라 PR"
4. "AI를 만든 회사가 먼저 자기 코드에 AI를 박았다"
5. "도입은 끝났고, 이제 EBIT까지 잇는 아키텍처가 차이를 만든다"

### A3. 출처 URL

- Octoverse 2025: https://github.blog/news-insights/octoverse/octoverse-a-new-developer-joins-github-every-second-as-ai-leads-typescript-to-1/
- JetBrains 2025: https://blog.jetbrains.com/research/2025/10/state-of-developer-ecosystem-2025/
- McKinsey 2025: https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai
- Anthropic Research: https://www.anthropic.com/research/how-ai-is-transforming-work-at-anthropic

---

## §B. Ch1 슬라이드 06 — AI 중심 개발 운영 사례 3건

### B1. Case A · Anthropic 사내 (글로벌 — AI 제조사)

- **시점**: 측정 2024-09~2025-08, 발표 2025-12-02
- **요약**: 직원 132명 설문 + 53명 인터뷰 + Claude Code 트랜스크립트 20만 건 분석. 업무에서 Claude 사용 비중 **28%→59%** (1년), 자가보고 생산성 **+20%→+50%**. Code Review 도입 후 substantive 피드백 **16%→54%**, AI 의견 반대율 **<1%**. 머지 PR/인/일 **+67%**.
- **시사점**: 도구가 아니라 **SDLC 토폴로지**가 바뀐 사건. PR/리뷰/CI가 에이전트의 단위로 재설계됨.
- **출처**: anthropic.com/research/how-ai-is-transforming-work-at-anthropic

### B2. Case B · Cognition Devin (글로벌 — 자율 SWE 에이전트)

- **시점**: GA 2024-12, 1주년 회고 2025-11-14
- **요약**: Devin이 GitHub 이슈를 받아 자율로 브랜치/PR 생성. 1년간 PR 머지율 **34%→67%**, 문제 해결 속도 **4배**, 자원 효율 **2배**. Goldman Sachs(12,000명), Santander, Nubank, EightSleep 사내 도입. Nubank ETL 마이그레이션 — **1.5년 → 2개월** (인시 **12배**, 비용 **20배+** 절감). 보안 취약점 픽스 인간 30분 → Devin 1.5분 (**20배**).
- **시사점**: 비용·시간이 가장 줄어드는 영역은 **migration·security fix·테스트 커버리지** — "재미없지만 양 많은 일". 아키텍트는 이 카테고리를 먼저 에이전트화하는 **분배 정책(Routing Policy)**부터 설계.
- **출처**: cognition.ai/blog/devin-annual-performance-review-2025

### B3. Case C · SK플래닛 GitHub Copilot 실험 (한국 — 정량 공개)

- **시점**: 측정 2024, 발표 2024-08-30
- **요약**: 개발자 30명을 두 그룹(SDE/Web3, Data/Infra)으로 나눠 Copilot 사용 vs 미사용 군의 동일 과제 시간 측정. 완료 시간 **-41.7% / -40.7%**, 개발 속도 **1.71배 / 1.68배**. 데이터 작업 — 테이블 200개·컬럼 5,000개 코멘트 작성 **2일 → 2시간**. 체감 생산성 100% 긍정, 사용 중단 시 **85.7%가 생산성 하락 예상**.
- **시사점**: 한국에서 정량 데이터를 공개한 거의 유일한 1차 자료. 한국도 글로벌과 같은 **1.5~2배 속도 게인**이 재현됨. 같은 기간 삼성전자 사내 'Cline' 베타(2025-06), 우아한형제들 Copilot 사내 지원(2025-02) 사례 보조 인용 가능.
- **출처**: techtopic.skplanet.com/github-copilot/

### B4. (보조) 한국 사례 보조 칩

- 삼성전자 DX 부문 'Cline' 베타 도입 (2025-06) — etnews.com/20250608000021
- 우아한형제들 Copilot 사내 지원 (2025-02) — techblog.woowahan.com/21240/
- (Ch5에서 카카오·네이버 사례 별도 인용)

---

## §C. Ch3 슬라이드 20 — MCP 2026 갱신 정보

- **MCP 사양 갱신** (2025-11): Async · Stateless · Server identity 추가
- **Claude Skills** (2025-10-16 발표 → 2025-12 오픈 표준 공개): 재사용 가능한 instruction-set 패키지. MCP가 "도구 연결 표준"이라면 Skills는 "워크플로·지식 패키지 표준". Canva·Notion·Figma·Atlassian 합류.
- **Smithery / MCP Registry** 성숙: 650+ Server, OAuth 1급 지원
- **거버넌스**: 2026 Linux Foundation Agentic AI Foundation으로 이관 (Anthropic·OpenAI·Google·MS·AWS 후원)
- **출처**: anthropic.com/news/skills · venturebeat · The New Stack

---

## §D. Ch5 슬라이드 36 — 기술 진화 2026-05 갱신

### D1. Reasoning 1급화

- **OpenAI**: o3 / o3-pro / o4-mini (2025-04~06). 2025-07 ChatGPT Agent에 o3 기반 CUA 통합.
- **Anthropic**: Opus 4.6(2026-02-04)/Sonnet 4.6(2026-02-17)부터 **"binary extended thinking" 폐기 → "Adaptive Thinking" 디폴트**. 모델이 복잡도에 따라 thinking 토큰 자동 조절.
- **Google**: Gemini 3 Pro(2025-11) / Deep Think / 3.1 Pro(2026-02) / 3.5 Flash / Omni(2026-05-19). `thinkingLevel` 파라미터 표준화.
- **시사점**: "이 단계는 reasoning ON/OFF?"가 아키텍트 의사결정 매트릭스의 **새 축**.

### D2. Skills 생태계 (MCP 보완)

- Anthropic Agent Skills (2025-10-16 발표, 2025-12 오픈 표준)
- Claude.ai · Claude Code · API 전 영역 지원
- Skills = "워크플로 패키지 표준" (MCP는 "도구 연결 표준")
- 비교 — OpenAI GPTs Store(2024-01)는 챗 중심, MCP/툴 표준화 약함

### D3. Computer Use / Browser Use

- **Anthropic Computer Use** (2024-10 베타 → 2026-05 여전히 public beta, Q4 2026 GA 전망)
- **OpenAI Operator**(2025-01) → **2025-07 ChatGPT Agent 통합** (operator.chatgpt.com 사이트 sunset)
- **Microsoft Copilot Studio** computer-use **2026-05-13 GA** (production 1번 타자)
- **Anthropic ↔ Microsoft**: M365 Copilot에 Claude 기본 활성화 (2026-01-07)
- "GUI Action" W3C 표준화는 **확인 안 됨** (WebMCP 등 제안 단계)

### D4. Agentic Memory 분리

- **시장**: 2025 $6.3B → 2030 $28.5B (35% CAGR)
- **4파전**: Letta (구 MemGPT, 3-tier 메모리) · Zep (양방향 시간 지식 그래프) · Mem0 (프레임워크 무관, 48k+ stars) · LangMem (LangGraph 통합)
- **추세**: Short / Episodic / Semantic / Procedural **4분류 산업 표준화**. 메모리가 LLM 컨텍스트 안 부수 기능이 아니라 **별도 아키텍처 컴포넌트 + 벤더 카테고리**로 분리.

### D5. 슬라이드 압축 (4 메가트렌드 표 옆 보강 박스 4)

- **Reasoning 1급화** · Adaptive Thinking / thinkingLevel / o-series 통합 — reasoning이 별도 모델이 아닌 모든 모델의 기본 파라미터
- **Skills 생태계** · 2025-10 발표, 2025-12 오픈 표준 — MCP 보완 워크플로 패키지 표준
- **Computer Use 성숙** · Anthropic beta 유지 / MS Copilot Studio 2026-05 GA — production 1번 타자
- **Agentic Memory 분리** · Letta·Zep·Mem0·LangMem 4파전 — 메모리가 독립 컴포넌트로 캔버스 진입

---

## §E. Ch5 슬라이드 37 — 거버넌스·규제 4 (★ NEW 전체)

### E1. Korea AI 기본법 (중심)

- **공식명**: 「인공지능 발전과 신뢰 기반 조성 등에 관한 기본법」 (법률 제20676호)
- **공포**: 2025-01-21 / **시행**: **2026-01-22** / 계도기간 1년 이상 (과태료 사실상 2027 초~)
- **고영향 AI 영역** (시행령 입법예고 2025-11-12): 채용 · 대출심사 · 의료 · 교통 · 에너지 · 공공서비스 의사결정 · 법 집행
- **사업자 의무**:
  - **투명성 고지** (위반 3천만 원 이하 과태료)
  - **AI 결과물 표시** (생성형·딥페이크 명확 표시 의무)
  - 위험관리방안 + 설명 방안 + 이용자 보호 방안 + 사람의 관리·감독
  - 영향평가 — **노력 의무** (현재)
- **기반 모델 의무**: 누적 학습 연산량 ≥ **10²⁶ FLOPs** (EU의 10²⁵보다 한 단계 높음) — 위험 식별·평가·완화, MSIT 보고
- **국외 사업자 국내대리인** 지정 의무 (글로벌 매출 1조 이상 또는 한국 매출 100억 이상)
- **출처**: law.go.kr (법률 제20676호) · moleg.go.kr 입법예고 · korea.kr 정책브리핑

### E2. EU AI Act (한국 진출 기업 영향)

- **발효**: 2024-08-01 / **단계 시행**:
  - 2025-02 금지 AI + AI literacy
  - 2025-08 GPAI 의무 시작
  - **2026-08-02 고위험 AI 본격 + 페널티 시행** (기준일)
  - 2027-08 grandfather 기한
  - **★ 2026-05-07 EU "AI Omnibus" 잠정 합의** — 고위험 적용일을 stand-alone 2027-12 / 제품내장형 2028-08로 연기 제안. 정식 채택 전 → **운영상 2026-08 유지**
- **GPAI 의무**:
  - 일반 GPAI (≥10²³ FLOPs): 기술 문서, 학습데이터 요약, 저작권 정책
  - 시스템 위험 (≥10²⁵ FLOPs): 모델 평가·적대적 테스트·시리어스 사고 보고. **2주 내 Commission 통보**
- **제재**: 금지 위반 €35M 또는 매출 7%, GPAI 위반 €15M 또는 3%
- **한국 영향**: 역외 적용 — EU 진출 한국 기업의 사실상 글로벌 기준
- **출처**: digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai

### E3. NIST AI RMF + GenAI Profile

- **발표**: 2023-01 (1.0), GenAI Profile 2024-07 (NIST-AI-600-1)
- **4 Core Functions**: Govern · Map · Measure · Manage
- **2026-04 후속**: Critical Infrastructure Profile 컨셉 노트, 2026 중 SP 800-53 Control Overlays for AI (연방 시스템용) 예정
- **채택**: 미국 연방기관 OMB M-24-10 이후 사실상 표준 + Microsoft·Google·IBM·AWS 거버넌스 기준점
- **시사점**: 한국 기업도 4 함수를 **내부 AI 거버넌스 체크리스트 뼈대**로 사용. GenAI Profile 12 위험은 EU AI Act 시스템 위험 평가에 직접 매핑.

### E4. ISO/IEC 42001:2023 (AI Management System)

- **발행**: 2023-12-18 — 세계 최초의 **AI 관리시스템(AIMS) 인증 표준**
- **구조**: ISO 27001과 동일 PDCA, 부속서 D에 ISO 표준 매핑
- **2026-05 인증 보유**: Microsoft Azure AI · SAP Joule/AI Core · Anthropic · Miro · AWS 일부
- **한국**: LG CNS · 삼성SDS 등 시스템 인티그레이터 중심 인증 추진 (2025-2026)
- **Gartner 전망**: 2026년까지 엔터프라이즈 **70% 이상이 ISO 42001 또는 유사 표준 채택**
- **채택 동기**: EU AI Act 고위험 시스템 추정 적합성 + B2B 조달 + 한국 AI 기본법 위험관리방안 입증

### E5. ★ 아키텍트가 알아야 할 4 의무

| # | 의무 | 정의 | 요구 규제 | 산출물 |
|---|---|---|---|---|
| 1 | **사전 영향평가** | 배포 전 사람·기본권 영향 평가·문서화 | Korea(노력) · EU AI Act(FRIA 필수) · NIST(Map) · ISO 42001 | 영향평가 보고서, 위험등급표, 완화조치 |
| 2 | **트레이스·감사 로그 보존** | 입력·출력·도구호출·결정 근거를 추적 가능하게 보존 | 4 규제 모두 (EU Art.12 logging 등) | Trace 스토어, 보존정책, 재현 절차 |
| 3 | **Eval · 회귀 슈트** | 출시 전·운영 중 안전성·성능 정량 평가 | EU GPAI · NIST Measure · ISO 42001 · OWASP | Eval 데이터셋, 회귀 리포트, 적대적 테스트 |
| 4 | **투명성·표시** | AI 사용 사실·AI 결과물 명시 (워터마크·딥페이크 표시) | Korea(강행) · EU(Limited risk) · ISO 42001 | UI 고지, 워터마크, 모델 카드 |

### E6. 슬라이드 압축 캡션

| 규제 | 한 줄 |
|---|---|
| Korea AI 기본법 | "2026-01-22 시행. 고영향 AI는 사전 고지·영향평가, 10²⁶ FLOPs 모델은 정부 보고" |
| EU AI Act | "2026-08-02 고위험 본격 시행. 매출 7% 과징금 — EU 진출 한국 기업의 글로벌 기준" |
| NIST AI RMF | "Govern·Map·Measure·Manage + GenAI Profile 12 위험이 거버넌스 뼈대" |
| ISO/IEC 42001 | "AI판 ISO 27001. 2026년 엔터프라이즈 70% 채택 전망" |
| OWASP LLM Top 10 (2025) | "Prompt Injection 여전 1위, System Prompt Leakage·Vector Weakness 신규" |

### E7. 강사 강조 포인트

1. **한국 vs EU 과징금 격차** — 3천만 원 vs 매출 7%. "EU 진출하는 순간 EU 기준이 회사 기준"
2. **EU Omnibus 연기 잠정 합의** (2026-05-07) — 슬라이드는 2026-08 기준 유지 + 각주
3. **노력 의무 vs 강행 의무** — 한국 영향평가는 노력이지만, 사고 시 책임 입증의 핵심 증거 — "사실상 강행"
4. **10²⁶ FLOPs 임계** — GPT-4·Claude·Gemini 최상위 이미 근접·초과. 한국 임계가 EU(10²⁵)보다 한 단계 높아 국내 자체 LLM은 거의 미해당, 외산 도입 시 공급사 의무

---

## §F. Ch5 슬라이드 38 — 조직·역할 변화 + 도입 매트릭스

### F1. AI Orchestrator 역할 (4 카드)

1. **AI 오케스트레이터 역할** — 코드 작성자 → **에이전트 팀의 지휘자(conductor)**. 가드레일 임베드해 자율성을 안전하게 확장. *제어→맥락*, *코드→시스템 지휘*. (Eightfold "2026 가장 중요한 직무" / Deloitte 2026 Tech Trends "Great Rebuild")
2. **AI CoE 모델** — Hub-and-spoke 하이브리드가 디폴트. 표준·플랫폼·거버넌스는 중앙, 도메인 사용 사례는 현업. (AWS/Tredence/Ideas2IT 공통 권장)
3. **Engineering 조직 재편** — Squad 축소, **"1 오케스트레이터 + N 시니어 + N 에이전트"** 비율 부상. **카카오 'Kakao Reengineering'** (if(kakao)25, 2025-09) · **네이버 CIC 5개→12개 전문조직** 재편 · **카카오 CAIO 신설**(이상호 전 SKT CTO)
4. **아키텍트의 5년 후** — **91% 고성숙 조직이 전담 AI 리더 보유** (Gartner). 5~15년차 SW/Cloud 아키텍트의 다음 트랙: AI Platform Architect / Head of AI Engineering / CAIO

### F2. 산업 트렌드 수치

- **Gartner 예측**: 2026년 말까지 **엔터프라이즈 앱의 40%가 task-specific AI 에이전트 탑재** (2025년 5% 미만에서)
- **Gartner 조사**: 91% 고성숙 조직 vs 37% 저성숙 조직이 전담 AI 리더 보유. CDAO의 70%가 AI 전략·운영 책임
- **Deloitte 2026 Tech Trends**: "Architecting an AI-native tech organization" 키워드

### F3. 도입 우선순위 매트릭스 (기존 04-slides 6.2 재사용)

- 가로축 — 조직 성숙도 (낮음 · 중간 · 높음)
- 세로축 — 워크로드 위험 (낮음 · 중간 · 높음)
- 셀 권장:
  - 낮음 × 낮음 — 보류 (학습)
  - 낮음 × 중간 — T2 (표준 도입)
  - 낮음 × 높음 — T4 (견고성)
  - 중간 × 중간 — T2 / T4 혼합
  - 중간 × 높음 — T4
  - 높음 × 낮음/중간 — T1 / T2
  - 높음 × 높음 — T4 / T1

### F4. 슬라이드 38 레이아웃 (좌우 분할)

- **좌측** — 조직 변화 4 카드 (위 F1)
- **우측** — 도입 우선순위 매트릭스 (F3) + 한국 사례 칩 (카카오·네이버·SK플래닛 위치)

### F5. 출처

- Eightfold "Most Important Job of 2026"
- Gartner "40% Enterprise Apps Will Feature Task-Specific AI Agents by 2026"
- Deloitte 2026 Tech Trends
- 카카오 if(kakao)25 발표 (PlayMCP, Kanana, Agentic AI Builder)
- 카카오·서울경제 보도 (CA협의체 슬림화, CAIO 신설)

---

## §G. Ch3 슬라이드 17 — 기술 스택 한 장 다이어그램

(NEW 슬라이드 — SVG 디자인)

**구조 제안** — 중심에 Loop, 주변에 4 슬롯, 외부에 확장

- 중심: **Loop** (사고-행동-관찰 사이클) 안에 추론 (ReAct/ReWOO/Plan-Execute/Reflexion/Reasoning) 표기
- 좌: **Tools** (MCP · Function Calling · Tool Registry)
- 우: **State** (Checkpointer · 직렬화)
- 상: **Memory** (Short / Episodic / Semantic / Procedural)
- 하: **Policy** (HITL · Budget · Allowlist · Sandbox)
- 외부 확장: **Multi-Agent** (A2A·ACP) — 동일 구조의 다른 Agent와 연결

레이아웃은 Swiss Modern — 박스 + 가는 라인, 빨강 accent로 Loop 강조.

---

## §H. Ch2 슬라이드 14 — Agent 적용 비즈니스 시나리오 3 (확정)

1. **고객서비스 자동화** — 1차 문의 분류·자율 처리, 복잡 케이스만 인간 에스컬레이션
2. **코드 개발 자동화** — Claude Code / Devin 류, IDE 내 다단계 작업 + PR 자동 생성
3. **운영 자동화** — 장애 분류·진단·자동 대응 액션 (SRE 영역)

---

## §I. 보조 — 한국 사례 인용 가능 리스트

| 영역 | 회사 | 사례 | 인용 슬라이드 | 출처 |
|---|---|---|---|---|
| AI 도입 정량 | SK플래닛 | Copilot 30명 실험 (-41.7% 시간) | 06 운영사례 메인 | techtopic.skplanet.com/github-copilot |
| AI 도입 정량 | 삼성전자 | 'Cline' 베타 도입 (2025-06) | 06 보조 칩 | etnews.com/20250608000021 |
| AI 도입 정량 | 우아한형제들 | Copilot 사내 지원 (2025-02) | 06 보조 칩 | techblog.woowahan.com/21240/ |
| 조직 재편 | 네이버 | CIC 5→12 전문조직 재편 (2024-25) | 38 조직 변화 | 서울경제 |
| 조직 재편 | 카카오 | CAIO 신설 + CA협의체 슬림화 (2026-01) | 38 조직 변화 | 카카오 뉴스룸 |
| 기술·플랫폼 | 카카오 | if(kakao)25 PlayMCP / Kanana / Agentic AI Builder | 36/38 | 카카오 뉴스룸 (2025-09) |

---

> 이 문서는 HTML 슬라이드 작성 시 **단일 출처** 역할.
> 슬라이드 본문에는 각주 형식으로 출처 약식 표기 (예: "JetBrains 2025 · Octoverse 2025"). 전체 URL은 슬라이드 40 참고문헌에 통합.
