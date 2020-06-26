var form = $("#actionForm");
	$(".paginations a").on("click",function(e){
		e.preventDefault();
		var num = $(this).attr("href");
		form.append("<input type='hidden' name='userid' value='"+userid+"'>")
		$("input[name='pageNum']").val(num);
		form.attr("action","/admin/notice")
		form.submit();
	})