<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>



<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Datepicker - Select a Date Range</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/product/product.css">
<link rel="stylesheet" href="/resources/product/pagination.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
footer {
	margin-left: 0 !important;
	margin-right: 0 !important;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}

.button2:hover {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}

.gj-datepicker-md [role="right-icon"] {
	position: absolute;
	right: 0px;
	top: 1px;
}
</style>
</head>
<body>

	<div class="container">
			<hr style="border-top:1px solid green">
		<div class="col-md-12">
			<div class="calender">
				<div class="row" style="justify-content: center;">

					<p>
						From: <input type="text" id="datepicker1">
					</p>
					<div class="col-offset-1 col-md-1"></div>
					<p>
						To: <input type="text" id="datepicker2">
					</p>
					<div class="col-offset-1 col-md-1"></div>
					<button class="btn btn-outline-success" id="searchs">검색</button>
				</div>
			</div>
		</div>
		<hr style="border-top:1px solid green">
		<section class="products">
			<c:forEach items="${product }" var="pro">
				<div class="product-card">
					<div class="product-image">
						<img src="/upload/${pro.goodsphoto }">
					</div>
					<div class="product-info">
						<h5>${pro.goods }</h5>
						<h6>${pro.price }원</h6>
					</div>
					<c:choose>
						<c:when test="${pro.status !=0 }">
							<sec:authorize access="isAuthenticated()">
								<button class="genric-btn success-border circle"
									style="background: none; color: black;" id="inview"
									data-day="${fn:substring(pro.lastdate,0,10) }"
									onclick="javascript:location.href='/product/view?num=${pro.num }&userid=${pro.userid }&pageNum=${pageMaker.cri.pageNum }&nickname=<sec:authentication property="principal.member.nickname"/>'">商品詳細</button>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<button class="genric-btn success-border circle"
									style="background: none; color: black;" id="inview"
									data-day="${fn:substring(pro.lastdate,0,10) }"
									onclick="javascript:location.href='/product/view?num=${pro.num }&userid=${pro.userid }&pageNum=${pageMaker.cri.pageNum }'">商品詳細</button>
							</sec:authorize>
						</c:when>
						<c:when test="${pro.status == 0 }">
							<button class="genric-btn success-border circle"
								style="background: none; border-color: red; color: black;"
								onclick='NoRes();'>予約不可</button>
						</c:when>
					</c:choose>
				</div>
			</c:forEach>



		</section>
		<div class="pagination-container wow zoomIn mar-b-1x"
			data-wow-duration="0.5s">
			<ul class="pagination" style="justify-content: center;">
				<c:if test="${pageMaker.prev }">
					<li><a href="${pageMaker.startPage - 1 }"><i
							class="fa  fa-arrow-left"></i></a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li><a href="${num }"
						class="${pageMaker.cri.pageNum == num ? 'active':''  }">${num }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li><a href="${pageMaker.endPage+1}"><i
							class="fa  fa-arrow-right"></i></a></li>
				</c:if>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member.userid" var="id" />
					<button class="genric-btn info-border circle"
						style="position: absolute; right: 140px;"
						onclick="javascript:location.href='/product/write?userid=${id}'">글쓰기</button>
				</sec:authorize>
			</ul>



		</div>
	</div>

</body>

<form id="actionForm" action="/product/product" method="get"></form>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function NoRes() {
		alert("재고가 부족합니다. 1:1문의를 해주시기 바랍니다.");
		return false;
	}
</script>
<script type="text/javascript">
	$(".pagination li  a").on("click", function(e) {
		e.preventDefault();
		var num = $(this).attr("href");
		console.log(num);
		var form = $("#actionForm");
		form.append("<input name='pageNum' value='"+num+"'>");
		form.append("<input name='amount' value='"+8+"'>");

		form.submit();

	})
</script>

<script>
	$(document).ready(function() {
		var today = new Date(new Date().setDate(new Date().getDate() - 1));
		$("#datepicker1").datepicker({
			numberOfMonths : 2,
			onSelect : function(selected) {
				$("#datepicker2").datepicker("option", "minDate", selected)
			},
			minDate : today,
			onClose : function(today) {
				minDate: today
			}

		});
		var todays = new Date(new Date().setDate(new Date().getDate()));
		$("#datepicker2").datepicker({
			numberOfMonths : 2,
			onSelect : function(selected) {
				$("#datepicker1").datepicker("option", "minDate", selected)
			},
			minDate : todays,
			onClose : function(todays) {
				minDate: todays
			}
		});
	});

	$("#searchs").on(
			"click",
			function(e) {
				e.preventDefault();
				var Fromdate = getFormatDate($("#datepicker1").val());
				//$("#datepicker1").val();
				var Todate = getFormatDate($("#datepicker2").val());
				console.log(Fromdate);
				console.log(Todate);
				if (Fromdate >= Todate) {
					alert("검색할수 없는 날짜입니다.");
					$("input[name='datepicker2']").val("");
					return;
				}
				window.location.href = "/product/productSearch?startdate="
						+ Fromdate + "&enddate=" + Todate;
			})
</script>

<script type="text/javascript">
	function getFormatDate(date) {
		var Fulldate = date.split('/');

		var year = Fulldate[2]; //yyyy
		var month = (Fulldate[0]); //month 두자리로 저장
		var day = Fulldate[1]; //d
		return year + '/' + month + '/' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
</script>
<script type="text/javascript">
	var days = $(".products #inview");
	var day = new Array();
	var today = transNowDate(years(), mon(), date());

	//날짜 비교 후. 현재 날짜  > 렌탈 종료일자 일떄
	for (var i = 0; i < days.length; i++) {
		day = $(days[i]).attr("data-day");
		var daying = distributeDate(day);
		if (compareToDate(today, daying)) {
			$(days[i]).attr("disabled", true);
			$(days[i]).text("レンタルに期間過ぎ");
			$(days[i]).css({
				"border-color" : "red",
				"color" : "red"
			});
			$(days[i]).attr("onclick", "alert('レンタル終了を過ぎました。')")
		}
	}

	//날짜 관련 함수
	function distributeDate(day) {
		let year = day.substring(0, 4);
		let month = day.substring(5, 7);
		let days = day.substring(8);
		if (day != null || day != "") {
			return new Date(year, month, days);
		} else {
			return null;
		}
	}
	function transNowDate(year, month, day) {
		return new Date(year, month, day);
	}
	function compareToDate(day1, day2) {
		if (day1 > day2) {
			return true;
		} else if (day1 < day2) {
			return false;
		}
	}
	function now() {
		return new Date();
	}
	function years() {
		if (now().getFullYear() < 10) {
			return "0" + now().getFullYear();
		} else {

			return now().getFullYear();
		}
	}
	function mon() {
		if (now().getMonth() < 10) {
			return "0" + (now().getMonth() + 1);
		} else {
			return (now().getMonth() + 1);
		}
	}
	function date() {
		if (now().getDate() < 10) {
			return "0" + now().getDate();
		} else {
			return now().getDate();
		}
	}
</script>
<%@include file="../footer.jsp"%>