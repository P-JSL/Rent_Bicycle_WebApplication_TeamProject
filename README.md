#프로젝트 시작일  
2020/05/04 ~   
#완성일
미정
---
#프로젝트 이름#
 - 자전거 대여 홈페이지
 ---
 #프로젝트 인원 및 팀원
  - 신기연, 주장익, 김준영, 성기원, 간예은 (총 5명)  
  
 #맡은 기능  
  - 주장익 : 물품 예약, 등록 기능 및 상세페이지 UI  
  - 신기연 : Security 를 이용한 전체적인 보안 및 로그인/로그아웃/회원가입 등 전반적인 틀  
  - 성기원 : 유저 게시판 등록, 삭제, 수정 등 CRUD 기능 외  +@  
  - 간예은 : 유저 마이페이지의 전체적인 기능 및 메인 UI 수정 등  
  - 김준영 : 
 ---
#사용한 언어 및 프레임워크  
 - HTML5, CSS3, JS, JQUERY, AJAX (FRONT END)
 - JAVA, JSP (BACKEND)
 - SPRING, SPRING-SECURITY (Spring FrameWork ) 
 - Oracle DataBase (11g) , Mybatis (마이바티스)
 ---
 
#사용한 기능   
 - Spring framework를 사용하여 MVC pattren을 사용.
 - JSP 와 Ajax 를 이용한 실시간 좋아요/싫어요, 댓글 기능
 - Ajax를 이용하여 회원 실시간 관리 기능  
 - 비밀번호 변경 및 아이디 찾기 기능
 - Spring security 의 암호화를 이용한 비밀번호 보안
 - Spring security 를 사용하여, 관리자/회원/비회원 권한 부여.
 - Spring security 를 사용한 로그인, 로그아웃 시 권한 인증을 통한 기능
 - ChatJs를 이용한 예약 날짜 & 사용한 금액 확인 기능
 - 관리자 페이지와 유저 마이페이지에서 전체 관리 기능
 - 마이페이지에서 로그인 횟수, 로그인 누적 실패 횟수 , 예약 횟수 확인 기능
 - 물품 등록 및 물품 예약 & 확인 기능 
 - 예약 문의 기능 및 1 : 1 문의 기능 
 - JS (Javascript) 를 이용해서 유효성 검사 기능
 - Mybatis 를 이용하여 DB를 Dynamic sql 로 제어 및 데이터 저장/출력  
 - Mybatis를 이용한 CRUD  + @ 
 ---
#프로젝트 흐름  
_-> JSP - Controller - Service - Mapper(Mybatis) - DB_
---
#수정사항

---

#코드 설명 (기능)   
스프링 보안 (Spring security) Dependency 설정
```
<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-core</artifactId>
			<version>5.3.3.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-web</artifactId>
			<version>5.3.3.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-config</artifactId>
			<version>5.3.3.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-taglibs</artifactId>
			<version>5.3.3.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-test</artifactId>
			<version>5.3.3.RELEASE</version>
		</dependency>
```
