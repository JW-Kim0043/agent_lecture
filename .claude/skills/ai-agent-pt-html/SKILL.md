---
name: ai-agent-pt-html
description: 강의 중 띄울 HTML 슬라이드와 강사 스크립트를 생성한다. reveal.js / 정적 HTML / Marp 중 사용자 선택. ai-agent-architect의 캔버스 파일을 입력으로 사용해 가이드와 시각적 일관성을 보장. "슬라이드 만들자", "PT", "HTML 슬라이드" 발화에서 호출.
metadata:
  type: presentation
---

# AI Agent PT HTML — 슬라이드 + 강사 스크립트 빌더

## 언제 호출되나
- lecture-orchestrator Step 4-B
- 사용자가 "PT", "슬라이드", "HTML 띄우기" 발화
- 입력 의존: `lecture/01-curriculum.md` + `lecture/02-architecture-canvas.md`
- 가이드(`03-guide.md`)와 병렬 작업 가능 — 둘 다 canvas만 보면 됨

## 출력
- `lecture/04-slides.html` — 실제 띄울 HTML
- `lecture/04-slides-script.md` — 강사가 말할 [화면]/[스크립트] 분리본
- `lecture/assets/` — 외부 이미지 있으면 여기

## 슬라이드 시스템 옵션 (사용자 결정 / default: reveal.js)

| 옵션 | 장점 | 단점 |
|---|---|---|
| **reveal.js** (default) | 발표 중 단축키, 스피커뷰, 인쇄→PDF, fragment 애니메이션 | CDN 의존 (오프라인 시 호스팅 필요) |
| **정적 HTML** (기존 section-*.html 패턴) | 단일 파일, 어디서나 열림, PDF 변환 쉬움 | 페이지 넘김·스피커뷰 부재 |
| **Marp** | 마크다운→PPT/PDF, GitHub 친화 | 인터랙션 약함 |

## 슬라이드 디자인 원칙
1. **한 슬라이드 한 메시지** — 텍스트 줄 ≤ 7
2. **bullet은 명사구** — 문장은 스크립트로
3. **타이포 위계 3단**: 제목 / 부제 / 본문 — 그 이상은 인지 부하
4. **숫자·날짜에는 출처 footer** — "출처: spec.modelcontextprotocol.io" 등
5. **챕터 표지 슬라이드**: "Chapter N / 6" 위치 표시 — 학습자 위치 감각
6. **다이어그램은 canvas 파일에서 그대로** — 슬라이드용으로 다시 그리지 않음

## 슬라이드 카운트 가이드 (2시간)
- 총 50~70 슬라이드 (분당 0.5~0.6장)
- 챕터당 8~12장
- 표지 / 학습목표 / 챕터 표지 6장 / Closing 체크리스트 / Q&A 표지 = 약 10장 추가

## 표준 슬라이드 종류
| 타입 | 용도 | 본문 패턴 |
|---|---|---|
| Title | 표지·챕터 표지 | 큰 제목 + 한 줄 부제 |
| Definition | 핵심 정의 | 4-요소 박스 / 한 줄 공식 |
| Diagram | 캔버스 인용 | canvas ASCII/Mermaid 그대로 |
| Comparison | 표 | 좌우 비교 또는 매트릭스 |
| Decision Tree | 분기 | 마름모·박스 ascii 또는 Mermaid `graph TD` |
| Example | 사례 | 실제 회사·사건 (출처 footer) |
| Checklist | 체크리스트 | 6~10개 항목 |
| Q&A / Closing | 마무리 | 학습 목표 5 재확인 |

## 강사 스크립트 형식 (`04-slides-script.md`)
기존 `slides/section-3-slides-plan.md` 톤 참고만 — 새로 작성

```markdown
## Slide N — {제목}
**[화면]**
- (슬라이드에 실제 표시될 콘텐츠 bullet)

**[스크립트]**
> (강사가 말할 자연어. 시간: ~분)
> 비유 → 정의 → 의사결정 기준 → 한 줄 결론 순서.

**연결**: 다음 슬라이드 N+1로 어떻게 넘어가는가 (한 줄)
**캔버스 참조**: C{id} (canvas 파일 §{id})
```

## reveal.js 템플릿 골격 (default 선택 시)
```html
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>AI Agent 아키텍처 — 2시간 강의</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reset.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/theme/white.css">
  <style>
    /* 한국어 가독성용 폰트, 코드 블록 색상, ascii diagram 박스 */
    .reveal pre code { font-family: 'D2Coding','Menlo',monospace; line-height: 1.4; }
    .reveal .canvas-ref { font-size: 0.5em; color: #888; position: absolute; bottom: 1rem; right: 1rem; }
  </style>
</head>
<body>
  <div class="reveal"><div class="slides">
    <!-- canvas:C1 --> <section>...</section>
  </div></div>
  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5/dist/reveal.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/reveal.js@5/plugin/notes/notes.js"></script>
  <script>Reveal.initialize({ hash: true, plugins: [RevealNotes] });</script>
</body>
</html>
```

## 캔버스 참조 규칙 (가이드와 동일)
- 슬라이드의 다이어그램·표는 **canvas 파일에서 그대로 가져와야 함**
- HTML 주석으로 `<!-- canvas:C{id} v{n} -->` 박아 추적
- canvas가 갱신되면 슬라이드/가이드 양쪽 동시에 갱신해야 함 (orchestrator가 점검)

## 절차
1. `01-curriculum.md` + `02-architecture-canvas.md` 읽기
2. 슬라이드 시스템 / 디자인 톤 / 분량 cap 사용자 컨펌
3. 챕터 1개의 슬라이드 + 스크립트 먼저 작성 → 사용자 검토
4. OK 받으면 나머지 챕터 일괄
5. 표지·학습목표·챕터 표지·Closing 일괄
6. 자체 점검: 슬라이드 다이어그램 ↔ canvas 정합성, 슬라이드 수 cap 준수
7. (선택) 브라우저로 직접 열어 동작 확인 후 사용자에게 경로 안내

## 절대 하지 말 것
- 가이드(`03-guide.md`)에 없는 새 사실을 슬라이드에 추가 (canvas 거치지 않은 도입 금지)
- 실명 사례를 추측으로 적기 — 출처 없으면 일반화 표현으로
- 슬라이드 한 장에 7줄 초과 텍스트 — 인지 부하
- 기존 `slides/section-3.html` 스타일 그대로 복사 (사용자가 새 디자인 요청)
- 프레임워크 코드를 30줄 이상 한 슬라이드에 — 강의용 슬라이드는 발췌
