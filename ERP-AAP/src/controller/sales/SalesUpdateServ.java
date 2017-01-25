package controller.sales;

import generics.user_mgmt.GenericsMethod;
import iFaces.sales.SalesDao;
import iFaces.sales.SalesDelete;
import iFaces.sales.SalesUpdate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.sales.SalesDaoImp;
import dao.sales.SalesDeleteImp;
import dao.sales.SalesUpdateImp;

import bean.sales.Customer;
import bean.sales.Lead;
import bean.sales.Logged_Call;
import bean.sales.Meeting;
import bean.sales.Scheduled_Call;

/**
 * Servlet implementation class SalesUpdateServ
 */
public class SalesUpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesUpdateServ() {
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
		String hid=request.getParameter("hid_val");
		if(hid.equalsIgnoreCase("edit_customer")){
			String cust_name=request.getParameter("cust_name");
			String e_name=request.getParameter("e_name");
			String website=request.getParameter("website");
			String phn_no=request.getParameter("phn_no");
			String fax=request.getParameter("fax");
			String m_no1=request.getParameter("m_no1");
			String m_no2=request.getParameter("m_no2");
			
			String address=request.getParameter("address");
			String country=request.getParameter("country");
			String state=request.getParameter("state");
			String city=request.getParameter("city");
			
			String description=request.getParameter("description");
			String cust_id=request.getParameter("cust_id");
			
			Customer cu=new Customer();
			cu.setUpdated_by(user_id);
			cu.setCust_name(cust_name);
			cu.setEmail_id(e_name);
			cu.setWebsite(website);
			cu.setPhone_no(phn_no);
			cu.setFax(fax);
			cu.setMobile_no1(m_no1);
			cu.setMobile_no2(m_no2);
			
			cu.setAddress(address);
			cu.setCountry(Integer.parseInt(country));
			cu.setState(Integer.parseInt(state));
			cu.setCity(Integer.parseInt(city));
			cu.setCust_id(Integer.parseInt(cust_id));
			cu.setDescription(description);
			SalesDao s_dao=new SalesDaoImp();
			ArrayList<Customer> old_lst=s_dao.CustomerInfo(Integer.parseInt(cust_id));
			String iscompany=old_lst.get(0).getIs_company();
			if(iscompany.equalsIgnoreCase("0")){
				String company_field=request.getParameter("company_field");
				String job_position=request.getParameter("job_position");
				String title_field=request.getParameter("title_field");
				cu.setCompany_id(Integer.parseInt(company_field));
				cu.setJob_position(job_position);
				cu.setTitle(Integer.parseInt(title_field));
				
			}else{
				cu.setCompany_id(-1);
				cu.setJob_position(" ");
				cu.setTitle(-1);
				
			}
			
			SalesUpdate su_obj= new SalesUpdateImp();
			boolean flag=su_obj.updateCustomer(cu);
			if(flag){
				response.sendRedirect("home.jsp?p=Customer_Info&id="+cust_id);
			}
		}
		else if(hid.equalsIgnoreCase("edit_lead")){
			String subject=request.getParameter("subject");
			String lead_date=request.getParameter("lead_date");
			String customer=request.getParameter("customer");
			String contact_name=request.getParameter("con_name");
			String title_field=request.getParameter("title_field");
			String category=request.getParameter("category");
			String priority=request.getParameter("priority");
			String address=request.getParameter("address");
			String fax=request.getParameter("fax");
			String phn_no=request.getParameter("phn_no");
			String m_no1=request.getParameter("m_no1");
			String m_no2=request.getParameter("m_no2");
			String e_name=request.getParameter("e_name");
			String description=request.getParameter("description");
			String edit_id=request.getParameter("edit_id");
			String stage=request.getParameter("stage");
			Lead lead= new Lead();
			lead.setSubject(subject);
			lead.setLead_dt(lead_date);
			lead.setCustomer_id(Integer.parseInt(customer));
			lead.setContact_name(contact_name);
			lead.setEmail(e_name);
			lead.setTitle(Integer.parseInt(title_field));
			lead.setCategory(Integer.parseInt(category));
			lead.setPriority(Integer.parseInt(priority));
			lead.setAddress(address);
			lead.setFax(fax);
			lead.setPhone_no(phn_no);
			lead.setMobile_no1(m_no1);
			lead.setMobile_no2(m_no2);
			lead.setDescription(description);
			lead.setLead_id(Integer.parseInt(edit_id));
			lead.setUpdated_by(user_id);
			lead.setStage(stage);
			SalesUpdate sui=new SalesUpdateImp();
			boolean flag=sui.updateLead(lead);
			if(flag)
				response.sendRedirect("home.jsp?p=Lead Info&id="+edit_id);

			
		}
		else if(hid.equalsIgnoreCase("edit_scheduledcall")){
			
			String summary=request.getParameter("summary");
			String contact=request.getParameter("contact");
			String phone=request.getParameter("phone");
			String mobile1=request.getParameter("mobile1");
			String mobile2=request.getParameter("mobile2");
			String date_name=request.getParameter("date_name");
			String responsible=request.getParameter("responsible");
			String p_category=request.getParameter("p_category");
			String priority=request.getParameter("priority");
			String description=request.getParameter("description");
			String status=request.getParameter("status");
			String schedule_id=request.getParameter("schedule_id");
			Scheduled_Call sc= new Scheduled_Call();
			sc.setSummary(summary);
			sc.setContact(Integer.parseInt(contact));
			sc.setPhone_no(phone);
			sc.setMobile_no1(mobile1);
			sc.setMobile_no2(mobile2);
			sc.setDate(date_name);
			sc.setResponsible(Integer.parseInt(responsible));
			sc.setCategory(Integer.parseInt(p_category));
			sc.setPriority(Integer.parseInt(priority));
			sc.setDescription(description);
			sc.setStatus(status);
			sc.setUpdated_by(user_id);
			sc.setSchedule_id(Integer.parseInt(schedule_id));
			SalesUpdate sup=new SalesUpdateImp();
			boolean flg=sup.updateScheduledCall(sc);
			if(flg){
				SalesDao sd_obj=new SalesDaoImp();
				ArrayList<Scheduled_Call> sc_call=sd_obj.viewScheduleDetail(Integer.parseInt(schedule_id));
				String old_status=sc_call.get(0).getStatus();
				String sc_date=sc_call.get(0).getDate();
				String sc_summary=sc_call.get(0).getSummary();
				int sc_contact=sc_call.get(0).getContact();
				int sc_responsible=sc_call.get(0).getResponsible();
				if(old_status.equalsIgnoreCase("Held")){
					SalesDelete salesd=new SalesDeleteImp();
					boolean flag=salesd.DeleteScheduleCall(Integer.parseInt(schedule_id));
					if(flag){
						Logged_Call lg=new Logged_Call();
						lg.setDate(sc_date);
						lg.setSummary(sc_summary);
						lg.setContact(sc_contact);
						lg.setResponsible(sc_responsible);
						lg.setCreated_by(user_id);
						GenericsMethod<Logged_Call> g_obj=new GenericsMethod<Logged_Call>();
						boolean log_flag=g_obj.insertData(lg);
						if(log_flag){
							response.sendRedirect("home.jsp?p=Scheduled Calls");
						}
						
					}
					else{
						response.sendRedirect("home.jsp?p=Scheduled Call Edit&id="+Integer.parseInt(schedule_id)+"");
					}
				}
				//else if(old_status.equalsIgnoreCase("Cancelled")){
				//	boolean flag=sup.DeleteScheduleCall(Integer.parseInt(schedule_id));
				//	if(flag){
				//		response.sendRedirect("home.jsp?p=Scheduled Calls");
				//	}
				//}
				else{
				response.sendRedirect("home.jsp?p=Scheduled Call Info&id="+schedule_id);
			}
				}
			
		}
		else if(hid.equalsIgnoreCase("edit_logged_call")){
			String summary=request.getParameter("summary");
			String date_name=request.getParameter("date_name");
			String contact=request.getParameter("contact");
			String responsible=request.getParameter("responsible");
			String edit_id=request.getParameter("edit_id");
			Logged_Call log= new Logged_Call();
			log.setSummary(summary);
			log.setDate(date_name);
			log.setContact(Integer.parseInt(contact));
			log.setResponsible(Integer.parseInt(responsible));
			log.setLogged_id(Integer.parseInt(edit_id));
			SalesUpdate sup=new SalesUpdateImp();
			boolean flg=sup.updateLoggedCall(log);
			if(flg)
				response.sendRedirect("home.jsp?p=Logged Calls");
			
		}
		else if(hid.equalsIgnoreCase("edit meeting")){
			String subject=request.getParameter("subject");
			String date_name=request.getParameter("date_name");
			String duration=request.getParameter("duration");
			String[] attendies=request.getParameterValues("attendies");
			String edit_id=request.getParameter("edit_id");
			String values=attendies[0];
			for(int i=1;i<attendies.length;i++){
				values+=","+attendies[i];
			}
			String a_id=values;
			SalesDao sd_obj=new SalesDaoImp();
				String[] a_ids=a_id.split(",");
				String attendees_name="";
				for(int i=0;i<a_ids.length;i++){
					ArrayList<Customer> c_lst=sd_obj.CustomerInfo(Integer.parseInt(a_ids[i]));
					if(i==a_ids.length-1)
						attendees_name+=c_lst.get(0).getCust_name();
					else
						attendees_name+=c_lst.get(0).getCust_name()+",";
				}
			String responsible=request.getParameter("responsible");
			String location=request.getParameter("location");
			String description=request.getParameter("description");
			Meeting mt=new Meeting();
			mt.setSubject(subject);
			mt.setDate(date_name);
			mt.setDuration(duration);
			mt.setAttendies(values);
			mt.setAttendees_names(attendees_name);
			mt.setResponsible(Integer.parseInt(responsible));
			mt.setLocation(location);
			mt.setDescription(description);
			mt.setUpdated_by(user_id);
			mt.setMeeting_id(Integer.parseInt(edit_id));
			SalesUpdate sup=new SalesUpdateImp();
			boolean flg=sup.updateMeeting(mt);
			if(flg)
				response.sendRedirect("home.jsp?p=Meeting Info&id="+edit_id);
			
			
		}
		else{}
	}

}
