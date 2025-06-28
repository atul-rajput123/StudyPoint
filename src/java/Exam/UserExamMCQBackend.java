/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exam;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UserExamMCQBackend", urlPatterns = {"/UserExamMCQBackend"})
public class UserExamMCQBackend extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<String> list=new ArrayList<String>();
		PrintWriter out=response.getWriter();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/StudyPoint?useSSL=false","root","root");
			PreparedStatement prepare=connection.prepareStatement("select * from javamcq");
			ResultSet rs = prepare.executeQuery();
			while(rs.next())
			{
			 list.add(rs.getString(1));	
			 list.add(rs.getString(2));
			 list.add(rs.getString(3));
			 list.add(rs.getString(4));
			 list.add(rs.getString(5));
			 list.add(rs.getString(6));
			}
			/*out.println(list);
			request.setAttribute("ram",list);
			RequestDispatcher dispatcher=request.getRequestDispatcher("UserExamMCQ.jsp");
			dispatcher.forward(request,response);*/
			}
		catch (Exception e)
		{
			out.println(e);
			// TODO: handle exception
		}


	}
        
}