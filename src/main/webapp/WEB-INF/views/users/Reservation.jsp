<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="../plugins/images/favicon.png">
<title>RENTAL BYCICLE COMPANY</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/admin/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- animation CSS -->
<link href="/resources/admin/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/admin/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="/resources/admin/css/colors/blue-dark.css" id="theme"
	rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style type="text/css">
.flex {
	width: 50vw;
	height: 80px;
	line-height: 80px;
	background-color: white;
	margin: 0 auto;
}

.flex ul {
	display: flex;
	padding: 0;
	margin: 0;
	box-shadow: 0 10px 20px 0 rgba(black, 0.25);
}

.flex ul li {
	flex: 1;
	list-style: none;
	text-align: center;
	position: relative;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	user-select: none;
}

.flex ul li &:hover {
	background-color: rgba(white, 0.25);
	color: #f564a9;
}

.flex ul .active:hover {
	width: 10%;
	background-color: #f564a9;
	height: 5px;
}

tml, body {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

*, *:before, *:after {
	box-sizing: inherit;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

/* ======== Calendar ======== */
.my-calendar {
	width: 700px;
	margin: 30px;
	padding: 20px 20px 10px;
	text-align: center;
	font-weight: 800;
	border: 1px solid #ddd;
	cursor: default;
}

.my-calendar .clicked-date {
	border-radius: 25px;
	margin-top: 36px;
	float: left;
	width: 42%;
	padding: 46px 0 26px;
	background: #ddd;
}

.my-calendar .calendar-box {
	float: right;
	width: 58%;
	padding-left: 30px;
}

.clicked-date .cal-day {
	font-size: 24px;
}

.clicked-date .cal-date {
	font-size: 130px;
}

.ctr-box {
	padding: 0 16px;
	margin-bottom: 20px;
	font-size: 20px;
}

.ctr-box .btn-cal {
	position: relative;
	float: left;
	width: 25px;
	height: 25px;
	margin-top: 5px;
	font-size: 16px;
	cursor: pointer;
	border: none;
	background: none;
}

.ctr-box .btn-cal:after {
	content: '<';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	line-height: 25px;
	font-weight: bold;
	font-size: 20px;
}

.ctr-box .btn-cal.next {
	float: right;
}

.ctr-box .btn-cal.next:after {
	content: '>';
}

.cal-table {
	width: 100%;
}

.cal-table th {
	width: 14.2857%;
	padding-bottom: 5px;
	font-size: 16px;
	font-weight: 900;
}

.cal-table td {
	padding: 3px 0;
	height: 50px;
	font-size: 15px;
	vertical-align: middle;
}

.cal-table td.day {
	position: relative;
	cursor: pointer;
}

.cal-table td.today {
	background: #ffd255;
	border-radius: 50%;
	color: #fff;
}

.cal-table td.day-active {
	background: #ff8585;
	border-radius: 50%;
	color: #fff;
}

.cal-table td.has-event:after {
	content: '';
	display: block;
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 4px;
	background: #FFC107;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	vertical-align: middle;
	float: right;
	margin-right: 170px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top m-b-0">
			<div class="navbar-header">
				<a class="navbar-toggle hidden-sm hidden-md hidden-lg "
					href="javascript:void(0)" data-toggle="collapse"
					data-target=".navbar-collapse"><i class="fa fa-bars"></i></a>


				<ul class="nav navbar-top-links navbar-right pull-right">
					<li><a class="profile-pic" href="#"> </a></li>
				</ul>
			</div>
		</nav>
		<!-- Left navbar-header -->
		<%@include file="navi.jsp"%>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">商品管理ページ</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<ol class="breadcrumb">
							<li><a href="#">Dashboard</a></li>
							<li class="active">商品テーブル</li>
						</ol>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="container">
						<div class="row">

							<div class="my-calendar clearfix"
								style="display: inline-block; background-color: white; border-radius: 10px;">
								<div class="clicked-date">
									<div class="cal-day"></div>
									<div class="cal-date"></div>
								</div>
								<div class="calendar-box">
									<div class="ctr-box clearfix">
										<button type="button" title="prev" class="btn-cal prev">
										</button>
										<span class="cal-month"></span> <span class="cal-year"></span>
										<button type="button" title="next" class="btn-cal next">
										</button>
									</div>
									<table class="cal-table">
										<thead>
											<tr>
												<th>S</th>
												<th>M</th>
												<th>T</th>
												<th>W</th>
												<th>T</th>
												<th>F</th>
												<th>S</th>
											</tr>
										</thead>
										<tbody class="cal-body"></tbody>
									</table>
								</div>
							</div>
							<!-- // .my-calendar -->

							<form name="searchDate" action="/users/searchDate" method="get">
								<div class="col-md-12"
									style="position: relative; height: 100px;">
									<button class="button"
										style="vertical-align: middle; position: absolute; top: 0; z-index: 11; left: 50%; transform: translateX(-50%);">
										<input type="hidden" name="userid"
											value="<%=request.getParameter("userid")%>"> <input
											type="hidden" name="day" value=""> <input
											type="hidden" name="month" value=""> <span>검색</span>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<script type="text/javascript">
				$("buttom").click(function(){
					var form = $(".searchDate");
					form.submit();
				})
</script>
				<div class="row">
					<div class="col-sm-12">
						<div class="white-box">
							<h3 class="box-title">Product Table</h3>

							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>予約商品</th>
											<th>購買日</th>
											<th>予約非</th>
											<th>レンタル期間</th>
											<th>金額</th>
										</tr>
									</thead>
									<tbody>
										<c:set
											value="${pageMaker.total - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount}"
											var="bno" />
										<c:forEach items="${res }" var="res">

											<tr>
												<td>${bno }</td>
												<td><img style="max-width: 150px;"
													src="/upload/${res.goodsphoto }"></td>
												<td>${res.resdate }</td>
												<td>${fn:substring(res.startdate,0,10)}~${fn:substring(res.lastdate,0,10)}</td>
												<td>7일</td>
												<td id="prices">${res.price }</td>
											</tr>
											<c:set var="bno" value="${bno-1 }" />
										</c:forEach>

										<!--<tr style="border-top: 4px double black;">
											<td>렌탈 총 횟수 :</td>
											<td colspan="2" id="count">${count.count }회</td>
											<td>총 금액 :</td>
											<td id="price"><fmt:formatNumber value="${count.price }"
													type="currency" pattern="###,###원" /></td>

										</tr>
 -->
									</tbody>

								</table>
							</div>
							<div class="flex paging">
								<ul>
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


								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			<footer class="footer text-center"> 2017 &copy; Pixel Admin
				brought to you by wrappixel.com </footer>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<form id="actionForm" action="/users/Reservation" method="get">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>
	<!-- jQuery -->
	<script
		src="/resources/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/admin/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script src="/resources/admin/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="/resources/admin/js/waves.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="/resources/admin/js/custom.min.js"></script>
	<script type="text/javascript">
	// ================================
	// START YOUR APP HERE
	// ================================
	const init = {
	  monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	  dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
	  today: new Date(),
	  monForChange: new Date().getMonth(),
	  activeDate: new Date(),
	  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
	  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
	  nextMonth: function () {
	    let d = new Date();
	    d.setDate(1);
	    d.setMonth(++this.monForChange);
	    this.activeDate = d;
	    return d;
	  },
	  prevMonth: function () {
	    let d = new Date();
	    d.setDate(1);
	    d.setMonth(--this.monForChange);
	    this.activeDate = d;
	    return d;
	  },
	  addZero: (num) => (num < 10) ? '0' + num : num,
	  activeDTag: null,
	  getIndex: function (node) {
	    let index = 0;
	    while (node = node.previousElementSibling) {
	      index++;
	    }
	    return index;
	  }
	};

	const $calBody = document.querySelector('.cal-body');
	const $btnNext = document.querySelector('.btn-cal.next');
	const $btnPrev = document.querySelector('.btn-cal.prev');

	/**
	 * @param {number} date
	 * @param {number} dayIn
	*/
	function loadDate (date, dayIn) {
	  document.querySelector('.cal-date').textContent = date;
	  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
	  var days = $(".cal-date").text();
	  $("input[name='day']").val(days);
	  var month = $(".cal-month").text();
	  $("input[name='month']").val(month);
	}

	/**
	 * @param {date} fullDate
	 */
	function loadYYMM (fullDate) {
	  let yy = fullDate.getFullYear();
	  let mm = fullDate.getMonth();
	  let firstDay = init.getFirstDay(yy, mm);
	  let lastDay = init.getLastDay(yy, mm);
	  let markToday;  // for marking today date
	  
	  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
	    markToday = init.today.getDate();
	  }

	  document.querySelector('.cal-month').textContent = init.monList[mm];
	  document.querySelector('.cal-year').textContent = yy;

	  let trtd = '';
	  let startCount;
	  let countDay = 0;
	  for (let i = 0; i < 6; i++) {
	    trtd += '<tr>';
	    for (let j = 0; j < 7; j++) {
	      if (i === 0 && !startCount && j === firstDay.getDay()) {
	        startCount = 1;
	      }
	      if (!startCount) {
	        trtd += '<td>'
	      } else {
	        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
	        trtd += '<td class="day';
	        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
	        trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
	      }
	      trtd += (startCount) ? ++countDay : '';
	      if (countDay === lastDay.getDate()) { 
	        startCount = 0; 
	      }
	      trtd += '</td>';
	    }
	    trtd += '</tr>';
	  }
	  $calBody.innerHTML = trtd;
	}

	/**
	 * @param {string} val
	 */
	function createNewList (val) {
	  let id = new Date().getTime() + '';
	  let yy = init.activeDate.getFullYear();
	  let mm = init.activeDate.getMonth() + 1;
	  let dd = init.activeDate.getDate();
	  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

	  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

	  let eventData = {};
	  eventData['date'] = date;
	  eventData['memo'] = val;
	  eventData['complete'] = false;
	  eventData['id'] = id;
	  init.event.push(eventData);
	  $todoList.appendChild(createLi(id, val, date));
	}

	loadYYMM(init.today);
	loadDate(init.today.getDate(), init.today.getDay());

	$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
	$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

	$calBody.addEventListener('click', (e) => {
	  if (e.target.classList.contains('day')) {
	    if (init.activeDTag) {
	      init.activeDTag.classList.remove('day-active');
	    }
	    let day = Number(e.target.textContent);
	    loadDate(day, e.target.cellIndex);
	    e.target.classList.add('day-active');

	    init.activeDTag = e.target;
	    init.activeDate.setDate(day);
	    reloadTodo(); 
	  }
	  
	});

	</script>
	<script type="text/javascript">

		$(".paging a").on(
				"click",
				function(e) {
					e.preventDefault();
					var num = $(this).attr("href");
					var userid = '<%=request.getParameter("userid")%>';
			var form = $("#actionForm");
			form.append("<input name='pageNum' value='"+num+"'>");
			form.append("<input name='userid' value='"+userid+"'>");
			form.submit();

		})
	</script>


</body>

</html>