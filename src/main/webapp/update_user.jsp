<%@page import="com.org.dao.UserDao"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/allcss.jsp"%>
<title>Update User</title>
<%@include file="components/user-homepage-navbar.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 35px 0 rgba(0, 0, 0, 2.5);
}
</style>
</head>
<body>

	<%
	UserDao dao = new UserDao();
	int id = Integer.parseInt(request.getParameter("id"));
	User u = dao.fetchUserById(id);
	%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="car paint-card">
					<div class="card-body">
						<p class="fs-4 text-center"
							style="background-color: aqua; border-radius: 5px">
							Update <span
								style="color: aqua; font-size: 2rem; background-color: black; padding: 3px; border-radius: 8px"><%=u.getName().toUpperCase()%></span>
							's Profile
						</p>
						<form action="update_user" method="post">
							<div class="mb-3">
								<label class="form-label">Name</label> <input name="name"
									type="text" class="form-control" value="<%=u.getName()%>"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Age</label> <input name="age"
									type="text" class="form-control" value="<%=u.getAge()%>"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile</label> <input name="mobile"
									type="text" class="form-control" value="<%=u.getMobile()%>"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input name="email"
									type="email" class="form-control" value="<%=u.getEmail()%>"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control"
									value="<%=u.getPassword()%>" required>
							</div>
							<div class="mb-3">
								<label class="form-label"></label> <input name="id"
									type="hidden" class="form-control" value="<%=u.getId()%>"
									required>
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>