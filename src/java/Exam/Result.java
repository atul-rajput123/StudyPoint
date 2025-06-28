/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
class campare
{
   
	static int serch(ArrayList<String> list,ArrayList<String> selectedOptions)
	{
		int ResultCount=0;
		int i,j=5;
		for(i=0;i<list.size();i++)
		{
                    
			String s=selectedOptions.get(j);
			if(list.get(i)!=null&&list.get(i).equals(s))
			{
                            
				ResultCount++;
			}
			
			j=j+6;
		}
		
		return ResultCount;	
	}
}
@WebServlet("/Result")
public class Result extends HttpServlet 
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
           
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		 ArrayList<String> selectedOptions = (ArrayList<String>)session.getAttribute("selectedOptions");
		ArrayList<String>list=new ArrayList<String>();
                
		int i=1;
		boolean check=false;
		for(i=1;i<=selectedOptions.size()/6;i++)
		{
                    
		String checkbox=request.getParameter("checkbox_"+i);
		if(checkbox!=null)
		{
                    check=true;
			list.add(checkbox);
		}
		else
		{
			list.add(null);
		}
		}
		int ResultCount=campare.serch(list,selectedOptions);
		if(ResultCount!=0||check)
		{
			 request.setAttribute("ResultCount", ResultCount);
			 RequestDispatcher dispatcher = request.getRequestDispatcher("ResultShow.jsp");
	            dispatcher.forward(request, response);
		}
                else 
		{
			out.println("<html>");
			out.println("<body>");
			out.println("<h1>Not Attempt Exame</h1>"); 
			out.println("</body>");
			out.println("</html>");
		}
		
		
	}

}
