$(".media #delete").on("click",function(){
	var confirms = confirm("コメントを削除しますか？"); 
	var userid= $(this).parent().parent().parent().parent().find("input[name='userid']").val();
	var n_num = $(this).parent().parent().parent().find("#number").val();
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	var $this = $(this);
	if(confirms == true){		
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
			$($this).parent().parent().parent().parent().remove();
		}
			},
		error : function(req, status, error) {
			console.log(error);
		}
	})
	}
});
$("#theup").on("click",function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	var sequence = $("input[name='sequence']").val();
	
	$.ajax({
		url : "/recommend",
		type : 'POST',
		data : JSON.stringify({
			"recommend" : true,
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
$("ul.media-list .media  #likes").on("click",function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	var userid= $(this).parent().parent().parent().parent().find("input[name='userid']").val();
	var n_num = $(this).parent().parent().parent().parent().find("#number").val();
	var lik = $(this).parent().parent().find("#liking");
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
$("ul .media #hates").on("click",function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	})
	var userid= $(this).parent().parent().parent().parent().find("input[name='userid']").val();
	var n_num = $(this).parent().parent().parent().parent().find("#number").val();
	var lik = $(this).parent().parent().find("#hat");
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