## works.json Schema Doc

본 스키마는 포트폴리오 사이트(홈 / Work 리스트 / Work 상세 페이지)에서 공통으로 사용되며,
특히 상세 페이지 본문(content) 은 아래의 4단계 구조를 기준으로 작성하는 것을 권장합니다.

본 스키마의 목표는 다음과 같습니다.

- 데이터 중심 구조 (라우팅·UI 하드코딩 제거)
- 확장 가능성 (상세 페이지, Hero 섹션, 필터 확장)
- 작업 맥락 보존 (디자인 결과 + 클라이언트 요청 포함)

---

### 기본 설계 원칙

모든 상세 콘텐츠는 아래의 **4단계 서사 구조**를 따릅니다.

(Request) → (Requirement) → (Approach) → (Output)

이 구조를 통해 각 작업은 다음을 명확히 전달합니다.

- 무엇을 요청받았는지
- 어떤 요구사항이 있었는지
- 어떻게 접근했는지
- 무엇을 결과물로 전달했는지

---

#### 1. 기본 스키마 (최소 확장)

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
```

#### 2. 필드 설명 (Top-level)

slug (필수, 고유)

- /work/[slug] 라우팅에 사용
- 중복 불가, 한 번 정하면 변경하지 않음
- 소문자 + 하이픈 권장

title (필수)
- 작업 제목
- 한글/영문 혼용 가능

year (필수)
- 작업 연도
- 숫자 사용 권장

category (필수)
- Work 페이지 필터 기준
- 사이트에 정의된 카테고리 값과 일치해야 함

description
- Work 리스트 카드에 노출되는 짧은 설명

thumbnail
- Work 리스트 카드 이미지

cover
- 상세 페이지 상단 대표 이미지

gallery (배열)
상세 페이지에 사용되는 이미지 배열입니다.
- 디테일 or 리핏
- 컬러웨이
- 목업

#### 3. content
상세 페이지의 텍스트 영역입니다.
모든 항목은 type을 기준으로 렌더링됩니다.

(1) Repuest : 클라이언트 요청/브리프
(2) Repuirement : 핵심 요구사항(체크리스트), 요청의 구체화 단계입니다.
- 작업 범위
- 산출물
- 사용처
- 수정 범위
(3) Approach : 디자인 방향
(4) Output : 최종 결과물
- 사용 모티브
- 리핏 분류, 사이즈
- 최종 파일

#### 4. 메타 정보

roles : 담당 
tools : 사용 툴
client : 클라이언트(Brand or Promotion) or 개인 작업(Persnal Project)
links : 작업 링크

#### 5. 홈/대표작 제어 필드

featured
- 대표 작업 표시 여부
hero
- 홈 Hero 섹션 노출 여부
heroRank
- 우선수위 (숫자가 낮을수록 상위)

#### 6. 작성 가이드
- slug는 게시후 변경하지 않는다.
- content는 반드시 4단계 구조를 따른다.
- 선택 필드는 삭제 하지 않고 빈 배열로 이용한다.
- UI노출 여부는 featured, hero 제어한다.
- 설명 흐름: 요청 → 해결 → 결과