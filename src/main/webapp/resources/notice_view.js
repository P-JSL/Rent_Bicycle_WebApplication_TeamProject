function noticeSave() {
	// 유효성 검사
	// 파일 용량 체크
	var fileName = document.getElementById('fileName_a').value;
	if (fileName != "") {
		var pathFileName = fileName.lastIndexOf(".") + 1; // 확장자 제외한 경로+파일명
		var extension = (fileName.substr(pathFileName)).toLowerCase(); // 확장자명
		// 파일명.확장자
		if (extension == "exe" || extension == "jar" || extension == "zip") {
			alert(extension + " 형식 파일은 업로드 안됩니다.");
			return;
		}
		// 첨부 용량 체크
		var file = document.getElementById('fileName_a');
		if (file.value != "") {
			// 사이즈체크
			var maxSize = 20 * 1024 * 1024; // 20MB
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