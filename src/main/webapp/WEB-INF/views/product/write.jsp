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
			<span><i class="fas fa-edit"></i> PRODUCT UPLOAD</span>
		</h2>
	</div>

	<div class="notice-write">

		<form name="write" style="background-color: #6daeb8"
			onsubmit="return confirm();" action="/product/write" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}"> <input type="hidden"
				value="${user.nickname }" name="nickname"> <input
				type="hidden" value="<%=request.getParameter("userid")%>"
				name="userid">
			<!-- <input type="hidden" value="save" name="t_gubun"> -->
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
						<th style="vertical-align: middle;"><label for="t_title">タイトル</label></th>
						<td><input type="text" name="title" id="title" class="title"
							placeholder="제목을 입력해주세요"></td>
						<th style="vertical-align: middle;"><label for="t_title">添付イメージ</label></th>
						<td colspan="2"><input type="file" name="goodsfile"
							id="title" class="title"></td>

					</tr>
					<tr>
						<th style="vertical-align: middle;"><label for="t_title">価格</label></th>
						<td><input type="text" name="price" id="title" class="title"></td>
						<th style="vertical-align: middle; text-align: center;"><label
							for="t_title">レンタル可能期間</label></th>
						<td><input type="text" name="startdate" id="title"
							class="title"></td>
						<td><input type="text" name="lastdate" id="to" class="title"></td>


					</tr>
					<tr>
						<th style="vertical-align: middle;"><label for="t_title">品の種類</label></th>
						<td colspan="1"><input type="text" name="goods" id="title"
							class="title"></td>
						<th style="vertical-align: middle;"><label for="t_title">カテゴリー</label></th>
						<td><input type="text" name="category" id="title"
							class="title"></td>

					</tr>
					<tr>
						<th style="vertical-align: middle;"><label for="cont">コンテンツ</label></th>
						<td colspan="4"><textarea type="cont" name="content"
								id="cont" class="cont" placeholder="内容入力"></textarea>
					</tr>


					<tr>
						<td colspan="6"><input type="submit" value="書く" class="btn"
							onclick="noticeSave()"> <input type="button"
							onclick="history.back();" value="戻る" class="btn"></td>
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
	<script type="text/javascript">
	$(function(){		
	var today = new Date();
	var Year = today.getFullYear();
	var Month = today.getMonth() + 1;
	var Day = today.getDate();
	$("input[name='startdate']").val(Year + "/" + Month + "/" + Day);
	$("input[name='lastdate']").flatpickr({
		  enableTime: false,
		  dateFormat: "Y/m/d",
		  minDate:today
		});
	})
	</script>
	<script type="text/javascript">
	function confirm(){		
		if(!$("input[name='title']").val()){
		alert("タイトルをお書きください。");
		return false;
		}
	if(!$("input[name='lastdate']").val()){
		alert("レンタル終了日を指定してください。");
		return false;
	}
	if(!$("input[name='price']").val()){
		alert("価格をお書きください。");
		return false;
	}
	if(!$("input[name='category']").val()){
		alert("カテゴリーをお書きください。");
		return false;
	}
	if(!$("input[name='goods']").val()){
		alert("品の種類をお書きください。");
		return false;
	}
	}
	</script>
	<%@include file="../footer.jsp"%>