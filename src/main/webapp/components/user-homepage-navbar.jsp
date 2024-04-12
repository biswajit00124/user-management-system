
<%@page import="com.org.dto.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">Mangement</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<%
				User user3 = (User) session.getAttribute("userObj");
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="profile.jsp?id=<%= user3.getId() %>">Profile</a></li>
				<li class="nav-item" class="nav-link active"><a
					class="nav-link active" aria-current="page" href="logout">Logout</a>
				</li>
			</ul>
		</div>
	</div>
</nav>