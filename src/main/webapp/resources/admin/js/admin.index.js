$(document).ready(function() {
	$.toast({
		heading : 'Welcome to admin Page',
		text : 'You are Management All of User in Admin Page.',
		position : 'top-right',
		loaderBg : '#ff6849',
		icon : 'info',
		hideAfter : 3500,
		stack : 6
	})
});
$(".flex ul li").on("mouseover", function(e) {
	$(this).addClass("active");
})
$(".flex ul li").on("mouseout", function(e) {
	$(this).removeClass("active");
})
var actionForm = $("#actionForm");
$(".paging li a").on("click", function(e) {
	e.preventDefault();
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
})

$(function() {
	var b = document.querySelectorAll("#Block");
	$(b).css({
		"color" : "rgba(181, 52, 113,1.0)"
	}, {
		"font-size" : "1rem"
	});
	var nb = document.querySelectorAll("#NonBlock");
	$(nb).css({
		"color" : "rgba(95, 39, 205,1.0)",
		"font-size" : "1rem"
	});
})
