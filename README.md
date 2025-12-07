# Vanilla SwiftUI

- 학습 목적의 구조 설계용 프로젝트
- 라이브러리 없이 개발

---   

# Project Goal

- SwiftUI 기반 클린 아키텍처 앱 구조 템플릿 구축
- 라이브러리 없이 앱 개발 (DI 제외)  
- MVVM-C 패턴 테스트
- MVVM-C + Clean Architecture + DI 조합 테스트
- 확장성과 유지보수성을 고려한 앱 구조 마련

---  

# Tech Stack

- SwiftUI
- MVVM-C
- Combine
- Clean Architecture
- Dependency Injection (Swinject)
- Tuist

---  

# TODO

- [x] Task A
  - MyPageView -> TermsOfServiceView 정보 전달
  - MyPageView -> TermsOfServiceView 이동 (Push)
  - Associated value 사용
- [x] Task B
  - MyPageView <- TermsOfServiceView 정보 전달
  - MyPageView -> TermsOfServiceView 이동 (Push)
  - TermsOfServiceView의 버튼 누를 시 정보 전달하면서 Pop
  - MyPageView가 받은 정보로 alert 띄우기
- [x] Task C
  - MyPageView -> TermsOfServiceView 이동 (Push)
  - TermsOfServiceView 의 액션 감지, MyPageView 액션 감지
  - MyPageView 의 timer 시작, TermsOfServiceView State 변경
  - TermsOfServiceView가 사라지면, MyPageView Timer 중단
- [x] Task D
  - Home 에서 Sheet Present
  - Sheet의 버튼 감지 -> dismiss + Home의 State 변경