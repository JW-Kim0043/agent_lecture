---
name: agent-deck-reviewer
description: AI Agent 강의 슬라이드를 글로벌 세미나 수준의 완성도로 검증한다. 사실 정확성·인용 출처·흐름 연결·기술 깊이·청중 적합성을 5축으로 점검하고 개선 항목을 산출. "검증", "리뷰", "완성도", "글로벌 수준" 발화에서 호출.
metadata:
  type: review
---

# Agent Deck Reviewer — 글로벌 세미나 품질 검증

## 5축 검증 체크리스트

### 1. 사실 정확성 (Accuracy)
- [ ] 모든 발표일·버전·연도가 1차 출처와 일치 (Anthropic·OpenAI·Google·Microsoft)
- [ ] 인용 문구가 verbatim 또는 명시적 paraphrase
- [ ] 정량 수치(토큰·지연·비용)는 출처 표기
- [ ] 권위 자료 인용 — Russell & Norvig / Anthropic *Building effective agents* / OpenAI *A Practical Guide* / Google *Agents* / OWASP *LLM Top 10* / ISO 42010 / Bass 외 SEI

### 2. 흐름 연결 (Coherence)
- [ ] 각 장 표지에 "이전 → 이번 → 다음" 다리 한 줄
- [ ] 슬라이드 간 전환에 논리적 인과 (개념 → 적용 → 사례 → 검증)
- [ ] 6원칙(P1~P6) 라벨이 본문 챕터에서 일관되게 등장
- [ ] 4 메가트렌드(T1~T4) 인용 위치가 명확

### 3. 기술 깊이 (Depth)
- [ ] 각 분류 항목에 6필드(정의·적용·트레이드오프·적용기준·실패신호·체크포인트) 충족
- [ ] "이름만 나열"한 슬라이드 부재
- [ ] 적어도 3개의 공개 사례 분해 (Claude Code·Devin·Operator·Copilot Workspace 등)
- [ ] 적어도 3개의 공개 실패 사례 (Air Canada·Replit·EchoLeak·Bing/Sydney·NYC MyCity)
- [ ] 운영·관측·평가에 실제 도구·표준 명시 (OpenTelemetry GenAI 등)

### 4. 청중 적합성 (Audience Fit)
- 청중: 아키텍트(이해관계자 요구→트레이드오프→최적 설계+근거 제시 책임)
- [ ] 모든 의사결정에 "조건 → 권장 → 근거"
- [ ] 특정 벤더·프레임워크 강요 부재
- [ ] 구현 코드는 부록 격리 (강의 본문은 의사결정 중심)
- [ ] 비유는 핵심 1~2곳에만 (남발 금지)

### 5. 표현·디자인 (Style)
- [ ] 종결어미는 명사형 위주 (학습목표·체크는 동사형 허용)
- [ ] 비격식 어휘(들이댄다·잡는다·9할) 부재
- [ ] 모든 다이어그램은 Mermaid 또는 HTML 표 (ASCII 금지)
- [ ] 매트릭스는 sk-table 컬러 셀로 가독성 확보
- [ ] 각 슬라이드 ≤ 7줄 텍스트 (표·다이어그램 제외)

## 검증 산출
```markdown
# 검증 보고 — YYYY-MM-DD

## 점수 (5축)
- Accuracy: 4/5
- Coherence: 3/5  ← 보강 필요
- Depth: 5/5
- Audience Fit: 4/5
- Style: 5/5

## 보강 필요 항목 (우선순위 순)
1. {슬라이드 ID} {지적 사항} {제안}
2. ...

## 통과 항목
- ...
```

## 권위 출처 마스터 목록 (인용 시 사용)

| 출처 | 발표 | 인용 가능 항목 |
|---|---|---|
| Russell & Norvig, AIMA 4판 | 2020 | "환경 인지 → 행동" 정의, percept-action 함수 |
| Anthropic, *Building effective agents* | 2024-12 | Workflow vs Agent 정의, 5+1 패턴, augmented LLM |
| Anthropic, MCP 사양 | 2024-11 | MCP 표준 |
| Google, *Agents* whitepaper (Wiesinger 외) | 2024-09 | 모델·도구·오케스트레이션 3계층 |
| Google, A2A whitepaper | 2025-04 | 에이전트 발견·능력 카드 |
| OpenAI, *A Practical Guide to Building Agents* | 2025 | 에이전트 정의·구성 |
| OpenAI, Agents SDK / Responses API | 2025-03 | 도구 호출·세션 |
| OWASP, LLM Top 10 for Apps | 2025 | 인젝션·도구 권한 위협 |
| ISO/IEC/IEEE 42010 | 2022 | 아키텍처·이해관계자 정의 |
| Bass·Clements·Kazman, *Software Architecture in Practice* | 4판 | 아키텍트 역할·트레이드오프·ADR |
| Schick, BeeAI ACP | 2025 | ACP 사양 |
| OpenTelemetry GenAI semantic conventions | 2024~ | Trace/Span 표준 |
| IBM Cloud blog, Air Canada chatbot 판례 | 2024 | 챗봇 환불 사고 |
| Replit Agent 보고 | 2025 | DB 삭제 사고 |
| Aim Security, EchoLeak 보고 | 2025 | M365 Copilot 인젝션 |

## 사용 흐름
1. 슬라이드 전체를 5축으로 채점
2. 보강 필요 슬라이드를 agent-deck-deepener로 위임
3. 사실 정확성 의심 항목은 WebFetch로 1차 확인
4. 결과를 사용자에게 보고
