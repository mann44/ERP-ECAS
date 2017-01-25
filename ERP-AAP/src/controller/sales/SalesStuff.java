package controller.sales;

import generics.user_mgmt.GenericsMethod;

import iFaces.sales.SalesDao;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Formatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.sales.SalesDaoImp;

import bean.purchase.Supplier_Company;
import bean.sales.Company;
import bean.sales.Customer;
import bean.sales.Lead;
import bean.sales.Logged_Call;
import bean.sales.Meeting;
import bean.sales.Scheduled_Call;

/**
 * Servlet implementation class SalesStuff
 */
public class SalesStuff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesStuff() {
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
		if(hid.equalsIgnoreCase("add_customer")){
			String chbox=request.getParameter("isco");
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
			
			Customer cu=new Customer();
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
			
			cu.setDescription(description);
			cu.setCreated_by(user_id);
			cu.setActive_flag("1");
			cu.setUpdated_by(0);
			

			if(chbox==null){
				String company_field=request.getParameter("company_field");
				String job_position=request.getParameter("job_position");
				String title_field=request.getParameter("title_field");
				cu.setCompany_id(Integer.parseInt(company_field));
				cu.setJob_position(job_position);
				cu.setTitle(Integer.parseInt(title_field));
				cu.setIs_company("0");
			}			
			else{
				cu.setCompany_id(-1);
				cu.setJob_position("");
				cu.setTitle(-1);
				cu.setIs_company("1");
			}
			
			GenericsMethod<Customer> g_obj= new GenericsMethod<Customer>();
			boolean flag=g_obj.insertData(cu);
			if(flag){
				response.sendRedirect("home.jsp?p=Customers");
			}

		}
		else if(hid.equalsIgnoreCase("creat_lead")){
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
			lead.setCreated_by(user_id);
			lead.setStage(stage);
			GenericsMethod<Lead> g_obj=new GenericsMethod<Lead>();
			boolean flg=g_obj.insertData(lead);
			if(flg){
				response.sendRedirect("home.jsp?p=Leads");
			}
		}
		else if(hid.equalsIgnoreCase("scheduled_call")){
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
			if(status.equalsIgnoreCase("Held")){
				Logged_Call lg=new Logged_Call();
				lg.setSummary(summary);
				lg.setDate(date_name);
				lg.setContact(Integer.parseInt(contact));
				lg.setResponsible(Integer.parseInt(responsible));
				lg.setCreated_by(user_id);
				GenericsMethod<Logged_Call> gen_log=new GenericsMethod<Logged_Call>();
				boolean flag=gen_log.insertData(lg);
				if(flag)
					response.sendRedirect("home.jsp?p=Logged Calls");
				
			}
			else{
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
				sc.setCreated_by(user_id);
				sc.setUpdated_by(0);
				sc.setStatus(status);
				
				GenericsMethod<Scheduled_Call> gsc_obj=new GenericsMethod<Scheduled_Call>();
				boolean flg=gsc_obj.insertData(sc);
				if(flg)
					response.sendRedirect("home.jsp?p=Scheduled Calls");
				
			}
			
		}
		else if(hid.equalsIgnoreCase("create_logged_call")){
			String summary=request.getParameter("summary");
			String date_name=request.getParameter("date_name");
			String contact=request.getParameter("contact");
			String responsible=request.getParameter("responsible");
			Logged_Call log= new Logged_Call();
			log.setSummary(summary);
			log.setDate(date_name);
			log.setContact(Integer.parseInt(contact));
			log.setResponsible(Integer.parseInt(responsible));
			log.setCreated_by(user_id);
			GenericsMethod<Logged_Call> g_obj= new GenericsMethod<Logged_Call>();
			boolean flg=g_obj.insertData(log);
			if(flg)
				response.sendRedirect("home.jsp?p=Logged Calls");
			
		}
		else if(hid.equalsIgnoreCase("create meeting")){
			String subject=request.getParameter("subject");
			String date_name=request.getParameter("date_name");
			String duration=request.getParameter("duration");
			String[] attendies=request.getParameterValues("attendies");
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
			mt.setResponsible(Integer.parseInt(responsible));
			mt.setLocation(location);
			mt.setDescription(description);
			mt.setCreated_by(user_id);
			mt.setAttendees_names(attendees_name);
			GenericsMethod<Meeting> g_obj=new GenericsMethod<Meeting>();
			boolean flag=g_obj.insertData(mt);
			if(flag)
				response.sendRedirect("home.jsp?p=Meetings");
		}
		else if(hid.equalsIgnoreCase("add company")){
			String c_name=request.getParameter("company_name");
			String email=request.getParameter("e_name");
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
			Company sc=new Company();
			sc.setCompany_name(c_name);
			sc.setEmail(email);
			sc.setWebsite(website);
			sc.setPhn_no(phn_no);
			sc.setFax(fax);
			sc.setMobile_no1(m_no1);
			sc.setMobile_no2(m_no2);
			sc.setAddress(address);
			sc.setCountry(Integer.parseInt(country));
			sc.setState(Integer.parseInt(state));
			sc.setCity(Integer.parseInt(city));
			sc.setDescription(description);
			sc.setCreated_by(user_id);
			sc.setActive_flag("1");
			GenericsMethod<Company> g_obj=new GenericsMethod<Company>();
			boolean flag=g_obj.insertData(sc);
			if(flag)
				response.sendRedirect("home.jsp?p=Add Customer");
			
		}
		else{
			
		}
	}

}
