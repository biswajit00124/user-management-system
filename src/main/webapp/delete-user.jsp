<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGOUT</title>
<%@ include file= "components/allcss.jsp" %>

</head>
<body>
<%@ include file="components/user-homepage-navbar.jsp" %>

	 <%
        UserDao dao = new UserDao();
        int id = Integer.parseInt(request.getParameter("id"));
        User u = new User();
    
        dao.deleteUserById(id);
        response.sendRedirect("home.jsp");
    %>
	
</body>
</html>