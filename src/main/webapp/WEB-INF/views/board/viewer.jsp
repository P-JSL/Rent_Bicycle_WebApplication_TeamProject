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
<script src="/resources/notice_view.js"></script>
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
			<input type="hidden" name="amount" value="${ cri.amount }">
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
						<td colspan="5"><sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.member.userid" var="is" />
								<c:if test="${is == userid }">
									<input type="submit" value="수정" class="btn"
										onclick="noticeSave()">
								</c:if>
							</sec:authorize> <input type="button"
							onclick="location.href='/board/notice?pageNum=<%=request.getParameter("pageNum")%>'"
							value="목록" class="btn"></td>
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
								style="vertical-align: middle; font-size: 1.3rem;" id="userid" hidden="hidden">${re.userid  }</div>
								<div class="col-lg-2 col-3 user-img text-center"
								style="vertical-align: middle; font-size: 1.3rem;" id="userid">${re.nickname == null ? re.userid : re.nickname }</div>
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
											<c:if test="${uid == re.userid}">
												<span class="float-right" id="dlt">
													<button class="btn btn-warning" id="delete">삭제</button>
												</span>
											</c:if>
											<c:if test="${(nicknames == re.nickname) && re.nickname ne null}">
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

				<div class="col-md-12 col-sx-12 col-sm-12 col-lg-12"
					style="text-align: center; justify-content: center; max-height: 45px; position: relative;">
					<ul class="pagination"
						style="justify-content: center; position: relative; top: -10px;">
						<c:if test="${pageMaker.prev }">
							<li><a href="${pageMaker.startPage - 1 }"><i
									class="fa  fa-arrow-left"></i></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li><a href="${num }"
								class="${pageMaker.cri_c.pageNum_c == num ? 'active':''  }">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li><a href="${pageMaker.endPage+1}"><i
									class="fa  fa-arrow-right"></i></a></li>
						</c:if>
					</ul>
				</div>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member.nickname"
						var="nicknames" />
					<div class="row" style="position: relative;">
						<input type="hidden" name="nickname" value="${nicknames }">
						<input type="hidden" name="commentid" value="${id }">
						<div class="col-lg-11 col-11" style="margin-top: 15px;">
							<textarea class="form-control" id="comment"> </textarea>
						</div>

						<div class="col-lg-1 col-1 send-icon"
							style="margin-top: 30px; margin-right: 0; padding: 0; right: -5px;">
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
   	 toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote','undo', 'redo', 'indent', 'outdent']
    } )
    .catch( error => {
        console.log( error );
    } );
	</script>

<script type="text/javascript">
	ClassicEditor
    .create( document.querySelector( '#comment' ), {
    	 toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote','undo', 'redo','indent', 'outdent'
 ]


    } )
    .catch( error => {
        console.log( error );
    } );
	</script>
<script type="text/javascript">
$(function(){
	
var t1 = '<%=request.getParameter("userid")%>';
var t2 = '${ud}';
if((t1 == t2) == false){
	$("#cont").parent().find(".ck.ck-content.ck-editor__editable.ck-rounded-corners.ck-editor__editable_inline.ck-blurred").addClass("ck-read-only");
	$("#cont").parent().find(".ck.ck-content.ck-editor__editable.ck-rounded-corners.ck-editor__editable_inline.ck-blurred").attr("contenteditable","false");
}

var e2 = $("#comment").parent().find(".ck.ck-editor__main");
$(e2).css({"height":"50px","overflow-y":"hidden"});
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
		var pageNum = <%=request.getParameter("pageNum")%>;
		var userid = $("input[name='commentid']").val();
		var nickname = $("input[name='nickname']").val();
		var comment = $("#comment").next().find(".ck.ck-editor__main").children().html();
		var form = $("#servform");
		form.append("<input type='hidden' name='userid' value='"+userid+"'>");
		form.append("<input type='hidden' name='nickname' value='"+nickname+"'>");
		form.append("<input type='hidden' name='comm' value='"+comment+"'>");
		form.append("<input type='hidden' name='n_num' value='"+seq+"'>");
		form.append("<input type='hidden' name='pageNum' value='"+pageNum+"'>");
		form.submit();
}

	</script>

<script type="text/javascript">
$(function(){	
			var form =$("#servform");
			$(".pagination li a").on("click",function(e){
				e.preventDefault();
				var pageNum = $(this).attr("href");
				console.log(pageNum);
				var seq = <%=request.getParameter("sequence")%>;
				var userid = '<%=request.getParameter("userid")%>';
				var pn = <%=request.getParameter("pageNum")%>;
				$(form).attr("action","/board/view");
				$(form).attr("method","get");
				form.append("<input type='hidden' name='pageNum_c' value='"+pageNum+"'>");
				form.append("<input type='hidden' name='amount_c' value='${pageMaker.cri_c.amount_c}'>");
				form.append("<input type='hidden' name='pageNum' value='"+pn+"'>");
				form.append("<input type='hidden' name='sequence' value='"+seq+"'>");
				form.append("<input type='hidden' name='userid' value='"+userid+"'>");
				form.submit();
			})
})
</script>


<%@include file="../footer.jsp"%>