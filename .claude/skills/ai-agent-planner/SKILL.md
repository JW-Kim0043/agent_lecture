---
name: ai-agent-planner
description: AI Agent 2시간 강의의 커리큘럼·시간 배분·학습 목표·챕터 구성을 설계한다. SW/Cloud 아키텍트 → AI 아키텍트 전환을 목표로, 챕터별 분 단위 타임박스와 도착점을 정의. "커리큘럼", "챕터 구성", "강의 기획" 발화에서 호출.
metadata:
  type: planning
---

# AI Agent Planner — 2시간 커리큘럼 설계

## 언제 호출되나
- lecture-orchestrator Step 2
- "강의 챕터 짜자", "시간 배분", "학습 목표 정리"
- 트렌드 스냅샷(`00-trends-snapshot.md`)이 있다면 그것을 입력으로 활용

## 청중 가정 (반복 명시)
- 5~15년차 SW/Cloud 아키텍트
- MSA·이벤트드리븐·관측성·SRE 개념은 이해
- LLM·Agent 고유 용어는 풀어줘야 함 (e.g., "tokenizer는 알지만 'tool-call schema'는 처음일 수 있다")

## 기획 원칙
1. **익숙한 것에서 낯선 것으로**: 모든 새 개념은 기존 SW/Cloud 비유로 진입
   - Tool Use ≈ RPC + Schema validation
   - Multi-Agent ≈ MSA + 비결정적 라우팅
   - Agent Loop ≈ Reactor pattern + LLM이 dispatcher
   - Checkpointer ≈ Event Sourcing의 snapshot
2. **공식은 하나로 통일**: `Agent = Loop + Tools + State + Policy` — 강의 내내 반복되는 thread
3. **각 챕터 = 한 가지 의사결정 도구**: 챕터 끝나면 화이트보드에 그릴 수 있어야
4. **2026 신생 표준은 별도 챕터 가치 있음**: MCP/A2A/ACP는 1년 전엔 없었음
5. **120분 중 코드는 최대 15분**: 청중은 아키텍트, 구현보다 의사결정이 핵심

## 표준 챕터 골격 (2시간)
> 사용자와 상의해 조정 — 그대로 쓰지 말 것

| # | 챕터 | 분 | 도착점 | 핵심 비유/공식 |
|---|---|---|---|---|
| Opening | 표지·학습목표·로드맵 | 5 | 오늘 끝나면 무엇을 할 수 있나 | — |
| Ch1 | Agent란 무엇인가 | 15 | 챗봇 vs Agent 경계 정의 | Loop+Tools+State+Policy |
| Ch2 | 추론 패턴 진화 | 20 | ReAct→Plan-and-Act→Reflexion 의사결정 | Workflow vs Autonomy 스펙트럼 |
| Ch3 | Tool Use & MCP | 25 | Tool 4요소 + MCP 도입 시점 | RPC + Schema |
| Ch4 | Multi-Agent & A2A/ACP | 20 | 단일 vs 멀티 판단, 토폴로지 4종 | MSA의 비결정 버전 |
| Ch5 | State·Memory·Observability | 15 | Memory 3종 + Trace 설계 | Event Sourcing + APM |
| Ch6 | 안전·HITL·Eval·Cost | 15 | 프로덕션 체크리스트 | Circuit Breaker + Eval Harness |
| Closing | Q&A·체크리스트 | 5 | — | — |
| **합계** | | **120** | | |

## 학습 목표 (5개 권장)
강의 시작과 종료에서 동일하게 보여주는 5개 bullet. 끝나고 수강생 입으로 설명할 수 있어야 함.
1. 단순 LLM 호출과 Agent의 차이를 4요소로 설명
2. ReAct·ReWOO·Plan-and-Act·Reflexion을 비교하고 워크로드별 선택
3. MCP·A2A·ACP의 역할 분담과 도입 시점 판단
4. Single vs Multi-Agent 토폴로지 4종 의사결정
5. 프로덕션 Agent의 Observability·HITL·Cost 통제 체크리스트 제시

## 산출 형식 (`lecture/01-curriculum.md`)

```markdown
# 2시간 강의 커리큘럼 — AI Agent 아키텍처

## 청중 / 목표 / 컷오프
- 대상: SW/Cloud 아키텍트
- 컷오프: 2026-05
- 코어 thread: Agent = Loop + Tools + State + Policy

## 학습 목표 (5)
1. ...

## 챕터 타임박스
| Ch | 제목 | 분 | 도착점 | 비유 | 핵심 슬라이드 후보 수 |
| ... |

## 챕터별 상세
### Ch1. Agent란 무엇인가 (15분)
- 도착점: ...
- 슬라이드 후보:
  - 1.1 챗봇 vs Agent 비교표
  - 1.2 4요소 정의
  - 1.3 Agent가 만드는 5가지 새 문제
- 새로 다룰 용어: Loop, Tool-call, Trajectory, Trace
- 익숙한 것과의 다리: Reactor pattern, Event-driven Saga

## 위험 (시간 초과 가능성)
- Ch3 MCP 라이브 데모 → 5분 안에 끊을 것
- Ch4 토폴로지 비교 그림 그리기에서 칠판 의존도 ↑

## 사용자 결정 필요
- [ ] LangGraph 코드를 강의에 포함? (포함 시 +10분)
- [ ] HITL 챕터 별도 분리 vs Ch6 통합
```

## 절차
1. `00-trends-snapshot.md` 읽기 (있으면)
2. 표준 챕터 골격을 보여주고 **AskUserQuestion**으로 조정 항목 수집
3. 챕터별 분 단위 합이 정확히 120 되는지 검산 (Q&A·전환 포함)
4. 산출물 작성 → orchestrator로 복귀

## 작성 룰
- 챕터마다 "이 챕터를 듣고 나면 ___을 할 수 있다" 한 줄을 강제
- 슬라이드 후보 수만 적고, 실제 슬라이드 콘텐츠는 ai-agent-architect / pt-html 단계에서
- 챕터당 5장 이상 슬라이드 후보가 나오면 "분리 / 압축" 신호로 사용자에게 경고
