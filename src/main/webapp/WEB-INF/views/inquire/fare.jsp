<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.css">
<link rel="stylesheet" href="/resources/intro.css">
<section class="content" id="fare-cont">
	<div class="wrap">
		<section class="fare-info" style="overflow: hidden;">
			<h2 class="sub-title">쏘카 서비스 요금</h2>
			<ul class="info-box">
				<li><h3>탑승 전 결제</h3>
					<div>
						<h6>대여요금</h6>
						<p>시간당 차량을 대여하는 요금입니다.</p>
					</div>
					<div class="g">
						<h6>보험료</h6>
						<p>사고 시 최대 자기부담금을 선택할 수 있으며 이에 따라 보험료가 상이합니다.</p>
					</div></li>
				<li><h3>반납 시 결제</h3>
					<div class="">
						<h6>주행료</h6>
						<p>주행거리에 따라 km당 주행요금이 부과됩니다. (하이패스 이용 시 주행요금과 합산 청구)</p>
					</div></li>
			</ul>
		</section>
		<section class="fare-insurance">
			<h2 class="sub-title">쏘카 보험 안내</h2>
			<h6>쏘카는 자동차 종합보험에 가입된 자동차를 제공하며, 사고 발생 시 회원의 손실을 보호하기 위한 차량
				손해면책제도를 운용합니다.</h6>
			<ul class="info-box">
				<li><h3>고객 부담</h3>
					<div>
						<h6>쏘카 수리비</h6>
						<p>대여 시 선택한 보험료에 따라 자기부담금 이하 금액만큼만 부담</p>
					</div></li>
				<li><h3>쏘카 부담</h3>
					<div class="g">
						<h6>대인 : 무한</h6>
						<p>동승자, 보행자, 상대방 차량의 운전자, 병원비</p>
					</div>
					<div class="g">
						<h6>대물 : 1억원 한도</h6>
						<p>상대방 차량 수리비, 나무/전봇대 등 기물 파손</p>
					</div>
					<div class="g">
						<h6>자손 : 1천5백만원 한도</h6>
						<p>운전자 병원비</p>
					</div></li>
			</ul>
		</section>
	</div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.js"></script>
<%@include file="../footer.jsp"%>