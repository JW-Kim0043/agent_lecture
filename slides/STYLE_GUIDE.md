# AI 에이전트 아키텍처 강의 — 슬라이드 양식 가이드

> 이 문서는 `AI에이전트-아키텍처-강의-v2.html`의 양식을 향후 작업에서도 일관되게 유지하기 위한 가이드입니다.
> 새 슬라이드를 추가하거나 기존 슬라이드를 수정할 때 이 문서를 참조하세요.

---

## 1. 디자인 시스템

### 1.1 색상 토큰 (CSS 변수)

| 변수 | 값 | 용도 |
|------|------|------|
| `--bg` | `#ffffff` | 기본 배경 |
| `--bg-grid` | `#f5f5f5` | 그리드 라인 |
| `--ink` | `#0a0a0a` | 본문 텍스트, 강한 강조 |
| `--ink-soft` | `#3a3a3a` | 본문 부연 |
| `--ink-mute` | `#8a8a8a` | 출처, 메타 정보 |
| `--rule` | `#e5e5e5` | 구분선 |
| `--accent` | `#ff3300` | 강조색 (빨강) |
| `--accent-soft` | `#ffe5de` | 강조 배경 (연빨강) |
| `--orange` | `#f58220` | 보조 강조 |
| `--orange-soft` | `#ffe8d9` | 보조 강조 배경 |

**사용 원칙**
- accent(빨강)는 **각 슬라이드에 1~2곳만** 적용. 너무 많이 쓰면 강조 효과 사라짐.
- 표 행 강조는 `style="background: var(--accent-soft);"` 한 행에만.
- 하이라이트 단어는 `<span class="hl">단어</span>`.

### 1.2 폰트

| 폰트 | 용도 |
|------|------|
| `Archivo` (--font-display) | 슬라이드 제목, 카드 헤딩, 큰 숫자 |
| `Nunito` (--font-body) | 본문 텍스트 |
| `JetBrains Mono` (--font-mono) | 출처, 메타, 라벨, 코드 |

---

## 2. 슬라이드 기본 구조

### 2.1 일반 콘텐츠 슬라이드 (가장 흔함)

```html
<section class="slide" data-title="섹션 제목 (TOC용)">
    <header class="slide-header">
        <span class="section-marker">CH1 · 1.1</span>
        <span class="slide-num">04 / 40</span>
    </header>
    <div class="slide-content">
        <h2 class="slide-title reveal">
            제목 텍스트 <span class="hl">강조 부분</span>
            <span class="sub">부제 — 자연스러운 한국어 한 줄</span>
        </h2>
        <!-- 본문 컴포넌트 -->
    </div>
</section>
```

**규칙**
- `data-title`은 nav-dots 라벨에 표시. 짧고 명확하게.
- `section-marker`는 `CH숫자 · 소제목번호` 형태 (예: `CH1 · 1.1`, `CH4 · 4.2`).
- `slide-num`은 `XX / 40` 형태.
- 본문 요소에 `class="reveal"`을 붙이면 등장 애니메이션. `data-i="2"` 등으로 순서 지정.

### 2.2 챕터 디바이더

```html
<section class="slide chapter-divider" data-title="Chapter 1">
    <header class="slide-header">
        <span class="section-marker">AGENT</span>
        <span class="slide-num">03 / 40</span>
    </header>
    <div class="slide-content">
        <div class="chapter-marker reveal">Chapter 1 / 5</div>
        <div class="chapter-bignum reveal" data-i="2">01<span class="of">/5</span></div>
        <h2 class="chapter-title reveal" data-i="3">
            제목 <span class="hl">강조</span>
        </h2>
        <div class="chapter-questions reveal" data-i="4">
            <div class="chapter-q-label">이 챕터에서 답할 질문</div>
            <ul>
                <li>질문 한 줄</li>
                <li>질문 한 줄</li>
            </ul>
        </div>
        <div class="chapter-bridge reveal" data-i="5">
            <span class="line"><b>이번 장.</b> 흐름 요약</span>
            <span class="line"><span class="accent">다음 장.</span> 다음으로 넘어갈 주제</span>
        </div>
    </div>
</section>
```

### 2.3 표지 (.title-slide), 종료 (.end-slide)

표지 — 슬라이드 1, 종료 — 슬라이드 39 형태로 1회씩 사용.

### 2.4 Break 슬라이드

```html
<section class="slide break-slide chapter-divider" data-title="Coffee Break">
    <header class="slide-header">
        <span class="section-marker">SESSION 1 / 2</span>
        <span class="slide-num">24 / 40</span>
    </header>
    <div class="slide-content">
        <div class="chapter-marker">Session 1 End · Coffee Break</div>
        <div class="big-time">15<span class="accent">'</span></div>
        <div class="break-sub">15 minutes</div>
        <p>여기까지 — <b>요약 한 줄</b>.</p>
        <div class="break-next">다음 — 진행될 주제</div>
    </div>
</section>
```

---

## 3. 재사용 컴포넌트 카탈로그

### 3.1 카드 (col-card)

```html
<div class="col-card">          <!-- 기본 -->
<div class="col-card accent">   <!-- 강조 (빨강 배경) -->
<div class="col-card muted">    <!-- 약한 (회색 배경) -->
```

```html
<div class="col-card">
    <h3>카드 제목 <span class="sub">부연</span></h3>
    <p class="quote">한 줄 요약</p>          <!-- 옵션 -->
    <ul class="dash-list">                   <!-- 권장: dash-list -->
        <li>항목 한 줄</li>
        <li><b>강조</b><span class="sub-line">부연</span></li>
    </ul>
    <div class="source">출처 / URL</div>     <!-- 옵션 -->
</div>
```

**언제 쓰나** — 한 슬라이드에 2~3개의 동등한 정보 블록을 나란히 둘 때.

### 3.2 표 (slide-table)

```html
<table class="slide-table tight">
    <thead>
        <tr>
            <th style="width: 30%;">컬럼 1</th>
            <th style="width: 50%;">컬럼 2</th>
            <th style="width: 20%;">컬럼 3</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="row-h">
                <b>키워드</b>
                <span class="sub-line">짧은 부연</span>
            </td>
            <td>
                메인 내용
                <span class="sub-line">한 줄 부연</span>
                <span class="sub-line">또 한 줄 부연</span>
            </td>
            <td>짧은 셀</td>
        </tr>
        <!-- 강조 행: style="background: var(--accent-soft);" -->
    </tbody>
    <caption>표 하단의 주석/캡션</caption>
</table>
```

**규칙**
- **표 컬럼은 3~4개로 제한**. 5개 이상이면 청중이 따라가기 어려움.
- 각 셀은 **메인 한 줄 + sub-line으로 분리**. 한 셀에 여러 개념을 `·`로 이어붙이지 말 것.
- "운영 디테일"(SLA, 에스컬레이션, 감사 항목)은 표 외부 caption이나 callout으로.

**클래스**
- `.tight` — 패딩 줄임 (대부분 권장)
- `.compact` — 더 줄임 (짧은 셀 위주)
- `.matrix-table` — 매트릭스 (cell-a/b/c 색상 + axis-y)

### 3.3 num-grid (번호 카드)

```html
<div class="num-grid" style="grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));">
    <div class="num-item">
        <div class="n">01</div>
        <h3>카드 제목</h3>
        <p>한두 줄 설명.</p>
    </div>
    <div class="num-item accent">       <!-- 마지막 1개를 accent로 강조 -->
        <div class="n">06</div>
        <h3>마지막</h3>
        <p>...</p>
    </div>
</div>
```

**규칙**
- 큰 숫자 `.n`은 **01~06 형태**의 자연 번호. P1, T1 같은 약어는 **사용 금지** (청중이 매핑 기억해야 함).
- 4~6개의 동등한 항목을 격자로 보여줄 때.

### 3.4 stat-row / stat-cell (수치 통계)

```html
<div class="stat-row">
    <div class="stat-cell">
        <div class="lbl">통계 라벨 (작은 mono)</div>
        <div class="num">84% / 29%</div>
        <div class="meaning">
            메인 한 문장
            <span class="sub-line">부연 한 줄, 전년 대비 등</span>
        </div>
        <div class="src">출처 발행처 · 연월일 · 표본 수</div>
    </div>
    <!-- 4~5개 셀, 1개를 accent로 강조 -->
</div>
```

**언제 쓰나** — 슬라이드 5처럼 5개 정도의 핵심 통계를 한 슬라이드에 나열할 때.

### 3.5 entry-list (모델/제품 목록)

```html
<div class="entry-list">
    <div class="entry">
        <div class="name">Claude Opus 4.7</div>
        <div class="when">2026-04-16</div>
        <div class="what">SWE-bench 87.6%, 1M 컨텍스트</div>
    </div>
</div>
```

**규칙** — 한 항목 = 한 줄. 이름·날짜·핵심 한 가지만. 슬라이드 36의 모델 카드 패턴.

### 3.6 case-card (사례 카드)

```html
<div class="case-card">
    <div class="case-head">사건명 <span class="when">2024 · BC 민사</span></div>
    <div class="case-fact">무슨 일이 있었나 — 한두 줄.</div>
    <div class="case-tag">빠진 원칙</div>
    <div class="case-prin"><span class="principle">자율성</span> 응답 검증 부재 · <span class="principle">관측</span> 평가 부재</div>
</div>
```

**언제 쓰나** — 슬라이드 33처럼 실패 사례를 정리할 때. 사건 / 빠진 원칙 / 교훈 구조.

### 3.7 kr-list / kr-item (한국 사례)

```html
<div class="kr-list">
    <div class="kr-item">
        <div class="co">SK텔레콤</div>
        <div class="what">
            'AI Native' 전략 선언 <span class="when">MWC26, 2026-03-01</span><br>
            '1인 1 AI 에이전트' + 사내 해커톤 <span class="when">2026-05</span>
        </div>
    </div>
</div>
```

**규칙** — 회사 이름 + 핵심 내용 + 발표일자. 한 회사당 1~2줄.

### 3.8 callout (강조 박스)

```html
<div class="callout">
    <b>한 줄 정리.</b> 핵심 메시지 한 문장.
    <span class="sub-line">부연 — 추가 맥락이나 출처</span>
</div>

<div class="callout ink">                <!-- 검정 강조선 -->
    <span class="tag">실패 신호</span>
    내용 한 줄.
</div>
```

**규칙** — 슬라이드 끝에 1개. 짧게. 두 문장 이상이면 sub-line으로 분리.

### 3.9 mini-callout (작은 강조)

```html
<div class="mini-callout">
    <b>실패 신호.</b> 짧은 메시지.
</div>
```

카드 안의 보조 강조 박스.

### 3.10 bullet-list (체크 항목)

```html
<ul class="bullet-list">
    <li class="check">
        <b>항목 헤딩</b>
        <span class="sub-line">한 줄 부연</span>
    </li>
</ul>
```

**언제 쓰나** — 슬라이드 2 학습 목표처럼 5개의 동등한 학습 포인트.

### 3.11 dash-list (대시 항목)

```html
<ul class="dash-list">
    <li>일반 항목</li>
    <li><b>키워드</b><span class="sub-line">부연</span></li>
</ul>
```

**규칙** — 카드 안 항목 리스트의 기본. col-card 안에 사용.

### 3.12 kv-list / kv-row (키-값)

```html
<div class="kv-list">
    <div class="kv-row">
        <span class="k">조건</span>
        <span class="v">결과 또는 권장</span>
    </div>
</div>
```

**언제 쓰나** — 슬라이드 22 Multi-Agent 선택 기준처럼 단순 매핑.

### 3.13 pipeline (단계 표시)

```html
<div class="pipeline">
    <span class="pnode">단계1</span><span class="parrow">→</span>
    <span class="pnode accent">단계2</span><span class="parrow">→</span>
    <span class="pnode muted">단계3</span>
</div>
```

`muted` — 이전/대조용. `accent` — 강조 단계.

### 3.14 module-flow (수직 흐름)

```html
<div class="module-flow">
    <div class="mod">
        <div class="ml">① 단계명</div>
        <div class="mb">설명</div>
    </div>
    <div class="arrow-d">↓</div>
    <div class="mod accent"><!-- 마지막 강조 --></div>
</div>
```

### 3.15 formula (공식)

```html
<div class="formula">
    <span class="eq">Agent</span>
    <span class="op">=</span>
    <span class="term">Loop</span>
    <span class="op">+</span>
    <span class="term">Tools</span>
</div>
```

### 3.16 chip-grid (마무리 chip)

```html
<div class="chip-grid">
    <div class="chip">키워드 한 줄</div>
    <div class="chip accent">강조 키워드</div>
</div>
```

**규칙** — chip 하나 = 키워드 하나 또는 짧은 통계 하나. 마무리 슬라이드의 요약 카드.

### 3.17 trend-map (흐름 맵)

```html
<div class="trend-map">
    <div class="t">
        <div class="id">01</div>
        <div class="name">흐름 이름</div>
        <div class="where">Ch1 · Ch5</div>
    </div>
</div>
```

### 3.18 proto-stack (프로토콜 계층)

슬라이드 23의 A2A·MCP 표준 같은 계층 구조용. 사용 빈도 낮음.

---

## 4. 표현·콘텐츠 가이드

### 4.1 톤 원칙

**슬라이드 제목 (h2.slide-title)**
- 명사구 형태로 간결하게
- 거들먹거리는 한 문장 표현 지양 (예: ❌ "강의가 끝나면 이 다섯 가지를 답할 수 있음" → ✅ "강의 목표 다섯 가지")
- 의문형은 챕터 디바이더 질문에서만 사용

**슬라이드 부제 (sub)**
- 한 줄로 본문을 요약하는 자연스러운 한국어
- 동사형이 자연스러운 곳은 동사형 (예: "...들어왔다", "...가깝다")
- 명사구가 자연스러운 곳은 명사구 (예: "...경쟁력의 핵심")

**본문 (li, p, callout)**
- 한 줄 한 생각 — 여러 개념을 `·`로 이어붙이지 말 것
- 자연스러운 한국어로. 일률적인 명사형 변환 금지.
- 동사형이 자연스러우면 동사형 (예: "...읽고 판단한다", "...다시 짰다")
- 짧은 항목은 명사구로 끝나도 OK (예: "기본 거부", "1차 응대")

**금지 표현**
- ❌ 일률적 명사형 변환 ("판단함", "결정함" 등 어색하면 자연 동사형으로)
- ❌ 거들먹거리는 비유 ("아키텍트의 자리", "설계의 척추", "캔버스에 자리잡음")
- ❌ "X가 아닌 Y" 대조 구문의 남용 (한 슬라이드에 한 번만)
- ❌ 영어 약어 식별자 (P1~P6, T1~T4 등) — 의미 있는 단어로 (자율성, 비용, 워크플로 등)

### 4.2 한 줄 분절 원칙

청중이 1~2초에 훑어 핵심을 파악할 수 있어야 함.

**좋은 예**
```html
<li>
    <b>아키텍트의 역할 변화</b>
    <span class="sub-line">대체가 아닌 확장 — 책임 영역이 어디까지 늘어나는가</span>
</li>
```

**나쁜 예**
```html
<li>역할 확장 · AI 중심 개발 사이클에서 아키텍트 책임의 확장 영역 · 6원칙 기반 트레이드오프 분석</li>
```

여러 개념을 `·`로 이어붙이는 패턴은 명사구 나열식이라 가독성이 떨어집니다.

### 4.3 인라인 정의 (def)

```html
<span class="def">한국어 풀이</span>
```

**규칙** — 청중이 처음 보는 약어에만 사용. 잘 알려진 약어(IAM, WAF, SLA, CI/CD, OWASP 등)는 정의하지 않음.

**유지할 만한 정의**
- MCP, A2A, ACP (프로토콜)
- RPO, RTO (복구 메트릭)
- HITL (Human-in-the-Loop)
- AIMS (ISO 42001)
- FRIA (EU AI Act)
- CAIO (조직 역할)
- WASM (덜 알려진 약어)

---

## 5. 출처 표기 규칙

### 5.1 신뢰도 우선순위

1. **1차 출처**: 회사 공식 발표·논문·정부 문서 (예: anthropic.com/news, bcg.com/press, law.go.kr)
2. **검증 매체**: Reuters, Bloomberg, Stack Overflow Survey, Gartner, McKinsey, IDC
3. **업계 매체**: TechCrunch, Fortune, The Register
4. **국내 매체**: Sedaily, Chosun Biz (1차 보도 시)

**검증되지 않은 통계는 슬라이드에 넣지 않음**.

### 5.2 표기 형식

**통계 셀 (.src)**
```html
<div class="src">발행처 발행연월일 · 표본 수</div>
<!-- 예: Stack Overflow Developer Survey 2025 · 약 49,000명 -->
```

**카드 출처 (.source)**
```html
<div class="source">발행처 / URL 또는 보고서명</div>
<!-- 예: anthropic.com/research/how-ai-is-transforming-work-at-anthropic -->
```

**캡션 (caption)**
```html
<caption>2026-05-07 EU 이사회·의회 잠정 합의 — 정확한 사실 인용</caption>
```

### 5.3 발행일 표기

- 정확한 날짜 알 때: `2026-05-07` 형식
- 월만 알 때: `2026-05`
- 시점 추정: `2026 H1`
- 기간 표시: `2025–2026 H1`

### 5.4 미래 시점 또는 예측 표기

```html
<div class="src">Gartner 2026 — 2027년까지 예측</div>
```

확정된 사실과 예측을 명확히 구분.

---

## 6. 새 슬라이드 추가 체크리스트

새 슬라이드를 추가할 때 확인할 항목:

### 구조
- [ ] `<section class="slide" data-title="...">` 사용
- [ ] `slide-header`에 `section-marker`와 `slide-num` 포함
- [ ] `slide-num`을 전체 슬라이드 수에 맞게 갱신 (예: `04 / 41` 또는 `40` 유지)
- [ ] `h2.slide-title`에 `<span class="hl">` 강조 1곳, `<span class="sub">` 부제 1줄

### 콘텐츠
- [ ] 한 줄에 한 개념 (≥3개를 `·`로 이어붙이지 않음)
- [ ] 표 컬럼 ≤4개
- [ ] 카드 항목 ≤4개 (dash-list 기준)
- [ ] callout은 슬라이드당 1개, 두 문장 이상이면 sub-line으로 분리
- [ ] 명사형/동사형 자연스럽게 혼용

### 출처
- [ ] 모든 통계에 1차 출처 + 발행연월일 표기
- [ ] 검증되지 않은 통계는 제거 또는 검증된 자료로 교체
- [ ] 약어는 의미 단어로 변환 (P1 → 자율성)

### 시각
- [ ] accent 색상은 슬라이드당 1~2곳만
- [ ] 정의 박스(`.def`)는 처음 보는 약어에만
- [ ] 그림(SVG)이 있으면 viewBox와 max-height 확인

### 일관성
- [ ] 다른 슬라이드의 비슷한 구조와 동일한 컴포넌트 사용
- [ ] 챕터 디바이더 형식 준수 (Chapter X / 5, bignum, questions, bridge)
- [ ] 각 슬라이드 nav-dot 라벨(`data-title`)이 청중에게 의미 있는지

---

## 7. 자주 발생하는 실수와 교정

| 실수 | 교정 |
|------|------|
| `한다·된다·있다`로 끝나는 본문을 `함·됨·있음`으로 일률 변환 | 본문은 자연 동사형 OK. 슬라이드 헤딩만 명사구. |
| 표에 5개 이상 컬럼 | 운영 디테일은 caption으로, 핵심 의사결정 컬럼만 남김 |
| `<span class="principle">P1</span>` 같은 약어 | `<span class="principle">자율성</span>` 의미 단어로 |
| 한 슬라이드에 여러 callout | 1개로 줄이고 핵심 한 문장만 |
| "X가 아닌 Y" 대조 남용 | 슬라이드당 1번 이하 |
| 검증 없이 인용한 통계 | 1차 출처로 교체 또는 제거 |
| 슬라이드 제목에 "이 다섯 가지를 답할 수 있음" 같은 의미심장한 한 문장 | "강의 목표 다섯 가지" 같은 직접적 명사구 |
| AI 톤의 명사구 나열 (`·`로 이어붙임) | 한 줄 한 생각, sub-line으로 분리 |

---

## 8. 파일 구조

```
slides/
├── AI에이전트-아키텍처-강의-v2.html       # 본 발표 자료
├── STYLE_GUIDE.md                       # 이 문서
└── (기타 자료)
```

`AI에이전트-아키텍처-강의-v2.html` 한 파일로 동작합니다 — CSS, HTML, JS 모두 포함. 외부 의존은 Google Fonts뿐.

---

## 9. 향후 작업 시나리오

### 9.1 새 슬라이드 추가
1. 가장 비슷한 구조의 기존 슬라이드를 찾아 복사
2. `slide-num`, `data-title`, `section-marker` 갱신
3. 콘텐츠 채우기 (위 체크리스트 따라)
4. 새 통계는 1차 출처 검증 후 추가

### 9.2 슬라이드 삭제
1. 해당 `<section>` 제거
2. 이후 슬라이드의 `slide-num` 모두 갱신 (또는 전체 / 40을 / 39로)
3. 다른 슬라이드에서 해당 슬라이드를 참조하는 링크/문구 확인

### 9.3 슬라이드 수정
1. 어떤 컴포넌트(표/카드/체크리스트)를 쓸지 먼저 결정
2. 위 카탈로그에서 해당 패턴 복사
3. 톤 원칙 점검 (명사형 일률 변환 금지, callout 1개 이하 등)

### 9.4 통계·출처 갱신
1. 1차 출처에서 최신 데이터 확인
2. 발행연월일 갱신
3. 검증 안 되면 다른 출처로 교체 또는 제거

---

## 10. 강의 진행 시 톤 (참고)

청중은 5–15년차 SW/Cloud 아키텍트.
- 기본 SW 용어(IAM, WAF, SLA, OpenAPI, Saga, Event Sourcing 등)는 풀어 설명하지 않음
- AI 고유 용어(MCP, A2A, HITL, Eval 슈트, Reasoning native 등)는 정의 + 예시 함께
- 비유는 "기존 SW의 X와 비슷"으로 짧게 (반복적 비유 사용 금지)
- 강사 발화로 보충할 여지를 두기 위해 슬라이드 텍스트는 시각적 앵커 정도로

