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
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="/resources/replly.css" rel="stylesheet">
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
<div class="notice" style="max-height: 790px; margin-bottom: 40px;">
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
						<sec:authorize access="isAuthenticated() and hasAnyRole({'ROLE_ADMIN','ROLE_USER'})">
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
	<div class="row bootstrap snippets" style="justify-content: center;">
		<div class="col-md-12 col-lg-12 col-sm-12"
			style="justify-content: center;">
			<div class="comment-wrapper" style="width: 100%;">
				<div class="panel panel-info">
					<div class="panel-heading">Comment panel</div>
					<div class="panel-body" id="panel">
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.member.nickname"
								var="nicknames" />
							<input type="hidden" name="nickname" value="${nicknames }">
							<input type="hidden" name="commentid" value="${id }">
							<textarea class="form-control" placeholder="write a comment..."
								rows="4" id="comm" style="resize: none;"></textarea>
							<br>
							<button type="button" class="btn btn-info pull-right" data-nickname='${nicknames }' data-id='${id }'
								 id="post" onclick="submitcom(this)">작성</button>
						</sec:authorize>
						<div class="clearfix"></div>
						<hr>
						<ul class="media-list">
					<c:forEach items="${reply }" var="re">
					<li class="media"><a href="javascript:void(0)"
									class="pull-left"> <img
										src="https://bootdey.com/img/Content/user_1.jpg" alt=""
										class="img-circle">
								</a>
									<div class="media-body" style="margin-bottom: 10px;">
										<span class="text-muted pull-right"
											style="text-align: center; display: inline-grid;"> <small
											class="text-muted" style="display: block;"><fmt:formatDate
													value="${re.regdate }" pattern="YYYY-MM-dd" /></small>
											<p class="m-0 mr-2" style="display: inline-block;">
												<span><i id="likes" class="fa fa-thumbs-up mr-1"
													aria-hidden="true" style="color: blue;"></i></span> <span
													style="color: blue;" id="liking">${re.likes }</span>
											</p>
											<p class="m-0 mr-2" style="display: inline-block;">
												<span><i id="hates" class="fa fa-thumbs-down mr-1"
													aria-hidden="true" style="color: red;"></i></span> <span
													style="color: red;" id="hat">${re.hates }</span>

											</p> <sec:authorize access="isAuthenticated()">
												<sec:authentication property="principal.member.userid"
													var="uid" />
												<sec:authorize access="hasRole('ROLE_USER')">

													<c:if test="${uid == re.userid}">
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
										</span> <input type="hidden" name="userid" value="${re.userid  }"
											id="userid">
										<div class="col-md-11">
											<strong class="text-success">${re.nickname == null ? re.userid : re.nickname }</strong>
											<p>${re.comm }</p>
										</div>
										<input type="hidden" name="num" value="${re.num }"
											id="number">
									</div></li>
					</c:forEach>
						</ul>
					</div>
				</div>
			</div>

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

</script>
<script src="/resources/noticejs.js" type="text/javascript">
</script>
<script type="text/javascript">
	var seq =<%=request.getParameter("sequence")%>;
	function submitcom(res){
		var userid = $(res).attr("data-id");
		var nickname = $(res).attr("data-nickname");
		var comment = $("#comm").val();
		$.ajax({
			url : "/notice/reply/insert",
			type : 'POST',
			timeout:2000,
			data : JSON.stringify({
				"userid" : userid,
				"nickname" : nickname,
				"n_num" : sequence,
				"comm" : comment
		}),
			contentType : "application/json; charset=UTF-8",
			processData : false,
			success : function(res) {
			$(".media-list").prepend(replys(res));
			$.getScript("/resources/noticejs.js");
			location.reload();
				function replys(ress){					
				var HTML = ""; 
				HTML += "<li class='media'><a href='javascript:void(0)' class='pull-left'>";
				HTML +="<img src='https://bootdey.com/img/Content/user_1.jpg' class='img-circle'>";
				HTML +="</a><div class='media-body' style='margin-bottom: 10px;'>";
				HTML +="<span class='text-muted pull-right' style='text-align: center; display: inline-grid;'>"; 
				HTML +="<small class='text-muted' style='display: block;'>";
				HTML +=ress.date+"</small>";
				HTML +="<p class='m-0 mr-2' style='display: inline-block;'>";
				HTML +="<span><i id='likes' class='fa fa-thumbs-up mr-1' aria-hidden='true' style='color: blue;'></i></span> <span style='color: blue;' id='liking'>"+ress.like+"</span>"
				HTML +="</p><p class='m-0 mr-2' style='display: inline-block;'>";
				HTML +="<span><i id='hates' class='fa fa-thumbs-down mr-1' aria-hidden='true' style='color: red;''></i></span> <span style='color: red;' id='hat'>"+ress.hate+"</span>";
				HTML +="</p>"; 
				HTML +="<c:if test='${uid == re.userid}'> <span class='float-right' id='dlt'>";
				HTML +="<button class='btn btn-warning' id='delete'>삭제</button></span></c:if>";

				HTML +="<span class='float-right' id='dlt'><button class='btn btn-warning' id='delete'>삭제</button></span>";
				HTML +="</span> <input type='hidden' name='userid' value='"+ress.id+"' id='userid'>"
				HTML +="<div class='col-md-11'><strong class='text-success'>"+ress.nickname+"</strong>";
				HTML +="<p>"+ress.comm+"</p></div><input type='hidden' name='num' value='"+res.num+"' id='number'></div></li>";
				return HTML;
				}
			},
			error : function(req, status, error) {
				console.log(error);
			}
		})
}

	</script> 

<script type="text/javascript">
$(function(){	
			var form =$("#servform");
			$(".pagination li a").on("click",function(e){
				e.preventDefault();
				var pageNum = $(this).attr("href");
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