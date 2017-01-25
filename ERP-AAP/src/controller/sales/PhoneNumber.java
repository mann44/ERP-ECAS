package controller.sales;

import iFaces.sales.SalesDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.sales.Customer;
import bean.user_mgmt.UserMaster;
import dao.sales.SalesDaoImp;
import dao.user_mgmt.DaoMethodsImp;

/**
 * Servlet implementation class PhoneNumber
 */
public class PhoneNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhoneNumber() {
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
		HttpSession session=request.getSession();
		int user_id=(Integer) session.getAttribute("user_id");
		String id=request.getParameter("value");
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		SalesDao  sales = new SalesDaoImp();
		ArrayList<Customer> cu_list= sales.CustomerInfo(Integer.parseInt(id));
		out.println("<table style='border-spacing: 100px 100px;' cellpadding='10' cellspacing='10'>");
		out.println("<tr>");
		out.println("<td>Responsible</td>");
		out.println("<td><select name='responsible'><option disabled selected></option>");
		DaoMethodsImp d_obj= new DaoMethodsImp();
		ArrayList<UserMaster> u_list=d_obj.viewAllData(user_id);
		for(int i=0;i<u_list.size();i++){
			out.println("<option value='"+u_list.get(0).getUser_id()+"'>"+u_list.get(0).getFull_name()+"</option>");
		}
		out.println("</select></td>");
		out.println("</tr>");
		out.println("<tr><td>Phone No</td>");
		out.println("<td><input type='text' name='phone' value='"+cu_list.get(0).getPhone_no()+"'></td><td></td>");
		out.println("</tr>");
		out.println("<tr><td>Mobile No(1)</td>");
		out.println("<td><input type='text' name='mobile1' value='"+cu_list.get(0).getMobile_no1()+"'></td><td></td>");
		out.println("</tr>");
		out.println("<tr><td>Mobile No(2)</td>");
		out.println("<td><input type='text' name='mobile2' value='"+cu_list.get(0).getMobile_no2()+"'></td><td></td>");
		out.println("</tr>");
		out.println("</table>");
	}

}
