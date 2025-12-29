# works.json Schema Doc

본 스키마는 **포트폴리오 사이트(홈 / Work 리스트 / Work 상세 페이지)**에서 공통으로 사용되며,</br>
특히 상세 페이지 본문(content) 은 아래의 4단계 구조를 기준으로 작성하는 것을 권장합니다.</br>

본 스키마의 목표는 다음과 같습니다.

- **데이터 중심 구조** (라우팅·UI 하드코딩 제거)
- **확장 가능성** (상세 페이지, Hero 섹션, 필터 확장)
- **작업 맥락 보존** (디자인 결과 + 클라이언트 요청 포함)

---

## 기본 설계 원칙

모든 상세 콘텐츠는 아래의 **4단계 서사 구조**를 따릅니다.

### (Request) → (Requirement) → (Approach) → (Output)

이 구조를 통해 각 작업은 다음을 명확히 전달합니다.

- 무엇을 요청받았는지
- 어떤 요구사항이 있었는지
- 어떻게 접근했는지
- 무엇을 결과물로 전달했는지

---

## 1. 기본 스키마 (최소 확장)

```json
{
  "slug": "string",
  "title": "string",
  "year": 2025,
  "category": "promotion",
  "description": "string",
  "thumbnail": "/img/2025/example-thumb.png",
  "cover": "/img/2025/example-cover.png",
  "gallery": [],
  "content": [],
  "roles": [],
  "tools": [],
  "client": "",
  "links": [],
  "featured": false,
  "hero": false,
  "heroRank": null
}

2. 필드 설명 (Top-level)
slug (필수, 고유)

/work/[slug] 라우팅에 사용

중복 불가, 한 번 정하면 변경하지 않음

소문자 + 하이픈 권장
