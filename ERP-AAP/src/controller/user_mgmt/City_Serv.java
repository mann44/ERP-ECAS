package controller.user_mgmt;

import iFaces.user_mgmt.DaoMethods;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.user_mgmt.City;
import dao.user_mgmt.DaoMethodsImp;

/**
 * Servlet implementation class City_Serv
 */
public class City_Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public City_Serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int s_id=Integer.parseInt(request.getParameter("count"));
		PrintWriter out=response.getWriter();
		out.println("<div><select name='city' id='icity'><option disabled selected>---Select City---</option>");
		DaoMethods d_obj=new DaoMethodsImp();
		ArrayList<City> lst=d_obj.fetchCity(s_id);
		for(int i=0;i<lst.size();i++)
		{
		out.println("<option value="+lst.get(i).getCity_id()+">"+lst.get(i).getCity_name()+"</option>");
		}
		out.println("</select></div>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
