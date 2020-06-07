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
</head>
<style>
.container {
	padding: 10px 0px 20px 0px;
	border-radius: 4px;
}

.link {
	font-size: 16px;
	font-weight: 300;
	text-align: center;
	position: relative;
	height: 40px;
	line-height: 40px;
	margin-top: 10px;
	overflow: hidden;
	width: 90%;
	margin-left: 5%;
	cursor: pointer;
}

.link:after {
	content: '';
	position: absolute;
	width: 80%;
	border-bottom: 1px solid rgba(255, 255, 255, 0.5);
	bottom: 50%;
	left: -100%;
	transition-delay: all 0.5s;
	transition: all 0.5s;
}

.link:hover:after, .link.hover:after {
	left: 100%;
}

.link .text {
	text-shadow: 0px -40px 0px rgba(255, 255, 255, 1);
	transition: all 0.75s;
	transform: translateY(100%) translateZ(0);
	transition-delay: all 0.25s;
}

.link:hover .text, .link.hover .text {
	text-shadow: 0px -40px 0px rgba(255, 255, 255, 0);
	transform: translateY(0%) translateZ(0) scale(1.1);
	font-weight: 600;
}

@media ( max-width : 1500px) {
	.navigator {
		max-width: 175px !important;
	}
}

@media ( max-width : 1350px) {
	.navigator {
		max-width: 150px !important;
	}
}

@media ( max-width : 1024px) {
	.navigator {
		max-width: 100px !important;
	}
}

@media ( max-width : 768px) {
	.navigator {
		max-width: 75px !important;
	}
}
</style>

<div class="container navigator"
	style="top: 25px; z-index: 111; position: absolute; left: 10; max-width: 200px; box-shadow: 0px 4px 5px rgba(0, 0, 0, 0.75); background: rgba(0, 0, 0, 0.75); margin: 0 !important;">
	<div class="link">
		<div class="text">
			<a href="/board/notice">Notice</a>
		</div>
	</div>
	<div class="link">
		<div class="text">
			<a href="/review/photo">PhotoView</a>
		</div>
	</div>
	<div class="link">
		<div class="text">
			<a href="/QnA/QnA">QnA</a>
		</div>
	</div>
</div>
<div class="container">
	<h1 class="heading-primary">Q & A 게시판</h1>
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
<%@include file="../footer.jsp"%>