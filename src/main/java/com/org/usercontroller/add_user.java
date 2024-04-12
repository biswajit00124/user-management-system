package com.org.usercontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/add_user")
public class add_user extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String mobile = req.getParameter("mobile");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		User user = new User();
		user.setName(name);
		user.setAge(Integer.parseInt(age));
		user.setMobile(Long.parseLong(mobile));
		user.setEmail(email);
		user.setPassword(password);
		UserDao dao = new UserDao();
		dao.saveUser(user);
		try {
			Thread.sleep(9000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("home.jsp");
		
	}
}
