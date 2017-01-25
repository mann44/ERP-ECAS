package controller.user_mgmt;

import iFaces.user_mgmt.DaoMethods;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.user_mgmt.DaoMethodsImp;

import bean.user_mgmt.UserMaster;

/**
 * Servlet implementation class Login
 */
public class Login_Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Login_Serv() {
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
		HttpSession ses=request.getSession();
		String l_role=request.getParameter("role");
		String l_email=request.getParameter("email");
		String l_pass=request.getParameter("password");
		UserMaster us=new UserMaster();
		us.setRole_type(Integer.parseInt(l_role));
		us.setLogin_id(l_email);
		us.setPassword(l_pass);
		DaoMethods d_obj=new DaoMethodsImp();
		ArrayList<UserMaster> lst=d_obj.LoginDetail(us);
		if(lst.isEmpty()){
			response.sendRedirect("login.jsp");
		}
		else{
			int d_rid=lst.get(0).getRole_type();
			String sd_rid=Integer.toString(d_rid);
			String d_name=lst.get(0).getLogin_id();
			String e_name=lst.get(0).getEmail();
			String d_pass=lst.get(0).getPassword();
			String d_acc=lst.get(0).getAcc_lock();
			String ac_flag=lst.get(0).getActive_flag();
			String user_name=lst.get(0).getFull_name();
			int user_id=lst.get(0).getUser_id();
			if(sd_rid.equals(l_role) && d_name.equals(l_email) || e_name.equals(l_email) && d_pass.equals(l_pass) && d_acc.equals("0") && ac_flag.equals("1")){
				ses.setAttribute("user_name",user_name);
				ses.setAttribute("user_id", user_id);
				response.sendRedirect("home.jsp");
			}
			else{
				response.sendRedirect("login.jsp");
			}
		}
		
		
		
	}

}
