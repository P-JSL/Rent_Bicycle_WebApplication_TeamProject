<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<link href="/resources/write/css/noticewrite.css" rel="stylesheet">
<link href="/resources/write/css/common.css" rel="stylesheet">
<link href="/resources/write/css/login.css" rel="stylesheet">
<link href="/resources/write/css/join.css" rel="stylesheet">
<link href="/resources/write/css/sub-notice.css" rel="stylesheet">
<link href="/resources/write/css/sub-qna.css" rel="stylesheet">
<link href="/resources/write/css/sub-faq.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<script src="/resources/write/js/jquery-3.3.1.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">


<link href="/resources/reply/reply.css" rel="stylesheet">
<!--  header end -->

<style type="text/css">
body {
	background: #fff !important;
}

.ck-editor__editable {
	min-height: 400px;
	max-width: 900px;
}
</style>
<script type="text/javascript">
	function noticeSave() {
		//유효성 검사
		//파일 용량 체크
		var fileName = document.getElementById('fileName_a').value;
		if (fileName != "") {
			var pathFileName = fileName.lastIndexOf(".") + 1; //확장자 제외한 경로+파일명
			var extension = (fileName.substr(pathFileName)).toLowerCase(); //확장자명
			//파일명.확장자
			if (extension == "exe" || extension == "jar" || extension == "zip") {
				alert(extension + " 형식 파일은 업로드 안됩니다.");
				return;
			}
			// 첨부 용량 체크		
			var file = document.getElementById('fileName_a');
			if (file.value != "") {
				// 사이즈체크
				var maxSize = 20 * 1024 * 1024; //20MB
				// 브라우저 확인
				var browser = navigator.appName;
				// 익스플로러일 경우
				if (browser == "Microsoft Internet Explorer") {
					var oas = new ActiveXObject("Scripting.FileSystemObject");
					fileSize = oas.getFile(file.value).size;
				} else {
					// 익스플로러가 아닐경우
					fileSize = file.files[0].size;
				}
				if (fileSize > maxSize) {
					alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.    ");
					return;
				}
			}
		}

	}
</script>
<!-- sub page start -->
<div class="notice" style="max-height: 750px;">
	<div class="sub-notice">
		<h2>
			<span><i class="fas fa-edit"></i> NOTICE-view</span>
		</h2>
	</div>

	<div class="notice-write">

		<form name="write" style="background-color: #6daeb8"
			action="/board/modify" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}"> <input type="hidden" name="sequence"
				value="${vo.sequence }">
			<!-- <input type="hidden" value="save" name="t_gubun"> -->
			<input type="hidden" name="pageNum" value="${ cri.pageNum }">
			<input type="hidden" name="pageNum" value="${ cri.amount }">
			<h2 class="readonly">제목, 첨부파일, 내용을 작성합니다</h2>

			<fieldset>
				<legend>공지사항 글쓰기</legend>

				<table class="table">
					<caption>공지사항 글쓰기</caption>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tr>
						<th style="text-align: center; vertical-align: middle;"><label
							for="t_title">제목</label></th>
						<sec:authorize
							access="isAuthenticated() and hasAnyRole({'ROLE_ADMIN','ROLE_USER'})">
							<sec:authentication property="principal.member.userid" var="id" />
							<c:if test="${id == userid }">
								<td><input type="text" name="title" id="title"
									class="title" value="${vo.title }"></td>
							</c:if>
							<c:if test="${id != userid }">
								<td><input type="text" name="title" id="title"
									class="title" value="${vo.title }" readonly></td>
							</c:if>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<td><input type="text" name="title" id="title" class="title"
								value="${vo.title }" readonly></td>
						</sec:authorize>
						<td><i class="fa fa-thumbs-o-up fa-fw fa-2x"
							aria-hidden="true" id="theup" style="cursor: pointer;"></i><br>
							<mark id="recommend" style="color: green; font-size: 14px">${vo.recommend }</mark>
						</td>
						<td><i class="fa fa-thumbs-o-down fa-fw fa-2x"
							aria-hidden="true" id="down" style="cursor: pointer;"></i><br>
							<mark id="disrecommend" style="color: red; font-size: 14px">${vo.disrecommend }</mark>

						</td>

						<td><i class="fa fa-eye fa-fw fa-2x" aria-hidden="true">
						</i><br> ${vo.viewer }</td>
					</tr>

					<tr>
						<th style="text-align: center; vertical-align: middle;"><label
							for="cont">내용</label></th>
						<td colspan="4"><textarea type="cont" name="content"
								id="cont" class="cont">${vo.content }</textarea></td>
					</tr>


					<tr>
						<td colspan="5"><input type="submit" value="수정" class="btn"
							onclick="noticeSave()"> <input type="button"
							onclick="location.href='/board/notice'" value="목록" class="btn"></td>
					</tr>

				</table>
			</fieldset>
		</form>
	</div>
</div>



<div class="container">
	<div class="row">
		<div class="col-lg-8 offset-lg-2 col-12 comment-main rounded">
			<ul class="p-0" id="commend">
				<c:forEach items="${reply }" var="re">

					<li>
						<div class="row comment-box p-1 pt-3 pr-4">
							<div class="col-lg-2 col-3 user-img text-center"
								style="vertical-align: middle; font-size: 1.3rem;" id="userid">${re.userid }</div>
							<div class="col-lg-10 col-9 user-comment bg-light rounded pb-1">
								<div class="row">
									<div class="col-lg-8 col-8 border-bottom pr-0">
										<p class="w-100 p-2 m-0">${re.comm }</p>
									</div>
									<div class="col-lg-4 col-4 border-bottom">
										<p class="w-100 p-2 m-0">

											<span class="float-right"><i
												class="fa fa-clock-o mr-1" aria-hidden="true"></i> <fmt:formatDate
													value="${re.regdate }" pattern="YY-MM-dd" /></span>
										</p>
									</div>
								</div>
								<div class="user-comment-desc p-1 pl-2">
									<p class="m-0 mr-2">
										<span><i id="likes" class="fa fa-thumbs-up mr-1"
											aria-hidden="true" style="color: blue;"></i></span> <span
											style="color: blue;" id="liking">${re.likes }</span>
									</p>
									<p class="m-0 mr-2">
										<span><i id="hates" class="fa fa-thumbs-down mr-1"
											aria-hidden="true" style="color: red;"></i></span> <span
											style="color: red;" id="hat">${re.hates }</span>
									</p>

									<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal.member.userid"
											var="uid" />
										<sec:authorize access="hasRole('ROLE_USER')">
											<c:if test="${uid == re.userid }">
												<span class="float-right" id="dlt">
													<button class="btn btn-warning" id="delete">삭제</button>
												</span>
											</c:if>
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<span class="float-right" id="dlt">
												<button class="btn btn-warning" id="delete">삭제</button>
											</span>
										</sec:authorize>
									</sec:authorize>
								</div>
								<input type="hidden" name="n_num" value="${re.num }" id="number">
							</div>
						</div>
					</li>
				</c:forEach>
				<sec:authorize access="isAuthenticated()">
					<div class="row">

						<input type="hidden" name="commentid" value="${id }">
						<div class="col-lg-11 col-11">
							<input type="text" class="form-control"
								placeholder="write comments ..." id="comment">
						</div>
						<div class="col-lg-1 col-1 send-icon">
							<a href="javascript:void(0)" onclick="submitcom()"><i
								class="fa fa-paper-plane" aria-hidden="true"></i></a>
						</div>
					</div>
				</sec:authorize>
			</ul>
		</div>
	</div>
</div>
<form action="/board/notice/reply" method="get" id="servform"></form>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member.userid" var="uid" />
	<c:set value="${uid }" var="ud" />
</sec:authorize>
<script
	src="https://cdn.ckeditor.com/ckeditor5/19.0.0/classic/ckeditor.js"></script>
<script type="text/javascript">
	ClassicEditor
    .create( document.querySelector( '#cont' ), {
    	removePlugins: [  'Image', 'List' ],
    } )
    .catch( error => {
        console.log( error );
    } );
	</script>
<script type="text/javascript">
$(function(){
	
var tf = ${userid eq id};
if(tf == false){
	$(".ck.ck-content.ck-editor__editable.ck-rounded-corners.ck-editor__editable_inline.ck-blurred").addClass("ck-read-only");
	$(".ck.ck-content.ck-editor__editable.ck-rounded-corners.ck-editor__editable_inline.ck-blurred").attr("contenteditable","false");
}
})
</script>
<script type="text/javascript">
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
var sequence = <%=request.getParameter("sequence")%>;
$("#commend li #delete").on("click",function(){
	var userid = $(this).parent().parent().parent().parent().parent().find("#userid").text();
	var n_num = $(this).parent().parent().parent().parent().find("#number").val();

	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	alert("삭제");
	$.ajax({
		url : "/reply/delete",
		type : 'POST',
		data : JSON.stringify({
			"userid" : userid,
			"n_num" : n_num
		}),
		contentType : "application/json; charset=UTF-8",
		processData : false,
		success : function(result) {
		if(result){			
			alert("삭제되었습니다.");
			location.href = location.href;
		}
			},
		error : function(req, status, error) {
			console.log(error);
		}
	})
});
$("#theup").on("click",function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	$.ajax({
		url : "/recommend",
		type : 'POST',
		data : JSON.stringify({
			"recommend" : true,
			"userid" : userid,
			"sequence" : sequence
		}),
		contentType : "application/json; charset=UTF-8",
		processData : false,
		success : function(result) {
			document.getElementById("recommend").innerText=result.recommend;
			},
		error : function(req, status, error) {
			console.log(error);
		}
	})
});
$("#down").on("click",function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	$.ajax({
		url : "/disrecommend",
		type : 'POST',
		data : JSON.stringify({
			"disrecommend" : true,
			"userid" : userid,
			"sequence" : sequence	}),
		contentType : "application/json; charset=UTF-8",
		processData : false,
		success : function(result) {
			document.getElementById("disrecommend").innerText=result.disrecommend;
		},
		error : function(req, status, error) {
			console.log(error);
		}
	})
});
$("#commend #likes").on("click",function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	var userid = $(this).parent().parent().parent().parent().parent().find("#userid").text();
	var n_num = $(this).parent().parent().parent().parent().find("#number").val();
	console.log(userid);
	console.log(n_num);
	var lik = $(this).parent().parent().find("#liking");
	console.log(lik[0].innerText);
	$.ajax({
		url : "/likes",
		type : 'POST',
		data : JSON.stringify({
			"userid" : userid,
			"num" : n_num,
			"n_num" : sequence
		}),
		contentType : "application/json; charset=UTF-8",
		processData : false,
		success : function(result) {
			console.log(result);
			lik[0].innerText=result.likes;
		},
		error : function(req, status, error) {
			console.log(error);
		}
	})
});
$("#commend li #hates").on("click",function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	var userid = $(this).parent().parent().parent().parent().parent().find("#userid").text();
	var n_num = $(this).parent().parent().parent().parent().find("#number").val();
	var lik = $(this).parent().parent().find("#hat");
	console.log(lik[0].innerText);
	$.ajax({
		url : "/hates",
		type : 'POST',
		data : JSON.stringify({
			"userid" : userid,
			"num" : n_num,
			"n_num" : sequence
	}),
		contentType : "application/json; charset=UTF-8",
		processData : false,
		success : function(result) {
			lik[0].innerText=result.hates;
		},
		error : function(req, status, error) {
			console.log(error);
		}
	})
});
</script>
<script type="text/javascript">

	var seq =<%=request.getParameter("sequence")%>;
	function submitcom(){
		var userid = $("input[name='commentid']").val();
		var comment = $("#comment").val();
		var form = $("#servform");
		form.append("<input type='hidden' name='userid' value='"+userid+"'>");
		form.append("<input type='hidden' name='comm' value='"+comment+"'>");
		form.append("<input type='hidden' name='n_num' value='"+seq+"'>");
		form.submit();
}

		
</script>
<%@include file="../footer.jsp"%>