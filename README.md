프로젝트 시작일 
---
2020/05/04 ~  

---
완성일
---
미정

---
프로젝트 이름
---
- 자전거 대여 홈페이지
 ---
프로젝트 인원 및 팀원
---
 - 신기연, 주장익, 김준영, 성기원, 간예은 (총 5명)  
  
 맡은 기능  
---
  - 주장익 : 물품 예약, 등록 기능 및 상세페이지 UI  
  - 신기연 : Security 를 이용한 전체적인 보안 및 로그인/로그아웃/회원가입 등 전반적인 틀  
  - 성기원, 김준영 : 유저 게시판 등록, 삭제, 수정 등 CRUD 기능 외  +@ (댓글 등)  
  - 간예은 : 유저 마이페이지의 전체적인 기능 및 메인 UI 수정 등  
 ---
사용한 언어 및 프레임워크  
---
- HTML5, CSS3, JS, JQUERY, AJAX (FRONT END)
 - JAVA, JSP (BACKEND)
 - SPRING, SPRING-SECURITY (Spring FrameWork ) 
 - Oracle DataBase (11g) , Mybatis (마이바티스)
 ---
 
사용한 기능  
---
 - Spring framework를 사용하여 MVC pattren을 사용.
 - JSP 와 Ajax 를 이용한 실시간 좋아요/싫어요, 댓글 기능
 - Ajax를 이용하여 회원 실시간 관리 기능  
 - 비밀번호 변경 및 아이디 찾기 기능
 - Spring security 의 암호화를 이용한 비밀번호 보안
 - Spring security 를 사용하여, 관리자/회원/비회원 권한 부여.
 - Spring security 를 사용한 로그인, 로그아웃 시 권한 인증을 통한 기능
 - ChatJs를 이용한 예약 날짜 & 사용한 금액 확인 기능
 - 관리자 페이지와 유저 마이페이지에서 전체 관리 기능
 - 로그인 횟수, 로그인 누적 실패 횟수 , 예약 횟수 확인 기능
 - 물품 등록 및 물품 예약 & 확인 기능 
 - 예약 문의 기능 및 1 : 1 문의 기능 
 - JS (Javascript) 를 이용해서 유효성 검사 기능
 - Mybatis 를 이용하여 DB를 Dynamic sql 로 제어 및 데이터 저장/출력  
 - Mybatis를 이용한 CRUD  + @ 
 ----
프로젝트 흐름 
---
_-> JSP - Controller - Service - Mapper(Mybatis) - DB_
---
#수정사항

---

코드 설명 (기능)   
===
1.스프링 시큐리티를 이용한 로그인, 회원가입  설명 과 세팅 
---   
1-1. 회원가입의 코드 설명과 세팅
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
<form class="login100-form validate-form" action="/signup" method="post">
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
   
**Controller**
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

**MemberVO**
```
@Getter
@Setter
@ToString
public class MemberVO {

	
	private String userid;
	private String userpw,userName;
	private String useremail;
	
	private boolean enabled;
	private String regDate;
	private Date updateDate;
	private List<AuthVO> authList;

}

```
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

	... 생략
```
스프링에서 JSP의 Form action과 Method 에 따라
Controller 의 @GetMapping / @PostMapping 에 action에 적힌 문자( 예: /signup ) 와 같은 문자가 적힌 곳으로 맵핑 됩니다.
그 다음, Controller 의 @PostMapping("/signup") 의
```
@PostMapping("/signup")
	public String signup(MemberVO memvo) throws UnsupportedEncodingException, SQLException {
		if (service.signup(memvo)) {
			service.Account_loginto(memvo.getUserid());
			log.info("sign up success");
		} 
	}
```
으로 와서  if문 안의 **service.signup()** 을 실행 합니다.
실행 하기 전에 
```
@Setter(onMethod_ = { @Autowired })
	private MemberService service;
```
가 의존주입이 되어 있어야 합니다.
그리고 **service.signup()** 은
**MemberService Interface를 상속받은 MemberServiceImpl** 에서 실행합니다. 
```
@Override
	public boolean signup(MemberVO mvo) {
	mvo.setUserpw(BCPE.encode(mvo.getUserpw()));
		mapper.insert(mvo);
		return mapper.insert_auth(mvo) == 1 ? true : false;
	}
```
여기서 BCPE.encode(-) 는 암호화 입니다.
그것을 객체 MemberVO 의 UserPw에 다시 초기화를 해준 뒤,  
~~회원가입 떄 입력 한 userid, useremail, userpw 은 자동적으로 객체 MemberVO에 Set 됩니다.~~  
Oracle DataBase 의 Member 테이블에 넣어주는 SQL문을 실행 합니다.

```
<insert id="insert">
		insert into tbl_member (userid, userpw, username,
		regdate, enabled, useremail) values
		(#{userid}, #{userpw}, '일반사용자'
		,sysdate,0, #{useremail})
	</insert>
```
MemberVO의 객체에 저장된 변수가 Mapper.xml 에서 Mybatis에 의해서   
#{파라미터} 에 자동적으로 들어가서 SQL문을 실행합니다.   
 - 위의 mapper.insert_auth도 마찬가지로 작동을 하며, 권한을 부여해주는 서비스 로직입니다.
   이러한 흐름대로 되며, 회원가입이 정상적으로 됩니다.
---

1-2.로그인 코드 설명   
---
**CustomLogin.jsp** 내의 로그인 Form 코드
```
<form class="login100-form validate-form" action="/login"method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> 
```
**AuthenticationProvider**
```
@Log4j
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	String username = (String) authentication.getPrincipal();
	String password = (String) authentication.getCredentials();
	log.debug("AuthenticationProvider :::::: 1");

	CustomUser user = (CustomUser) service.loadUserByUsername(username);
	log.info("성공적인 로그인");
	
	...생략
	
	return new UsernamePasswordAuthenticationToken(user, user, user.getAuthorities());
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
}
```
**UserDetailsService**
```
@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.warn("Load User & UserName : " + username);
		
		// userName means userid
		MemberVO vo = mapper.read(username);

		log.warn("queried by member mapper :" + vo);
		return vo == null ? null : new CustomUser(vo);
	}
}
```
**LoginSuccessHandler**
```
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.warn("Login Success");

		List<String> roleNames = new ArrayList<>();

		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		log.warn("ROLE NAMES : " + roleNames);
		service.UserLoginSuccess(auth.getName());
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/index?userid="+auth.getName());		
			return;
		}
		if(roleNames.contains("ROLE_USER")) {
			service.UserLoginSuccess(auth.getName());
			response.sendRedirect("/");
			return;
		}	
		response.sendRedirect("/");
	}
}
```

로그인을 하면, Login.jsp 에서 Security Filter를 거쳐서 위의 순서처럼   
**AuthenticationProvider** 에서 먼저 DB에서 유저의 권한을 체크 하고나서 **UserDetailsService** 에서 유저 정보를 가져옵니다.   
가져온 유저 정보를 자동으로 세션 만들어 줍니다.   
그 뒤에 **LoginSuccessHandler** 에서 성공적으로 로그인이 되었다면, 각 권한에 따라 response.sendRedirect 에 된 URL로 이동을 합니다.   
유저라면 메인화면으로, 관리자라면 관리자 페이지로 이동하게 설정이 되어있습니다.   

---
2.비밀번호 변경 및 아이디 찾기 기능
---
**forgot.jsp** 의 Ajax
```
<script type="text/javascript">
$(function() {
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
$(document).ajaxSend(function(e, xhr, options) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
})
$("#submit").on("click",function() {
	if (!$("input[name='userid']").val()) {
		alert("아이디를 입력해주세요.");
		return false;
	}
	if (!$("input[name='userpw']").val()) {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	let userid = $("input[name='userid']").val();
	let userpw = $("input[name='userpw']").val();
	$.ajax({
		url : "/forgot/reset",
		type : 'POST',
		data : JSON.stringify({
			"userid" : userid,
			"userpw" : userpw
		}),
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		processData : false,
		success : function(result) {

			$(opener.document).find("#change").text(
					"정상적으로 비밀번호가 변경되었습니다.");
			self.close();
			return;

		},
		error : function(req, status, error) {
			console.log("req" + req + "status " + status
					+ " error " + error);
		}
	})
})
</script>
```

**MainController - Ajax**
```
@ResponseBody
@PostMapping(value = "/forgot/reset", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public ResponseEntity<String> Reset(@RequestBody String recommend, HttpServletResponse res, HttpServletRequest req)
		throws JsonParseException, JsonMappingException, IOException {
		
		...생략
		
	return new ResponseEntity<>(userpw, HttpStatus.OK);

}

@ResponseBody
@PostMapping(value = "/forgot/findId", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public ResponseEntity<String> FindId(@RequestBody String recommend, HttpServletResponse res, HttpServletRequest req)
		throws JsonParseException, JsonMappingException, IOException {

	...

	return new ResponseEntity<>(mvo.getUserid(), HttpStatus.OK);

}
```

**ServiceImpl**
```
@Override
	public String Reset(MemberVO mvo) {
		// TODO Auto-generated method stub
		String userpw = BCPE.encode(mvo.getUserpw());
		mvo.setUserpw(userpw);
		mapper.Reset(mvo);
		return mvo.getUserpw();
	}
	
@Override
	public MemberVO FindId(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mapper.FindId(mvo);
	}
```
Jsp의 Ajax --> Controller --> Service --> DB 로 갑니다.

그래서 아이디를 찾을 떄는 아이디를 찾아서 반환해주고   
비밀번호를 바꿀떄는 재차 암호화를 한 뒤에 바뀐 비밀번호를 반환 해주어 유저가 알 수 있도록 화면에 띄워주게 됩니다.


---
  
  3.물품 등록 및 물품 예약 & 확인 기능 및 코드 설명
  ---
  3-1 물품 예약 코드 설명
  
  물품 등록은 **관리자** 가 하게 됩니다.    
  그렇지만, 물품 예약과 예약 된 물품을 확인하는 것은 **사용자** 입니다.
  순차대로 작성 하겠습니다.   
  
  **ProductController**
  ```
  @Controller
@Log4j
@RequestMapping(value = "/product/*")
public class ProductControll {

	@GetMapping("/write")
	public void productregister() {
		log.info("product writing");

	}
	
	...생략
	
	@PostMapping("/write")
	public String productregisterAction(ProductVO product, RedirectAttributes rttr) {
		log.info("productregisterAction");

		MultipartFile multipartFile = product.getGoodsfile();
		
		...생략
		
		try {
			multipartFile.transferTo(saveFile);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		service.insert(product);
		return "redirect:/product/product";
	}
}
  ```
  **SPRING SECURITY** 에서 파일을 첨부하려면 설정을 추가 해줘야 합니다.
  
  **Web.xml** 에서    
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
  ```
  이것을 
  ```
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
  앞에 추가를 해주어야 재대로 정상 작동 하게 됩니다.
 ```
 @Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	...생략
	@Override
	public void insert(ProductVO pvo) {
		// TODO Auto-generated method stub
		mapper.insert(pvo);
	}
	
	...생략
}
 ```
그 뒤, 컨트롤러에서  Service 로 넘어오고, 이 서비스에서 다시 Mapper를 호출하여 DB에 저장을 하게 됩니다.
```
public interface ProductMapper {
		public void insert(ProductVO pvo);
}
```
   3-2 물품  코드 설명
  
  
  ---
  4.예약 문의 기능 및 1 : 1 문의 기능 및 코드 설명
  ---
  5.Ajax를 이용하여 회원 실시간 관리 기능 및 코드 설명
  ---
  6.관리자 페이지와 유저 마이페이지에서 전체 관리 기능 및 코드 설명
  ---
  7.로그인 횟수, 로그인 누적 실패 횟수 , 예약 횟수 확인 기능 및 코드 설명
  ---
