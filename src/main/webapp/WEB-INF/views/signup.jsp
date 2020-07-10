<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>SignUp</title>
<%@include file="header.jsp"%>
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/user/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/resources/user/css/main.css">
<link rel="stylesheet" type="text/css" href="/resources/popup.css">
<!--===============================================================================================-->
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	th:content="${_csrf.headerName}" />
</head>
<style type="text/css">
.slicknav_nav .slicknav_arrow {
	margin: 0 0 0 0 !important;
	font-size: 20px !important;
}

input[name='useremail']::after {
	content: attr(data-content);
}

.container-login100 {
	min-height: inherit;
}
</style>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form:form class="login100-form validate-form" action="/signup"
					method="post" onsubmit="return checkAccount()" id="signform">
					<span class="login100-form-title p-b-34"> 会員登録ページ </span>
					<input type="hidden" name="userName" value="USER">
					<div class="row" style="justify-content: center;">
						<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
							data-validate="Type user name">
							<input id="first-name" class="input100" type="text" name="userid"
								placeholder="IDを書いてください。"> <span class="focus-input100"></span>

						</div>
						<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
							data-validate="Type user NickName">
							<input id="nickname" class="input100" type="text" name="nickname"
								placeholder="ニックネームを書いてください。"> <span
								class="focus-input100"></span>

						</div>
						<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
							data-validate="형식에 맞는 이메일 작성.">
							<input class="input100" type="email" name="useremail"
								placeholder="メールを書いてください。"> <span class="focus-input100"></span>

						</div>
						<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
							data-validate="Type password">
							<input class="input100" type="password" name="userpw"
								placeholder="パスワードを書いてください。"> <span
								class="focus-input100"></span>

						</div>

						<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
							data-validate="Type password">
							<input class="input100" type="password" name="userpw_confirm"
								placeholder="パスワード確認"> <span class="focus-input100"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<input type="checkbox" name="agree" id="chk1"><a
								href="#layer1" class="btn-example"><label id="contents1">기본
									약관 목적</label></a>
						</div>
						<div class="input-group">
							<input type="checkbox" name="agree" id="chk2"><a
								href="#layer2" class="btn-example"><label id="contents2">회원
									가입 및 개인정보 보호에 관한 약관</label></a>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button class="btn btn-outline-success login100-form-btn"
							style="font-size: 1rem;">会員登録</button>
					</div>
				</form:form>

				<div class="login100-more"
					style="background-image: url('/resources/user/images/bg-01.jpg');"></div>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<div id="layer1" class="pop-layer">
		<div class="pop-container" style="overflow: scroll;">
			<div class="pop-conts">
				<!--content //-->
				<p class="ctxt mb20">
				<h2>제 1장 총칙</h2>
				<h4>제1조 [목적]</h4>
				<p>본 약관은 주식회사 네시삼십삼분(이하, “회사”)이 유선 및 무선통신망 등을 이용하여 제공하는 서비스와
					관련하여 회사와 회원간의 권리, 의무 및 기타 필요한 사항을 규정하는 것을 목적으로 합니다.</p>
				<hr>
				<h4>제2조 [정의]</h4>
				<p>1) 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
				<p>회사라 함은 회원에게 서비스(콘텐츠 및 제반 서비스)를 제공하는 자를 말합니다.</p>
				<p>회원이라 함은 본 약관에 동의하고 회사가 제공하는 서비스(콘텐츠 및 제반 서비스)의 이용자격을 부여 받은 자를
					말합니다.</p>
				<p>임시회원(게스트 회원이라 칭함)이라 함은 회원 중 오픈마켓을 통한 회원 인증을 하지 않고 게스트로그인 모드를
					이용하여 회사가 제공하는 서비스(콘텐츠 및 제반 서비스)를 이용하는 회원을 말합니다.</p>
				<p>서비스 중 콘텐츠라 함은 회사에서 제공하는 애플리케이션을 실행함으로써 확인되는
					부호ㆍ문자ㆍ도형ㆍ색채ㆍ음성ㆍ음향ㆍ이미지ㆍ영상 등(이들의 복합체를 포함)의 정보나 자료를 말하며, 제반서비스는 회사가
					제공하고 있는 서비스 중 콘텐츠 외적인 서비스를 말합니다.</p>
				<p>아이디(ID)라 함은 회원의 식별과 서비스(콘텐츠 및 제반 서비스)의 이용을 위하여 회원이 정하고, 회사가
					승인하는 문자 또는 숫자의 조합을 말합니다.</p>
				<p>비밀번호(PASSWORD)라 함은 회원임을 확인하고, 비밀의 보호를 위해 회원에게 부여된 아이디와 일치되는
					회원 자신이 정한 문자 또는 숫자의 조합을 말합니다.</p>
				<p>유상포인트라 함은 서비스(콘텐츠 및 제반 서비스)를 이용 또는 구매함에 있어 대금결제수단으로 사용할 수 있는
					정보로서 회원이 회사 또는 제3자로부터 유상으로 구입한 것을 말합니다.</p>
				<p>무상포인트라 함은 서비스(콘텐츠 및 제반 서비스)를 이용 또는 구매함에 있어 대금결제수단으로 사용할 수 있는
					정보로서 회사 또는 제3자가 무상으로 회원에게 지급한 것을 말합니다.</p>
				<p>오픈마켓 사업자라 함은 모바일 기기를 이용하여, 서비스를 다운로드 받고 결제를 대행하는 제3의 회사를
					말합니다.</p>
				<p>2) 본 약관에 사용하는 용어의 정의는 제1항 각호에서 정하는 것을 제외하고는 관계법령 및 기타 일반적인
					상관례에 의합니다.</p>
				<hr>
				<p>제3조 [회사 정보 등의 제공]</p>
				<p>1) 회사는 회원이 쉽게 알 수 있도록 다음 각 호의 사항을 회사의 홈페이지
					(http://localhost:8443/rental/shop)에 게시합니다.</p>
				<p>대표자의 성명 및 상호</p>
				<p>영업소 소재지 주소(회원의 불만을 처리할 수 있는 곳의 주소) 및 전자우편주소</p>
				<p>전화번호 혹은 Fax 번호</p>
				<p>사업자등록번호, 통신판매업 신고번호</p>
				<hr>
				<p>이용약관</p>
				<p>개인정보처리방침</p>
				<p>2) 출력에 제한이 있는 애플리케이션에서는 이용약관 및 개인정보처리방침을 서비스 내에서 연결하여 볼 수 있도록
					하며, 대표자의 성명, 상호, 영업소 주소, 전화번호 혹은 모사전송번호, 사업자등록번호 및 통신판매업 신고번호는
					연결화면에서 확인할 수 있습니다.</p>
				<p>3) 회사가 제공하는 서비스와 관련하여, 서비스의 내용, 정보, 이용조건, 최소시스템 사양(OS) 및 이용등급
					등은 회사의 홈페이지, 각 오픈마켓의 판매화면 등에 표시됩니다.</p>
				<hr>
				<p>제4조 [약관의 게시]</p>
				<p>1) 회사는 이용자가 서비스를 최초 실행할 때 본 약관을 제시하여야 하며, 이용자는 본 약관에 동의하여야
					회원으로서 정상적으로 서비스를 이용할 수 있습니다.</p>
				<p>2) 회사는 회원이 본 약관에 동의하기 전에 약관에 정하여져 있는 내용 중 회원자격의 제한 및 상실,
					청약철회, 과오금의 환불, 이용제한, 해지, 이용자에 대한 피해보상 등과 같은 중요한 내용을 이용자가 쉽게 알 수 있도록
					굵고 큰 글씨 등으로 표시하거나 별도의 연결화면 또는 팝업화면 등을 제공하여 설명합니다.</p>
				<p>3) 회원은 회사의 홈페이지(http://localhost:8443/rental/shop)에서 언제든지 본
					약관을 인쇄할 수 있습니다.</p>
				<p>4) 제1항 내지 제3항을 위반한 경우 회사는 본 약관의 전부 또는 일부를 계약의 내용으로 주장하지 못합니다.</p>
				<hr>
				<p>제5조 [약관의 변경]</p>
				<p>1) 회사는 「콘텐츠산업진흥법」, 「전자상거래등에서의소비자보호에관한법률」, 「약관의규제에관한법률」,
					문화체육관광부장관이 정하는 「콘텐츠이용자보호지침」 기타 관계법령 및 상관습에 위배되지 않는 범위에서 본 약관을 변경할 수
					있습니다.</p>
				<p>2) 약관의 변경 시 회사는 변경약관의 적용일자 및 변경사유를 명시하여야 하며, 그 적용일자로부터 역산하여
					최소 7일(이용자에게 불리한 변경 또는 중대한 사항의 변경은 30일)전부터 이후로 상당한 기간 동안 서비스 초기화면 혹은
					회사의 홈페이지(http://www.433.co.kr)를 통하여 공지합니다.</p>
				<p>3) 약관의 변경 시 회사는 제2항의 공지기간 동안 회원이 회사에 대하여 거부의사를 명시적으로 표시하지
					아니하는 경우에는 해당 회원이 변경약관에 승낙한 것으로 간주합니다. 단, 약관의 변경에 동의하지 않는 회원은 본 약관에서
					정한 방법으로 탈퇴할 수 있습니다.</p>
				<p>4) 관계법령 등의 개정으로 인하여 변경약관을 적용하게 된 경우를 제외하고, 회사는 회원이 변경약관의 적용을
					거절한 경우 변경 전 약관에 따른 서비스 제공이 기술적, 영업적으로 가능한 때에는 변경 전 약관에 따라 서비스를 제공할
					수 있습니다. 다만, 변경 전 약관에 따라 서비스를 제공하는 것이 기술적, 영업적으로 곤란한 경우 회사는 회원의 손해를
					배상하고, 서비스 이용계약을 해지할 수 있습니다.</p>
				<p>5) 회원이 변경약관의 적용에 동의하지 않는 경우 회사 혹은 회원은 서비스 이용계약을 해지할 수 있습니다.</p>
				<hr>
				<p>제6조 [약관의 해석]</p>
				<p>1) 회사는 본 약관에서 정하지 아니한 구체적인 내용을 운영정책 등을 통해 정할 수 있으며, 이 경우 운영정책
					등은 본 약관에 대한 보충적 효력을 갖습니다. 회사는 운영정책의 내용을 회원이 알 수 있도록 서비스 홈페이지에 게시하거나
					연결화면을 제공하는 방법으로 회원에게 공지하여야 합니다.</p>
				<p>2) 본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 「콘텐츠산업진흥법」, 「전자상거래 등에서의
					소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 문화체육관광부장관이 정하는 「콘텐츠 이용자 보호지침」 기타
					관계법령에 따릅니다.</p>
				</p>
				<div class="btn-r">
					<a href="#" class="btn-layerClose" id='agree'>동의하기</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
	<div id="layer2" class="pop-layer">
		<div class="pop-container" style="overflow: scroll;">
			<div class="pop-conts">
				<!--content //-->
				<h3>제2장 회원가입 및 개인정보보호 등</h3>
				<br>
				<p class="ctxt mb20">
					제7조 [이용계약의 발생]<br> 1) 이용계약은 회원이 되고자 하는 이용자(이하, 가입신청자)가 본 약관의
					내용에 대하여 동의를 한 다음 서비스 이용 신청을 하고, 회사가 이러한 신청에 대해서 승낙함으로써 체결됩니다.<br>
					2) 회사는 이용자의 서비스 이용 신청에 대하여 승낙함을 원칙으로 합니다. 다만, 회사는 다음 각 호의 어느 하나에
					해당하는 이용 신청에 대해서는 승낙을 하지 않거나, 사후에 이용계약을 취소할 수 있습니다.<br> 이용신청서
					내용을 허위로 기재하거나 이용신청 요건을 충족하지 못한 경우<br> 회사가 서비스를 제공하지 않은 국가에서
					비정상적이거나 우회적인 방법을 통해 서비스를 이용하는 경우<br> 「게임산업진흥에관한법률」 등 관계 법령에서
					금지하는 행위를 할 목적으로 이용 신청 하는 경우<br> 사회의 안녕과 질서 또는 미풍양속을 저해할 목적으로
					신청한 경우<br> 부정한 용도로 게임서비스를 이용하고자 하는 경우<br> 영리를 추구할 목적으로
					게임서비스를 이용하고자 하는 경우<br> 그 밖에 제1호 내지 제6호에 준하는 사유로서 승낙이 부적절하다고
					판단되는 경우<br> 3) 회사는 다음 각 호의 어느 하나에 해당하는 경우 그 사유가 해소될 때까지 승낙을
					유보할 수 있습니다.<br> 회사의 설비에 여유가 없거나 특정 단말기 지원이 어렵거나 기술적 장애가 있는 경우<br>
					서비스 상의 장애 또는 서비스 이용요금, 결제수단의 장애가 발생한 경우<br> 그 밖의 사유로 이용신청의 승낙이
					곤란한 경우<br> 4) 회사는 서비스의 각 콘텐츠 별로 회원의 등급을 구분하고 이용시간, 횟수, 결제 정보 등
					수집되는 사항에 따라 서비스 메뉴와 서비스의 이용 유무/추가기능 등을 회원 등급별로 다르게 제공할 수 있습니다.<br>
					제8조 [청소년 회원가입 등에 관한 특칙]<br> 청소년(18세 미만의 자로서 「초ㆍ중등교육법」 제 2조의
					규정에 의한 고등학교에 재학중인 학생을 포함)이 서비스를 이용하는 경우 그 법정대리인은 회사에 해당 청소년의 개인정보의
					열람, 정정 및 갱신을 요청하거나 회원가입에 대한 동의를 철회할 수 있으며, 이 경우 회사는 수집한 청소년의 개인정보를
					파기하는 등 필요한 조치를 취합니다.<br> 제9조 [회원의 아이디 및 비밀번호의 관리에 대한 의무]<br>
					1) 회원이 서비스에서 사용하는 닉네임 및 비밀번호 등 회원정보에 대한 관리책임은 회원 본인에게 있습니다. 회원이 본인의
					서비스 정보를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 제3자의 부정이용 등에 대한 책임 역시 회원 본인에게
					있으며 회사는 그에 대한 책임을 지지 않습니다.<br> 2) 회사는 회원에게 제공하는 서비스에서 개인정보 유출
					우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인할 여지가 있는 경우 혹은 타 회원으로
					착각하도록 의도되었다고 판단될 경우 해당 서비스 이용을 사전 통보 없이 변경/제한할 수 있습니다.<br> 3)
					회원은 회사에서 제공한 서비스가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의
					안내에 따라야 합니다. 해당 회원이 회사에 그 사실을 통지하지 않거나, 통지한 경우에도 회사의 안내에 따르지 않아 발생한
					불이익에 대하여 회사는 일체의 책임을 지지 않습니다.<br> 4) 회사는 오픈마켓 정책에 따라 이용자의 편의성을
					위해 게스트 회원으로 게임을 이용하게 할 수 있습니다. 다만, 게스트 회원으로 게임을 이용하는 경우 회사는 해당 계정정보
					및 게임 플레이 정보 등을 수집하거나 저장하지 않으므로 단말기 변경 또는 기기 개조 등으로 서비스의 데이터가 초기화되거나
					애플리케이션이 삭제되는 경우 그에 대한 확인 및 복구가 불가능하며, 회사는 이에 대한 일체의 책임을 지지 않습니다.<br>
					제10조 [정보의 수집 등]<br> 1) 회사는 원활한 서비스 제공을 위하여 회원간에 이루어지는 채팅내용을 수집
					및 이용할 수 있습니다. 회사는 회원간의 분쟁 조정, 민원 처리 또는 게임 질서의 유지를 위하여 회사가 필요하다고
					판단하는 경우에 한하여 본 정보를 열람하도록 할 것이며, 본 정보는 회사만이 보유하고 법령으로 권한을 부여 받지 아니한
					타인은 절대로 열람할 수 없습니다.<br> 2) 회사는 서비스 운영 및 프로그램 안정화 등 서비스 품질 개선을
					위하여 회원 등 단말기 설정 및 사양 정보를 수집 ‧ 활용할 수 있습니다.<br> 3) 회사는 서비스 개선 및
					회원 대상 서비스 소개 등을 위한 목적으로 회원 개인에 대한 추가정보를 요구할 수 있으며, 동 요청에 대해 회원은
					승낙하여 추가정보를 제공하거나 거부할 수 있습니다.<br> 제11조 [개인정보의 보호 및 사용]<br>
					1) 회사는 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력하며, 개인정보의 보호 및 사용에 대해서는
					관련 법령 및 회사의 개인정보처리방침에 따릅니다. 단, 회사의 공식 게임서비스 및 사이트 이외의 링크된 서비스에서는
					회사의 개인정보처리방침이 적용되지 않습니다.<br> 2) 서비스의 특성에 따라 회원의 별명, 사진 등 자신을
					소개하는 내용이 공개될 수 있습니다.<br> 3) 회사는 관계 법령에 의해 관련 국가기관 등의 요구가 있는
					경우를 제외하고는 회원의 개인정보를 본인의 승낙 없이 타인에게 제공하지 않습니다.<br> 4) 회사는 회원의
					귀책사유로 개인 정보가 유출되어 발생한 서비스 이용 관련 피해에 대하여 책임이 면제됩니다.<br>
				</p>

				<div class="btn-r">
					<a href="#" class="btn-layerClose" id='agree'>동의하기</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/user/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect1')
		});
	</script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/user/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/js/main.js"></script>
	<script type="application/javascript">
		
		
		
	$('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }
    $(function(){
    	var agree = document.querySelectorAll("#agree");
    	var chk = document.querySelectorAll("input[name='agree']");
   	console.log(agree);
   	console.log(chk);
    	
	$(agree[0]).on("click",function(){
		$(chk[0]).prop("checked",true);
	})
	$(agree[1]).on("click",function(){
		$(chk[1]).prop("checked",true);
	})
    })
    	  
  function getIP(json) {
    return json.ip;
  }
	</script>
	<script type="application/javascript"
		src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
	<script type="text/javascript">
		function checkAccount() {
			let userid = $("input[name='userid']").val();
			let useremail = $("input[name='useremail']").val();
			let userpw = $("input[name='userpw']").val();
			let userpw_confirm = $("input[name='userpw_confirm']").val();
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z]([-_.]?[0-9a-zA-Z])*.[a-z]{2,3}$/i;

			if (!userid) {
				alert("IDを入力してください。.");
				return false;
			}
			if (!useremail && regExp.test(useremail) == false) {
				alert("Eメール形式ではない、または、Eメールを入力していません。");
				return false;
			}
			if ($("input[name='userpw']").length == 0) {
				alert("パスワードが入力されていません。");
				return false;
			}
			if (userpw != userpw_confirm) {
				alert("パスワードを的確に入力してください。");
				return false;
			}
			var chkbox = document.getElementsByName('agree');
			var chk = false;
			for (var i = 0; i < chkbox.length; i++) {
				if (chkbox[i].checked) {
					chk = true;
				} else {
					chk = false;
				}
			}
			if (chk) {
				alert("全ての約款に同意しました。");

			} else {
				alert("全ての約款に同意してください。");
				return false;
			}

			var form = $("#signform");
			form.append("<input type='hidden' name='ip' value='" + getIP(json)
					+ "'>")
			form.submit();
		}
	</script>
	<script type="text/javascript">
		$(function(e) {
			'use strict'

			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})

			$("input[name='useremail']").on("change", function(e) {

				var useremail = $("input[name='useremail']").val();
				var datas = {
					"useremail" : useremail
				};

				$.ajax({
					url : "/emailcheck",
					type : 'POST',
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(datas),
					dataType : 'JSON',
					processData : false,
					success : function(result) {
						console.log(result);
						if (!result) {
							alert('重複したEメールです。また入力してください。');
							$("input[name='useremail']").val("");
						}
					},
					error : function(req, status, error) {
						console.log(error);
					}
				})
			})

		})
	</script>
	<script type="text/javascript">
		$(function(e) {
			'use strict'

			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})

			$("input[name='userid']").on("change", function(e) {

				var userid = $("input[name='userid']").val();
				var datas = {
					"userid" : userid
				};

				$.ajax({
					url : "/idcheck",
					type : 'POST',
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(datas),
					dataType : 'JSON',
					processData : false,
					success : function(result) {
						console.log(result);
						if (!result) {
							alert('現在存在しているIDです。また入力してください。');
							$("input[name='userid']").val("");
						}
					},
					error : function(req, status, error) {
						console.log(error);
					}
				})
			})

		})
	</script>

	<%@include file="footer.jsp"%>