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

import dao.user_mgmt.DaoMethodsImp;

import bean.user_mgmt.UserMaster;

/**
 * Servlet implementation class SettingServ
 */
public class SettingServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SettingServ() {
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
		DaoMethods d_obj= new DaoMethodsImp();
		ArrayList<UserMaster> u_list= d_obj.viewAllData(user_id);
		String get_value=request.getParameter("value");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		if(get_value.equalsIgnoreCase("account_setting")){
		
		out.println("<div style='margin-left: 150px'>");
		out.println("<table>");
		out.println("<tr><td><input type='button' value='Change Login-ID' class='btn btn-warning' onClick='viewLoginId();'/></td></tr><tr><td><div style='padding-top:20px;' id='login_id'></div></td></tr>");
		out.println("<tr><td><input type='button' value='Change Password' class='btn btn-warning' onClick='viewPassword();'/></td></tr><tr><td><div style='padding-top:20px;' id='password'></div></td></tr>");
		out.println("<tr><td><input type='button' value='Change Full-Name' class='btn btn-warning' onClick='viewFullName();'/></td></tr><tr><td><div style='padding-top:20px;' id='fullname'></div></td></tr>");
		out.println("</table>");
		out.println("</div>");
		
		}
		else if(get_value.equalsIgnoreCase("get_login_id")){
			
			String login_id=u_list.get(0).getLogin_id();
			
			out.println("<div><table><tr><td>Login-ID</td><td><input type='text' value='"+login_id+"' name='login_field'/></td><td>&nbsp;&nbsp&nbsp;<input type='button' value='Change' class='btn btn-danger' onClick='alert('hello');' /></td></tr></table></div>");
		}
		else if(get_value.equalsIgnoreCase("get_password")){
			out.println("<form name='password_form' action='UpdateServ' method='post'><table><tr><td>Password</td><td><input type='password' id='pass1' /></td></tr><tr><td>Re-enter Password</td><td><input type='password' id='pass2' /></td></tr><tr><td></td><td><input type='hidden' name='hid_val' value='change_password' /><input type='submit' value='Change' class='btn btn-danger' onClick='return passwordValidation();' /></td></tr><tr><td colspan='2'><hr><td></tr></table></form>");

		}
		else if(get_value.equalsIgnoreCase("get_fullname")){
			String full_name=u_list.get(0).getFull_name();
			out.println("<div><table><tr><td>Full-Name</td><td><input type='text' value='"+full_name+"'/></td><td>&nbsp;&nbsp&nbsp;<input type='button' value='Change' class='btn btn-danger' /></td></tr></table></div>");

		}
		else{
			out.println("<tr><td>Internal Note</td><td><textarea rows='4' cols='20' name='note'></textarea></td></td></tr>");
			
		}
	}

}
