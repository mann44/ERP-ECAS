package controller.user_mgmt;

import iFaces.user_mgmt.DaoMethods;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.user_mgmt.Role;
import bean.user_mgmt.UserMaster;

import dao.user_mgmt.DaoMethodsImp;

/**
 * Servlet implementation class UserDetail
 */
public class UserDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetail() {
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
		String r_id=request.getParameter("count");
		int role_id=Integer.parseInt(r_id);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.println("<tr><td>Select User</td><td><select  name='user_id'>");
		out.println("<option disabled selected>---Select User---</option>");
		UserMaster mst=new UserMaster();
		mst.setRole_type(role_id);
		mst.setCreated_by(user_id);
		DaoMethods d_obj= new DaoMethodsImp();
		ArrayList<UserMaster> lst=d_obj.fetchUser(mst);
		for(int i=0;i<lst.size();i++)
		{
		out.println("<option value="+lst.get(i).getUser_id()+">"+lst.get(i).getFull_name()+"</option>");
		}
		out.println("</select></td></tr>");
		
	}

}
