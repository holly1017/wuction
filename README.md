# 🛒 Wuction (Web Auction Project)

Wuction은 **Spring Framework를 사용하지 않고**, Java **Servlet/JSP 기반으로 MVC 구조를 직접 구현한 웹 경매(Auction) 서비스**입니다.
프레임워크에 의존하지 않고 웹 애플리케이션의 **요청 흐름, 서버 구조, DB 연동 원리**를 깊이 이해하는 것을 목표로 개발했습니다.
따라서 본 프로젝트는 상용 서비스가 아닌, 
Java 웹 기본 원리 학습을 목표로 한 포트폴리오 프로젝트입니다.

---

## 📌 프로젝트 목적

* Java 웹의 기본 동작 원리(Servlet, JSP)를 이해하기 위함
* MVC 패턴을 **직접 설계 및 구현**
* DB 설계부터 SQL, 트랜잭션 처리까지 전 과정을 경험
* Spring 사용 전, **백엔드 기초 체력 강화**

---

## 🧩 주요 기능

### 👤 회원 기능

* 회원가입 / 로그인 / 로그아웃
* 쿠키 기반 사용자 인증
* 마이페이지 정보 조회

### 🛍 경매(상품) 기능

* 상품 등록 (이미지 업로드 포함)
* 상품 목록 조회
* 상품 상세 페이지
* 경매 종료 시간 관리

### 💰 입찰 기능

* 입찰 등록
* 입찰 단위 적용
* 입찰 내역 조회

### 📦 기타 기능

* 이미지 다중 업로드
* 페이징 처리
* 가격 포맷팅(천 단위 콤마)

---

## 🏗 프로젝트 구조 (MVC)

```text
Controller (Servlet)
 └─ Service
     └─ DAO (MyBatis)
         └─ Oracle DB
```

* **Controller**: 요청/응답 처리, 파라미터 검증
* **Service**: 비즈니스 로직 처리, 트랜잭션 관리
* **DAO**: MyBatis를 이용한 DB 접근
* **View**: JSP + HTML/CSS/JavaScript

---

## 🛠 기술 스택

| 구분           | 사용 기술                 |
| ------------ | --------------------- |
| Language     | Java 8                |
| Backend      | Servlet, JSP          |
| Architecture | MVC Pattern           |
| DB           | Oracle                |
| Persistence  | MyBatis               |
| Server       | Apache Tomcat         |
| Frontend     | HTML, CSS, JavaScript |
| Tool         | Eclipse / VS Code     |

---

## 🗄 데이터베이스 설계 (요약)

* MEMBER (회원)
* POSTING (경매 상품)
* MYPAGE (마이페이지)
* BID (입찰)
* IMAGE (이미지)

👉 **정규화된 구조 + 외래키 관계 설정**

---

## 💡 Spring을 사용하지 않은 이유

프레임워크 사용 이전에
웹 애플리케이션의 기본 동작 원리와 구조를 이해하는 것을 중요하게 생각하며,
Servlet/JSP 기반으로 MVC 구조를 직접 구현하는 프로젝트를 선택하였습니다.

👉 이후 Spring 학습을 위한 **기초 프로젝트**입니다.

---

## 📷 실행 화면

> ※ 추후 스크린샷 추가 예정

---

## 🚀 실행 방법

1. Oracle DB 실행 및 테이블 생성
2. `src/main/resources` 내 DB 설정 수정
3. Apache Tomcat 서버 설정
4. 프로젝트 실행 후 접속

```text
http://localhost:8080/wuction
```

---

## ✨ 배운 점

* 프레임워크 없이 웹 애플리케이션 구조를 설계하는 경험
* Controller/Service/DAO 역할 분리의 중요성
* MyBatis를 활용한 SQL 관리
* 파일 업로드

---

## 🔧 개선 예정 사항

* Spring Boot 기반으로 리팩토링
* JWT 기반 사용자 인증
* REST API 구조로 개선
* 실시간 입찰 WebSocket 적용
* 테스트 코드 추가

---

## 👩‍💻 개발자

* 최서은: [https://github.com/holly1017](https://github.com/holly1017)
* 정은유
* 조건웅

---

📌 *본 프로젝트는 학습 및 포트폴리오 용도로 제작되었습니다.*
