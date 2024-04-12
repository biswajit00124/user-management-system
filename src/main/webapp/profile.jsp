<%@page import="com.org.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="components/allcss.jsp"%>
</head>
<body>
	<%@ include file="components/user-homepage-navbar.jsp"%>
	<h1 style="text-align: center; color: gray;">Profile</h1>
	<a class="btn btn-primary" href="add_user.jsp" style="text-align: center;">Add user</a>

	<br>
	<br>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">User Details</p>
						<table class="table">
							<thead>
								<tr>
									
									<th>Name</th>
									<th>Age</th>
									<th>Mobile</th>
									<th>Email</th>

								</tr>
							</thead>
							<tbody>
								<%
								UserDao dao = new UserDao();
								List<User> users = dao.fetchAllUsers();
								User user = (User) session.getAttribute("userObj");

								/*  for (User users_list : users) {
									if (user4.getId() != users_list.getId())
										continue; */
										if(user!=null){%>
											
							
									
									<td><%=user.getName()%></td>
									<td><%=user.getAge()%></td>
									<td><%=user.getEmail()%></td>
									<td><%=user.getMobile()%></td>
									<%-- <td><a class="btn btn-primary"
										href="update_user.jsp?id=<%=users_list.getId()%>">Update</a> <a
										class="btn btn-danger" href="delete-user.jsp?id=<%=users_list.getId()%>">Delete</a></td> --%>

								</tr>
										
								<%
								}
								%> 
								
								
							</tbody>
						</table>

					</div>
				</div>


			</div>

		</div>


	</div>

</body>
</html>