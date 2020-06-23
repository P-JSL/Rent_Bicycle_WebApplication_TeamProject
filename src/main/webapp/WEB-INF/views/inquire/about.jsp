<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.css">
<link rel="stylesheet" href="/resources/intro.css">
<body>
	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_3">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text text-center">
						<h3>이용 안내</h3>
						<p>P</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->
	<div id="root">
		<div class="App">
			<section class="content" id="guide-cont">
				<div class="wrap">
					<section class="howto">
						<h2 class="sub-title">자전거 렌탈 홈페이지 이용방법을 알려드립니다!</h2>
						<ul class="list-01" style="overflow: hidden;">
							<li class="mv moveit"><h3>
									<span>1</span> 가입하기
								</h3>
								<p>스마트폰에 쏘카 앱을 다운로드 받고 자동차 운전면허증과 결제카드를 등록해 주세요. 쏘카는 만 21세
									이상, 운전면허 취득 1년 이상부터 이용이 가능합니다.</p></li>
							<li class="mv moveit"><h3>
									<span>2</span> 예약하기
								</h3>
								<p>이용 시간을 설정하고 차량이 필요한 장소와 원하는 차종을 선택해 주세요. 가까운 쏘카존에서 예약하거나
									내 집 앞으로 쏘카를 부를 수도 있습니다.</p>
								<section class="banner-01" style="overflow: hidden;">
									<sec:authorize access="isAuthenticated()">
										<a href="/inquire" class="btn btna2 mv3 moveit">렌탈 문의 바로가기</a>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										<a href="javascript:loginmove();"
											class="btn btna2 mv3 moveit">렌탈 문의 바로가기</a>
									</sec:authorize>
								</section></li>
							<li class="mv moveit"><h3>
									<span>3</span> 차량찾기
								</h3>
								<p>차량이 주차된 쏘카존의 상세 정보를 쏘카 앱에서 확인하세요. 쏘카 앱 내 스마트키로 비상등을 켜거나
									경적을 울려 쏘카를 보다 손쉽게 찾을 수 있습니다.</p></li>
							<li class="mv moveit"><h3>
									<span>4</span> 이용하기
								</h3>
								<p>탑승 전 외관, 내부, 기름양 등 차량 상태를 확인해 주세요. 쏘카 앱 내 스마트키로 간편하게 차량
									문을 열고 닫을 수 있습니다.</p></li>
							<li class="mv moveit"><h3>
									<span>5</span> 반납하기
								</h3>
								<p>지정된 장소에 주차 후 차량 내 놓고 내리는 물건은 없는지 확인해 주세요. 차 문을 잠근 후 반납하기
									버튼을 누르면 이용이 완료됩니다.</p></li>
						</ul>
					</section>
					<section class="banner-01" style="overflow: hidden;">
						<div id="blue" class="mvright moveit"></div>
						<h2>
							<span>렌탈 이용 요금</span>도<br> 확인 해보세요
						</h2>
						<a href="/fare" class="btn btna2 mv3 moveit">서비스 요금 바로가기</a>
					</section>

				</div>
			</section>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.js"></script>
		<script type="text/javascript">
		$(function(){
			  $(window).scroll(function() {
				  if($(this).scrollTop() < 400){
					  $("header a").css("color", "#fff");
					  $("header p").css("color", "#fff");
					  $("header ul#navigation ul.submenu").css("background", "transparent");
					  $("ul.submenu a").css("color", "#fff");
					  $("div.mobile_menu a").css("color", "black");
				  }
				  if($(this).scrollTop() > 400){
					  $("header a").css("color", "black");
					  $("header p").css("color", "black");
					  $("header ul#navigation ul.submenu").css("background", "#fff");
				  }
			  })

			})
		</script>
		<script type="text/javascript">
		function loginmove(){
			alert("로그인이 필요합니다.");
			location.href='/CustomLogin';
		}
		</script>
	<%@include file="../footer.jsp"%>