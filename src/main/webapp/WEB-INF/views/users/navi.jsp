<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse slimscrollsidebar">
		<ul class="nav" id="side-menu">
			<li><a href="/" class="waves-effect"><i
					class="fa fa-home fa-fw" aria-hidden="true"></i><span
					class="hide-menu">HOME</span></a></li>
			<li><a href="/users/index?userid=${userid }" class="waves-effect"><i
					class="fa fa-user fa-fw" aria-hidden="true"></i><span
					class="hide-menu">DashBoard</span></a></li>
			<li><a href="/users/profile?userid=${userid }"
				class="waves-effect"><i class="fa fa-user fa-fw"
					aria-hidden="true"></i><span class="hide-menu">Profile</span></a></li>
			<li><a href="/users/Reservation?userid=${userid }"
				class="waves-effect"><i class="fa fa-table fa-fw"
					aria-hidden="true"></i><span class="hide-menu">Reservation</span></a></li>
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
</script>