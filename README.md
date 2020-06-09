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
---
1.스프링 시큐리티를 이용한 로그인, 회원가입 기능 설명 과 세팅 
---   
#스프링 보안 (Spring security) Dependency 설정
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
그 다음
**Security-context.xml** 에서 설정을 해줘야 Spring Security 를 사용 할 수 있다.
```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:security="http://www.springframework.org/schema/security"
	xsi:schemaLocation="http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans.xsd
	http://www.springframework.org/schema/security 
	http://www.springframework.org/schema/security/spring-security.xsd">
	
	...생략
```
**Web.xml** 추가 설정
```
	<filter>
		<display-name>springMultipartFilter</display-name>
		<filter-name>springMultipartFilter</filter-name>
		<filter-class>org.springframework.web.multipart.support.MultipartFilter
		</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>springMultipartFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	<filter>
		<filter-name>springSecurityFilterChain</filter-name>
		<filter-class>org.springframework.web.filter.DelegatingFilterProxy
		</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>springSecurityFilterChain</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
```
**CustomLogin.JSP Page**에서 Form Tags
```
<form class="login100-form validate-form" action="/signup" method="post" onsubmit="return checkAccount()">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
```
여기서 
```
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
```
는 **Method='POST'** 일 떄는 무조건 사용 해야 **Security** 에서 정상적으로 작동 하여 Request로 허가를 보냅니다.
그 후에 **action="/signup"** 의 URL이 적힌 Controller 로 이동 합니다.

**Controller** 에서는 
**URL이 /signup** 인 곳에 Request Mapping 되어 요청을 합니다.
이유는 **Method='POST'** 이기 떄문에 
```
@GetMapping 
```
이 아닌 
```
@PostMapping
```
으로 갑니다.
```
	@Setter(onMethod_ = { @Autowired })
	private MemberService service;

	@PostMapping("/signup")
	public String signup(MemberVO memvo) throws UnsupportedEncodingException, SQLException {
		log.info("error : " + memvo);
		if (service.signup(memvo)) {
			service.Account_loginto(memvo.getUserid());
			log.info("sign up success");
		} 
		return "redirect:/CustomLogin";
	}
```
먼저 아래에 실행되는 순서대로 코드를 보여주고 설명 하겠습니다.

**MemberService**
```

public interface MemberService {

	public boolean signup(MemberVO mvo);
	
	...생략
}
```

**MemberServiceImpl**
```
	@Setter(onMethod_ = { @Autowired })
	private MemberMapper mapper;

	@Inject
	private BCryptPasswordEncoder BCPE;

	@Override
	public boolean signup(MemberVO mvo) {
		log.info("on");
		// TODO Auto-generated method stub
		mvo.setUserpw(BCPE.encode(mvo.getUserpw()));
		mapper.insert(mvo);

		MailSendMethod(mvo);
		return mapper.insert_auth(mvo) == 1 ? true : false;

	}
```
**MemberMapper**
```

public interface MemberMapper {

	public int insert(MemberVO mvo);
	public int insert_auth(MemberVO mvo);
	
	...생략
```
**MemberMapper.xml**
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper 
	PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.rental.mapper.MemberMapper">
	<insert id="insert">
		insert into tbl_member (userid, userpw, username,
		regdate, enabled, useremail) values
		(#{userid}, #{userpw}, '일반사용자'
		,sysdate,0, #{useremail})
	</insert>
	<insert id="insert_auth">
		insert into tbl_member_auth (userid, auth ) values
		(#{userid} , 'ROLE_USER' )
	</insert>

...

---
2.비밀번호 변경 및 아이디 찾기
---
