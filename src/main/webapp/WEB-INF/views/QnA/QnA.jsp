<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Bootstrap Core CSS -->
<link href="/resources/admin/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- toast CSS -->
<link
	href="/resources/admin/plugins/bower_components/toast-master/css/jquery.toast.css"
	rel="stylesheet">
<!-- morris CSS -->
<link
	href="/resources/admin/plugins/bower_components/morrisjs/morris.css"
	rel="stylesheet">
<!-- animation CSS -->
<link href="/resources/admin/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/admin/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="/resources/admin/css/colors/blue-dark.css" id="theme"
	rel="stylesheet">
<%@include file="../header.jsp"%>
<link href="/resources/QNA.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/noticenav.css">
</head>


<div class="action" onclick="actionToggle();">
	<span>+</span>
	<ul>
		<li><i class="fa fa-paper-plane-o fa-fw" aria-hidden="true"><a
				href="/board/notice">&nbsp;&nbsp;&nbsp;Notice</a></i></li>
		<li><i class="fa fa-commenting-o fa-fw" aria-hidden="true"><a
				href="/review/photo">&nbsp;&nbsp;&nbsp;PhotoView</a></i></li>
		<li><i class="fa fa-question-circle-o fa-fw" aria-hidden="true"><a
				href="/QnA/QnA">&nbsp;&nbsp;&nbsp;QnA</a></i></li>
	</ul>
</div>
<div class="container">
	<h1 class="heading-primary">FAQ 게시판</h1>
	<div class="accordion">
		<dl>
			<c:forEach items="${list }" var="qa">
				<dt>
					<a href="#accordion${qa.num }" aria-expanded="false"
						aria-controls="accordion${qa.num }"
						class="accordion-title accordionTitle js-accordionTrigger">${qa.title }</a>
				</dt>
				<dd class="accordion-content accordionItem is-collapsed"
					id="accordion${qa.num }" aria-hidden="true">
					<div>${qa.content }</div>
				</dd>

			</c:forEach>
		</dl>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	//uses classList, setAttribute, and querySelectorAll
	//if you want this to work in IE8/9 youll need to polyfill these
	(function() {
		var d = document, accordionToggles = d
				.querySelectorAll('.js-accordionTrigger'), setAria, setAccordionAria, switchAccordion, touchSupported = ('ontouchstart' in window), pointerSupported = ('pointerdown' in window);

		skipClickDelay = function(e) {
			e.preventDefault();
			e.target.click();
		}

		setAriaAttr = function(el, ariaType, newProperty) {
			el.setAttribute(ariaType, newProperty);
		};
		setAccordionAria = function(el1, el2, expanded) {
			switch (expanded) {
			case "true":
				setAriaAttr(el1, 'aria-expanded', 'true');
				setAriaAttr(el2, 'aria-hidden', 'false');
				break;
			case "false":
				setAriaAttr(el1, 'aria-expanded', 'false');
				setAriaAttr(el2, 'aria-hidden', 'true');
				break;
			default:
				break;
			}
		};
		//function
		switchAccordion = function(e) {
			console.log("triggered");
			e.preventDefault();
			var thisAnswer = e.target.parentNode.nextElementSibling;
			var thisQuestion = e.target;
			if (thisAnswer.classList.contains('is-collapsed')) {
				setAccordionAria(thisQuestion, thisAnswer, 'true');
			} else {
				setAccordionAria(thisQuestion, thisAnswer, 'false');
			}
			thisQuestion.classList.toggle('is-collapsed');
			thisQuestion.classList.toggle('is-expanded');
			thisAnswer.classList.toggle('is-collapsed');
			thisAnswer.classList.toggle('is-expanded');

			thisAnswer.classList.toggle('animateIn');
		};
		for (var i = 0, len = accordionToggles.length; i < len; i++) {
			if (touchSupported) {
				accordionToggles[i].addEventListener('touchstart',
						skipClickDelay, false);
			}
			if (pointerSupported) {
				accordionToggles[i].addEventListener('pointerdown',
						skipClickDelay, false);
			}
			accordionToggles[i].addEventListener('click', switchAccordion,
					false);
		}
	})();
</script>
<script type="text/javascript">
	function actionToggle() {
		var action = document.querySelector(".action");
		action.classList.toggle('active');
	}
</script>
<%@include file="../footer.jsp"%>