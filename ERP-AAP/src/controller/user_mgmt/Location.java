package controller.user_mgmt;

import generics.user_mgmt.GenericsMethod;

import iFaces.user_mgmt.DaoMethods;
import iFaces.user_mgmt.UpdateData;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import others.MyStringRandomGen;

import dao.user_mgmt.DaoMethodsImp;
import dao.user_mgmt.UpdateDataImp;

import mail.Mail;
import mail.RC4;

import bean.user_mgmt.AssignRight;
import bean.user_mgmt.City;
import bean.user_mgmt.Country;
import bean.user_mgmt.Privilege;
import bean.user_mgmt.Privilege_Comp;
import bean.user_mgmt.Role;
import bean.user_mgmt.State;
import bean.user_mgmt.UserMaster;

/**
 * Servlet implementation class Location
 */
public class Location extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Location() {
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
		if(hid.equalsIgnoreCase("country")){
			String name=request.getParameter("country_name");
			Country co= new Country();
			GenericsMethod<Country> gen_ctry=new GenericsMethod<Country>();
			ArrayList<Country> c_list=gen_ctry.viewDate(co);
			boolean check=false;
			for(int i=0;i<c_list.size();i++){
				if(c_list.get(i).getC_name().equalsIgnoreCase(name)){
					check=true;
					break;
				}
			}
			if(!check){
				co.setC_name(name);
				GenericsMethod<Country> gen_obj=new GenericsMethod<Country>();
				boolean flg=gen_obj.insertData(co);
				if(flg)
					System.out.println("Data Inserted");
			}
			
			
		}
		else if(hid.equalsIgnoreCase("state")){
			String name=request.getParameter("state_name");
			String c_id=request.getParameter("s_country");
			int co_id=Integer.parseInt(c_id);
			State s_obj=new State();
			boolean check=false;
			GenericsMethod<State> gen_st=new GenericsMethod<State>();
			ArrayList<State> st_list=gen_st.viewDate(s_obj);
			for(int i=0;i<st_list.size();i++){
				if(st_list.get(i).getState_name().equalsIgnoreCase(name)){
					check=true;
					break;
				}
			}
			if(!check){
				s_obj.setCountry_id(co_id);
				s_obj.setState_name(name);
				GenericsMethod<State> gen_obj=new GenericsMethod<State>();
				boolean flg=gen_obj.insertData(s_obj);
				if(flg)
					System.out.println("Data inserted");
			}
			
		}
		else if(hid.equalsIgnoreCase("city")){
			String name=request.getParameter("city_name");
			String c_id=request.getParameter("c_country");
			String s_id=request.getParameter("c_state");
			int ic_id=Integer.parseInt(c_id);
			int is_id=Integer.parseInt(s_id);
			City c_obj=new City();
			boolean check=false;
			GenericsMethod<City> gen_ct=new GenericsMethod<City>();
			ArrayList<City> ct_list=gen_ct.viewDate(c_obj);
			for(int i=0;i<ct_list.size();i++){
				if(ct_list.get(i).getCity_name().equalsIgnoreCase(name)){
					check=true;
					return;
				}
			}
			if(!check){
				c_obj.setCity_name(name);
				c_obj.setCountry_id(ic_id);
				c_obj.setState_id(is_id);
				GenericsMethod<City> gc_obj=new GenericsMethod<City>();
				boolean flag=gc_obj.insertData(c_obj);
				if(flag)
					System.out.println("Data Inserted");
			}
			
			
		}
		else if(hid.equalsIgnoreCase("add_user")){
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
			int user_id=(Integer) session.getAttribute("user_id");
			RC4 rc4= new RC4();
			MyStringRandomGen msr=new MyStringRandomGen();
			String r_str=msr.generateRandomString();
			String password=rc4.work(r_str);
			UserMaster u_obj= new UserMaster();
			u_obj.setRole_type(Integer.parseInt(role));
			u_obj.setLogin_id(userName);
			u_obj.setFull_name(fullName);
			u_obj.setGender(gender);
			u_obj.setBirth_dt(b_dt);
			u_obj.setEmail(email);
			u_obj.setAddress(address);
			u_obj.setCountry(Integer.parseInt(country));
			u_obj.setState(Integer.parseInt(state));
			u_obj.setCity(Integer.parseInt(city));
			u_obj.setContact_no(contact);
			u_obj.setInternal_note(note);
			u_obj.setPassword(password);
			u_obj.setCreated_by(user_id);
			u_obj.setAcc_lock("0");
			u_obj.setActive_flag("1");
			u_obj.setAssign_rights("0");
			u_obj.setUpdated_by(0);
			GenericsMethod<UserMaster> gen_obj= new GenericsMethod<UserMaster>();
			boolean flag=gen_obj.insertData(u_obj);
			if(flag){
				try{
				Mail m = new Mail();
				String msg="UserName: "+userName+"\npassword: "+password;
				m.sendmail("Your Id and Password",email,msg);
				}catch(Exception e){
					e.printStackTrace();
				}
				response.sendRedirect("home.jsp?p=View User");
			}
			
		}
		else if(hid.equalsIgnoreCase("create_privilege")){
			String p_name=request.getParameter("privilege_name");
			String p_area=request.getParameter("pt_area");
			int user_id=(Integer) session.getAttribute("user_id");
			Privilege pr= new Privilege();
			GenericsMethod<Privilege> gen = new GenericsMethod<Privilege>();
			boolean check=false;
			ArrayList<Privilege> pr_list=gen.viewDate(pr);
			for(int i=0;i<pr_list.size();i++){
				if(pr_list.get(i).getPrivilege_name().equalsIgnoreCase(p_name)){
					check=true;
					break;
				}
			}
			if(!check){
				pr.setPrivilege_name(p_name);
				pr.setPrivilege_desc(p_area);
				pr.setCreated_by(user_id);
				boolean flg=gen.insertData(pr);
				if(flg){
					response.sendRedirect("home.jsp?p=Manage Privilege");
				}
			}
			
			
			
		}
		
		else if(hid.equalsIgnoreCase("assign_right")){
			String role_id=request.getParameter("role");
			String user_id=request.getParameter("user_id");
			String[] rights=request.getParameterValues("p_names");
			String right=rights[0];
			for(int i=1;i<rights.length;i++){
				right +=","+rights[i];
			}
			
		
			AssignRight as = new AssignRight();
			as.setRole_id(Integer.parseInt(role_id));
			as.setUser_id(Integer.parseInt(user_id));
			as.setPrivilege_ids(right);
		
			GenericsMethod<AssignRight> g_obj = new GenericsMethod<AssignRight>();
			boolean flg= g_obj.insertData(as);
			if(flg){
				UserMaster um=new UserMaster();
				um.setUser_id(Integer.parseInt(user_id));
				UpdateData ud_obj=new UpdateDataImp();
				boolean r_flg=ud_obj.updateRights(um);
				if(r_flg){
					response.sendRedirect("home.jsp?p=Assign Rights");
				}
			}
			
		}
		else if(hid.equalsIgnoreCase("component_bind")){
			String p_id=request.getParameter("privilege_id");
			String comp_name=request.getParameter("c_name");
			int user_id=(Integer) session.getAttribute("user_id");
			DaoMethods d_obj=new DaoMethodsImp();
			ArrayList<Privilege_Comp> com_list=d_obj.getBindComp(Integer.parseInt(p_id));
			if(com_list.isEmpty()){
				Privilege_Comp pr= new Privilege_Comp();
				pr.setPrivilege_id(Integer.parseInt(p_id));
				pr.setComponent_names(comp_name);
				pr.setCreated_by(user_id);
				GenericsMethod<Privilege_Comp> g_obj= new GenericsMethod<Privilege_Comp>();
				boolean flg=g_obj.insertData(pr);
				if(flg)
					response.sendRedirect("home.jsp?p=Manage Privilege");
			}
			else{
				Privilege_Comp old_pr=new Privilege_Comp();
				String coms=com_list.get(0).getComponent_names();
				String fin_com=coms.concat(",");
				String fin_coms=fin_com.concat(comp_name);
				String[] com=coms.split(",");
				boolean check=false;
				for(int i=0;i<com.length;i++)
				{
					if(com[i].equalsIgnoreCase(comp_name)){
						check=true;
						break;
					}
				}
				if(check){
					response.sendRedirect("home.jsp?p=Manage Privilege");
				}
				else{
					UpdateData d_imp=new UpdateDataImp();
					old_pr.setComponent_names(fin_coms);
					old_pr.setPrivilege_id(Integer.parseInt(p_id));
					boolean f_flag=d_imp.updateComponentBind(old_pr);
					if(f_flag)
						response.sendRedirect("home.jsp?p=Manage Privilege");
				}
				
			}
			
		
			
		}
		
		
		else{
			String role_name=request.getParameter("role_name");
			String role_desc=request.getParameter("role_desc");
			Role r_obj=new Role();
			GenericsMethod<Role> gen_role=new GenericsMethod<Role>();
			ArrayList<Role> r_list=gen_role.viewDate(r_obj);
			boolean check=false;
			for(int i=0;i<r_list.size();i++){
				if(r_list.get(i).getRole().equalsIgnoreCase(role_name)){
					check=true;
					break;
				}
			}
			if(!check){
			r_obj.setRole(role_name);
			r_obj.setRole_desc(role_desc);
			int user_id=(Integer) session.getAttribute("user_id");
			r_obj.setCreated_by(user_id);
			GenericsMethod<Role> gr_obj=new GenericsMethod<Role>();
			boolean flag=gr_obj.insertData(r_obj);
			if(flag)
				System.out.println("Data Inserted");
			}
		}
	}

}
