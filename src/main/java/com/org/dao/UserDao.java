package com.org.dao;

import java.io.IOException;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.dto.User;
import com.org.utilities.HelperClass;

public class UserDao extends HttpServlet 
{
	public void saveUser(User user)
	{
		Connection con = HelperClass.getDBConnection();
		
		try {
			PreparedStatement pst = con.prepareStatement("insert into user(name,age,mobile,email,password) values(?,?,?,?,?)");
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setLong(3, user.getMobile());
			pst.setString(4, user.getEmail());
			pst.setString(5, user.getPassword());
			
			pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public List<User> fetchAllUsers()
	{
		Connection con = HelperClass.getDBConnection();
		User user = null;
		List<User> list = new ArrayList<User>();
		try 
		{
			PreparedStatement pst = con.prepareStatement("select * from user");
			ResultSet rst = pst.executeQuery();
			while(rst.next())
			{	
				String name = rst.getString("name");
				int age = rst.getInt("age");
				long mobile = Long.parseLong(rst.getString("mobile"));
				String email1 = rst.getString("email");
				String password2 = rst.getString("password");
				
				user  = new User();
				user.setName(name);
				user.setAge(age);
				user.setMobile(mobile);
				user.setEmail(email1);
				user.setPassword(password2);
				user.setId(rst.getInt("id"));
				list.add(user);
				
			}
		}	 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public User fetchUserById(int id) {		//done
		
		
		Connection con = HelperClass.getDBConnection();

			
			try {
				PreparedStatement pst = con.prepareStatement("SELECT * from user where id=?");
				
				pst.setInt(1, id);
				
				ResultSet rst = pst.executeQuery();
				
				User user = null;
				
				if(rst.next()) {
						String name = rst.getString("name");
						int age = rst.getInt("age");
						long mobile = rst.getLong("mobile");
						String email1= rst.getString("email");
						String password2 = rst.getString("password");
						
						user = new User();
						
						user.setId(rst.getInt("id"));
						user.setName(name);
						user.setAge(age);
						user.setMobile(mobile);
						user.setEmail(email1);
						user.setPassword(password2);
				}
				
				return user;		
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return null;
		}
		
		
		
	public User updateUserById(User user)
	{
		Connection con = HelperClass.getDBConnection();
		try {
			PreparedStatement pst = con.prepareStatement("update user set name=?,age=?,mobile=?,email=? where id=?");
			pst.setString(1, user.getName());
			pst.setInt(2, user.getAge());
			pst.setLong(3, user.getMobile());
			pst.setString(4, user.getEmail());
			pst.setInt(5, user.getId());
			
			pst.executeUpdate();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public void deleteUserById(int id)
	{
//		boolean rowDeleted = false;
		Connection con = HelperClass.getDBConnection();
		try {
			PreparedStatement pst = con.prepareStatement("delete from user WHERE id=?");
			pst.setInt(1, id);
			//rowDeleted = 
			pst.executeUpdate();	
		
			
		} catch (SQLException e) {	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public User fetchUserByEmailAndPassword(String email,String password)
	{
		Connection con = HelperClass.getDBConnection();
		try {
			PreparedStatement pst = con.prepareStatement("select * from user where email= ? and password= ?");
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rst = pst.executeQuery();
			
			User user = null;
			if(rst.next())
			{	
				String name = rst.getString("name");
				int age = rst.getInt("age");
				long mobile = Long.parseLong(rst.getString("mobile"));
				String email1 = rst.getString("email");
				String password1 = rst.getString("password");
				
				user  = new User();
				user.setName(name);
				user.setAge(age);
				user.setMobile(mobile);
				user.setEmail(email1);
				user.setPassword(password1);
			}
			return user;
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return null; 
	}	
}
