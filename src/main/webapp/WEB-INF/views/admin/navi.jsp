<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse slimscrollsidebar">
		<ul class="nav" id="side-menu">
			<li style="padding: 10px 0 0;"><a
				href="/admin/index?userid=${userid }" class="waves-effect"><i
					class="fa fa-clock-o fa-fw" aria-hidden="true"></i><span
					class="hide-menu">Dashboard</span></a></li>
			<li><a href="/admin/notice?userid=${userid }"
				class="waves-effect"><i class="fa fa-leaf fa-fw"
					aria-hidden="true"></i></i><span class="hide-menu">Notice</span></a></li>
			<li><a href="/admin/product_manager?userid=${userid }"
				class="waves-effect"><i class="fa fa-cart-plus fa-fw"
					aria-hidden="true"></i><span class="hide-menu">Product
						Manage</span></a></li>
			<li><a href="/admin/QnA?userid=${userid }"
				class="waves-effect"><i class="fa fa-check fa-fw"
					aria-hidden="true"></i><span class="hide-menu">Q&A *
						Contactus</span></a></li>
			<li><a href="javascript:void(0);" class="waves-effect"
				id="logout"><i class="fa fa-unlock fa-fw" aria-hidden="true"></i><span
					class="hide-menu">Logout</span></a></li>
		</ul>

	</div>
</div>
<form action="/logout" method="post" class="logout">
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token }">
</form>
<script
	src="/resources/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#logout").on("click", function(e) {
			e.preventDefault();
			var logoutForm = $(".logout");
			logoutForm.submit();
		})
	})
	$(function(e) {
		if ($("tbody tr").find('#enabled').attr('id') == 'enabled') {
			$("tbody tr").find('#enabled').css({
				'color' : '#70a1ff',
				'font-weight' : 'bold'
			});
		}
		if ($("tbody tr").find('#disenabled').attr('id') == 'disenabled') {
			$("tbody tr").find('#disenabled').css({
				'color' : '#e74c3c',
				'font-weight' : 'bold'
			});
		}
	})
</script>