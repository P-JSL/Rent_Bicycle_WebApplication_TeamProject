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

<!--  header end -->

<style type="text/css">
body {
	background: #fff !important;
}

.ck-editor__editable {
	min-height: 400px;
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

		write.action = "/" //URL
		write.method = "post";
		write.submit();
	}
</script>
<!-- sub page start -->
<div class="notice">
	<div class="sub-notice">
		<h2>
			<span><i class="fas fa-edit"></i> Photo Write</span>
		</h2>
	</div>

	<div class="notice-write">

		<form name="write" style="background-color: #6daeb8"
			action="/review/write" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}"> <input type="hidden" name="writer"
				value="<sec:authentication property="principal.member.userid"/>">
			<input type="hidden" name="nickname"
				value="<sec:authentication property="principal.member.nickname"/>">
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
						<th style="vertical-align: middle;"><label for="t_title">제목</label></th>
						<td><input type="text" name="title" id="title" class="title"
							placeholder="제목을 입력해주세요"></td>
					</tr>

					<tr>
						<th style="vertical-align: middle;"><label for="cont">내용</label></th>
						<td><textarea type="cont" name="content" id="cont"
								class="cont" placeholder="내용을 입력해주세요"></textarea>
					</tr>
					<tr>
						<th style="vertical-align: middle;"><label for="cont">이미지
								파일</label></th>
						<td><input type="file" name="photos"></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="저장" class="btn"
							onclick="noticeSave()"> <input type="button"
							onclick="history.back();" value="목록" class="btn"></td>
					</tr>

				</table>
			</fieldset>
		</form>
	</div>
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
	<%@include file="../footer.jsp"%>