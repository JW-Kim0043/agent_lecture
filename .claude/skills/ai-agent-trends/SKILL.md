---
name: ai-agent-trends
description: 2026년 5월 시점 AI Agent 분야 최신 트렌드를 수집·정제하여 강의에 반영할 항목을 정한다. "최신 트렌드", "요즘 Agent 흐름", "MCP/A2A/Skills 정리" 같은 발화에서 호출. 강의 자료의 시간 정합성을 책임지는 skill.
metadata:
  type: research
---

# AI Agent Trends — 2026-05 컷오프 트렌드 큐레이터

## 언제 호출되나
- 강의 자료 작성 첫 단계 (lecture-orchestrator Step 1)
- 사용자가 "이건 아직 유효한가?", "최근에 바뀐 건?" 하고 물을 때
- 가이드/슬라이드에서 어떤 표준·도구를 언급할지 망설일 때

## 책임 영역
1. 2026-05 기준 **유효한 트렌드와 deprecate 된 것**을 구분
2. 각 트렌드의 **출처(공식 문서/논문/벤더 발표)** 메모
3. "왜 이 트렌드가 아키텍트에게 중요한가"를 한 줄로
4. **추측 금지**: 확실하지 않으면 WebFetch/WebSearch 또는 사용자 확인을 거친다

## 강의 컷오프(2026-05) 시점에 다뤄야 할 트렌드 풀
> 이 목록은 **출발점**이지 결론이 아님. 사용자와 상의해 확정한다.

### A. 추론 패턴
- ReAct → ReWOO → Plan-and-Act → Tree-of-Thoughts/LATS → Reflexion
- **Reasoning model 통합**: o3·Claude 4.x extended thinking을 Agent loop에 어떻게 끼우나

### B. 표준 프로토콜 (★ 2025~2026 신생, 별도 챕터 가치 있음)
- **MCP (Model Context Protocol)** — Anthropic 발 Tool 표준, 2025년 후반 사실상 산업 표준화
- **A2A (Agent-to-Agent)** — Google 주도 Agent 간 통신
- **ACP (Agent Communication Protocol)** — 멀티 Agent 오케스트레이션
- **Skills** — Anthropic 발, Agent에게 절차적 능력을 추가하는 패키지 단위
- **Computer Use** — 스크린샷·키보드·마우스 기반 일반화 액추에이터

### C. 메모리·상태
- Agentic Memory (Mem0, LangMem, Letta 등) 단/장기 분리
- Episodic / Semantic / Procedural 구분
- Checkpointer + Time-travel debugging (LangGraph)

### D. Multi-Agent 토폴로지
- Supervisor / Hierarchical / Network / Swarm
- "언제 단일 Agent로 충분한가" — Anthropic의 Building effective agents 가이드

### E. 프레임워크 지형
- LangGraph (StateGraph + Checkpointer)
- OpenAI Agents SDK
- AutoGen (MS), CrewAI, LlamaIndex Agents
- DSPy(프롬프트 컴파일) — Agent로 흡수되는 양상

### F. 안전·신뢰
- HITL (Human-in-the-Loop) 패턴: Approve / Edit / Reject
- Guardrails (입출력 필터, Tool Allowlist)
- Eval: AgentBench, τ-bench, SWE-bench-Verified

### G. 비용·관측
- Agent별 비용 회계 (per-trace cost)
- LLMOps 관측: LangSmith, LangFuse, Arize Phoenix
- Token-aware routing, cascade 모델 선택

## 산출 형식 (`lecture/00-trends-snapshot.md`)

```markdown
# AI Agent Trends — Snapshot (작성일: YYYY-MM-DD, 컷오프: 2026-05)

## 강의에 포함할 트렌드 (확정)
| # | 트렌드 | 카테고리 | 깊이 | 강의 챕터 | 핵심 메시지 | 출처 |
|---|---|---|---|---|---|---|
| 1 | MCP | B | 깊게 | Ch3 | Tool 표준화로 N×M 통합 문제 해결 | spec.modelcontextprotocol.io |
| ... | | | | | | |

## 강의에서 제외 (이유 명시)
- DSPy: 청중 레벨에서 프롬프트 컴파일까지 들어가면 시간 초과
- Computer Use: 데모 환경 부재로 슬라이드 1장 언급만

## Deprecate / 주의
- 2024년 ReAct-only 가이드들: 현 시점에 Plan-and-Act/Reflexion 함께 가르쳐야

## Open Questions (사용자 확인 필요)
- [ ] Memory 챕터를 별도로 둘지, Tool 챕터에 흡수할지
```

## 절차
1. 사용자에게 강의 시간(2시간)·청중(SW/Cloud 아키텍트)·이미 결정된 챕터가 있는지 확인
2. 위 트렌드 풀을 보여주고 **AskUserQuestion**으로 1차 필터
3. 선택된 트렌드별로 필요시 WebSearch/WebFetch (불확실한 것만 — 시간 절약)
4. 산출물 작성 후 사용자 승인 → orchestrator로 복귀

## 작성 룰
- 모든 버전·날짜는 **출처 링크와 함께**
- "최신"이라 쓰지 말고 "2026-05 기준"으로 명시 — 1년 뒤에도 해석 가능하게
- 한 항목당 3줄 이내, 길어지면 별도 노트 파일로 분리
