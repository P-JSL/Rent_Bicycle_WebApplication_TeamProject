<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style>
.info {
	text-align: center;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
#myBtn{
    margin-left: 305px;
    /* text-align: center; */
    background-color: dimgray;
    color: white;
    border: none;
    padding: 15px 30px;
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
<div class="container">
	<div class="row" style="justify-content: center;">
		<div class="recent_trip_area">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div class="section_title text-center mb_70">
							<h3>투어상품</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="single_trip">
							<div class="thumb">
								<img src="/upload/${Cview.photo }" alt="">
							</div>
							<div class="info">
								<div class="date">
									<span>글쓴이: ${Cview.writer }&nbsp&nbsp<i
										class="fa fa-eye" aria-hidden="true"></i>&nbsp
										${Cview.preview}
									</span>
								</div>

							</div>
						</div>
					</div>
					<div class="col-lg-8 col-md-6">
						<div class="single_trip">

							<div class="info">
								<h3>${Cview.title }</h3>

								<hr>

								<h4>${Cview.content }</h4>

								<hr>
								<h5>
									<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp
									일수:${Cview.days }
									</h3>
							</div>
						</div>
						<!-- Trigger/Open The Modal -->
						<button id="myBtn">문의 하기</button>

						<!-- The Modal -->
						<div id="myModal" class="modal">

							<!-- Modal content -->
							<div class="modal-content">
								<span class="close">&times;</span>
								<p>해당 상품은 관리자에게 직접 문의 해주셔야 합니다.</p>
								<p>qqq111@qqq.com으로 문의 주시길 바랍니다.</p>
							</div>

						</div>

						<script>
							// Get the modal
							var modal = document.getElementById("myModal");

							// Get the button that opens the modal
							var btn = document.getElementById("myBtn");

							// Get the <span> element that closes the modal
							var span = document.getElementsByClassName("close")[0];

							// When the user clicks the button, open the modal 
							btn.onclick = function() {
								modal.style.display = "block";
							}

							// When the user clicks on <span> (x), close the modal
							span.onclick = function() {
								modal.style.display = "none";
							}

							// When the user clicks anywhere outside of the modal, close it
							window.onclick = function(event) {
								if (event.target == modal) {
									modal.style.display = "none";
								}
							}
						</script>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" style="justify-content: center;">
	<a href="/course/courseDelete?userid=${userid }&num=${Cview.num}" class="button" style="vertical-align:middle; color: white;"><span>삭제</span></a>
	<a href="/course/courseModify?userid=${userid }&num=${Cview.num}" class="button" style="vertical-align:middle; color: white;"><span>수정</span></a>
	</div>
</div>

<%@include file="../footer.jsp"%>