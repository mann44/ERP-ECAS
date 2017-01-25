package controller.sales;

import iFaces.sales.SalesDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.sales.Customer;

import dao.sales.SalesDaoImp;

/**
 * Servlet implementation class Ajax_Serv
 */
public class Ajax_Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajax_Serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cus_id=request.getParameter("value");
		SalesDao  sales = new SalesDaoImp();
		ArrayList<Customer> cu_list= sales.CustomerInfo(Integer.parseInt(cus_id));
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
			out.println("<table cellpadding='5' cellspacing='5'>");
			out.println("<tr><td>Address</td>");
			out.println("<td><textarea rows='3' cols='20' name='address'>"+cu_list.get(0).getAddress()+"</textarea></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Email</td>");
			out.println("<td><input type='text' name='e_name' value='"+cu_list.get(0).getEmail_id()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Fax</td>");
			out.println("<td><input type='text' name='fax' value='"+cu_list.get(0).getFax()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Phone No</td>");
			out.println("<td><input type='text' name='phn_no' value='"+cu_list.get(0).getPhone_no()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Mobile No(1)</td>");
			out.println("<td><input type='text' name='m_no1' value='"+cu_list.get(0).getMobile_no1()+"'></td><td></td>");
			out.println("</tr>");
			out.println("<tr><td>Mobile No(2)</td>");
			out.println("<td><input type='text' name='m_no2' value='"+cu_list.get(0).getMobile_no2()+"'></td><td></td>");
			out.println("</tr>");
			out.println("</table>");
			
		
	}

}
