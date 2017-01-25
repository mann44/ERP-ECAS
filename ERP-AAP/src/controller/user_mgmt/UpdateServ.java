package controller.user_mgmt;

import iFaces.user_mgmt.UpdateData;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.user_mgmt.UserMaster;
import dao.user_mgmt.UpdateDataImp;

/**
 * Servlet implementation class UpdateServ
 */
public class UpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServ() {
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
		String hid=request.getParameter("hid_val");
		int user_id=(Integer) session.getAttribute("user_id");
		if(hid.equalsIgnoreCase("update_user")){
			UserMaster mst= new UserMaster();
			mst.setRole_type(Integer.parseInt(request.getParameter("up_role")));
			mst.setFull_name(request.getParameter("full_name"));
			mst.setEmail(request.getParameter("email_name"));
			mst.setContact_no(request.getParameter("contact_name"));
			mst.setAddress(request.getParameter("address"));
			mst.setCountry(Integer.parseInt(request.getParameter("country")));
			mst.setState(Integer.parseInt(request.getParameter("state")));
			mst.setCity(Integer.parseInt(request.getParameter("city")));
			mst.setUser_id(Integer.parseInt(request.getParameter("up_id")));
			UpdateData up_obj= new UpdateDataImp();
			boolean flg=up_obj.updateUser(mst);
			if(flg){
				response.sendRedirect("home.jsp");
			}
			
		}
		else if(hid.equalsIgnoreCase("edit_user")){
			String role=request.getParameter("s_dep");
			String userName=request.getParameter("user_name");
			String fullName=request.getParameter("full_name");
			String gender=request.getParameter("gen_name");
			String b_dt=request.getParameter("bdate_name");
			String email=request.getParameter("email_name");
			String address=request.getParameter("address");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			String city=request.getParameter("city");
			String contact=request.getParameter("contact_name");
			String note=request.getParameter("note");
			String edit_id=request.getParameter("edit_id");
			UserMaster mst=new UserMaster();
			mst.setRole_type(Integer.parseInt(role));
			mst.setLogin_id(userName);
			mst.setFull_name(fullName);
			mst.setGender(gender);
			mst.setBirth_dt(b_dt);
			mst.setEmail(email);
			mst.setAddress(address);
			mst.setCountry(Integer.parseInt(country));
			mst.setState(Integer.parseInt(state));
			mst.setCity(Integer.parseInt(city));
			mst.setContact_no(contact);
			mst.setInternal_note(note);
			mst.setUpdated_by(user_id);
			mst.setUser_id(Integer.parseInt(edit_id));
			UpdateData up_obj=new UpdateDataImp();
			boolean flag=up_obj.updateUser(mst);
			if(flag){
				response.sendRedirect("home.jsp?p=User Info&id="+edit_id);
			}
			
			
		}
		
		else if(hid.equalsIgnoreCase("change_password")){
			System.out.println("yesss");
			
		}
		else{
			UserMaster mst=new UserMaster();
			mst.setLogin_id(request.getParameter("login_field"));
			mst.setFull_name(request.getParameter("fname_field"));
			mst.setUser_id(user_id);
			UpdateData u_data= new UpdateDataImp();
			boolean flg=u_data.updateIdFname(mst);
			if(flg){
				session.setAttribute("user_name", request.getParameter("fname_field"));
				response.sendRedirect("home.jsp");
			}
		}
	}

}
