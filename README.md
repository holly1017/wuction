# 🛒 Wuction (Web Auction Project)

Wuction은 **Spring Framework를 사용하지 않고**, Java **Servlet/JSP 기반으로 MVC 구조를 직접 구현한 웹 경매(Auction) 서비스**입니다.
프레임워크에 의존하지 않고 웹 애플리케이션의 **요청 흐름, 서버 구조, DB 연동 원리**를 깊이 이해하는 것을 목표로 개발하였으며, AWS 환경에 직접 배포하여 실제 서비스 흐름까지 경험한 프로젝트입니다.
본 프로젝트는 상용 목적이 아닌, 
Java 웹 기본 원리 학습 및 기초 역량 강화 목표로 한 포트폴리오 프로젝트입니다.

---

## 📌 프로젝트 목적

* Servlet/JSP 기반 Java 웹 동작 원리 이해
* MVC 패턴을 **직접 설계 및 구현**
* DB 설계부터 SQL, 트랜잭션 처리까지 전 과정을 경험
* Spring 사용 전, **백엔드 기초 체력 강화**
* 로컬 개발 → AWS 배포까지의 전체 흐름 경험

---

## 🧩 주요 기능

### 👤 회원 기능

* 회원가입 / 로그인 / 로그아웃
* 세션 기반 사용자 인증
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
         └─ mariaDB (AWS RDS)
```

* **Controller**: 요청/응답 처리, 파라미터 검증
* **Service**: 비즈니스 로직 처리, 트랜잭션 관리
* **DAO**: MyBatis를 이용한 DB 접근
* **View**: JSP + HTML/CSS/JavaScript

---

## 🏗 프로젝트 아키텍처
<img width="723" height="614" alt="wuction drawio" src="https://github.com/user-attachments/assets/1fce7dcb-dbcf-485a-a4a0-aef980387f8c" />

## 🛠 기술 스택

| 구분           | 사용 기술                  |
| ------------ | ---------------------  |
| Language     | Java 8                 |
| Backend      | Servlet, JSP           |
| Architecture | MVC Pattern            |
| DB           | mariadb(AWS RDS)       |
| Persistence  | MyBatis                |
| Server       | Apache Tomcat(AWS EC2) |
| Frontend     | HTML, CSS, JavaScript  |
| Infra        | AWS EC2, AWS RDS       |
| Tool         | Eclipse / VS Code      |

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

프레임워크에 의존하지 않고
웹 애플리케이션의 기본 동작 원리와 구조를 이해하는 것이 중요하다고 판단했습니다.

Servlet/JSP 기반으로 MVC 구조를 직접 구현함으로써 요청 흐름, 계층 분리, DB 연동 방식을 명확히 이해하고자 했습니다.

👉 이후 Spring / Spring Boot 학습을 위한 **기초 프로젝트**입니다.

---

## 🚀 실행 방법

1. 프로젝트 빌드 후 wuction.war 생성
2. AWS EC2에 Apache Tomcat 설치
3. WAR 파일 수동 배포
4. AWS RDS (MariaDB) 연동

```text
http://<EC2_PUBLIC_IP>:8080/wuction
```

---

## ✨ 배운 점

* 프레임워크 없이 웹 애플리케이션 구조를 설계한 경험
* 요청/응답 흐름에 대한 명확한 이해
* Controller / Service / DAO 계층 분리의 중요성
* MyBatis 기반 SQL 관리
* AWS 환경에서의 서버·DB 분리 및 보안 설정
* WAR 파일 기반 수동 배포 경험

---

## 🔧 개선 예정 사항

* 낙찰, 결제, 배송에 이르는 사용자 이용 전 과정(End-to-End)의 서비스 로직 구축 -> 본 프로젝트는 입찰까지만 구현됨
* Spring Boot 기반으로 리팩토링
* JWT 기반 사용자 인증
* REST API 구조로 개선
* 실시간 입찰 WebSocket 적용
* 테스트 코드 추가 및 예외 처리 강화

---

## 📷 실행 화면
<img width="3835" height="2089" alt="wuction_1" src="https://github.com/user-attachments/assets/f79e7679-ffc8-4304-a167-0cacd5623057" />
<img width="3872" height="2056" alt="wuction_2" src="https://github.com/user-attachments/assets/86e00f8c-707a-4361-b3ee-97bc4007fbd3" />
<img width="3851" height="2065" alt="wuction_3" src="https://github.com/user-attachments/assets/56e844f0-894b-41c4-90c5-e080984f6e01" />


## 👩‍💻 개발자

* 최서은: [https://github.com/holly1017](https://github.com/holly1017)
* 정은유
* 조건웅

---

📌 *본 프로젝트는 학습 및 포트폴리오 용도로 제작되었습니다.*
