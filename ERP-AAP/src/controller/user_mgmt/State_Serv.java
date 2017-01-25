package controller.user_mgmt;

import iFaces.user_mgmt.DaoMethods;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.user_mgmt.State;

import dao.user_mgmt.DaoMethodsImp;

/**
 * Servlet implementation class State_Serv
 */
public class State_Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public State_Serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String c_id=request.getParameter("count");
		int country_id=Integer.parseInt(c_id);
		PrintWriter out=response.getWriter();
		out.println("<div><select name='state' onchange='showCity(this.value)' id='istate'><option disabled selected>---Select State---</option>");
		DaoMethods d_obj=new DaoMethodsImp();
		ArrayList<State> lst=d_obj.fetchState(country_id);
		for(int i=0;i<lst.size();i++)
		{
		out.println("<option value="+lst.get(i).getState_id()+">"+lst.get(i).getState_name()+"</option>");
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
