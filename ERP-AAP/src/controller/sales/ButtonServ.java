package controller.sales;

import generics.user_mgmt.GenericsMethod;
import iFaces.sales.SalesDao;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.sales.Logged_Call;
import bean.sales.Scheduled_Call;

import dao.sales.SalesDaoImp;

/**
 * Servlet implementation class ButtonServ
 */
public class ButtonServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ButtonServ() {
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
		String action=request.getParameter("dButton");
		if(action.equalsIgnoreCase("Schedule Call")){
			String summary=request.getParameter("summary");
			String date_name=request.getParameter("date_name");
			String assignto=request.getParameter("assignto");
			String sc_id=request.getParameter("sc_id");
			System.out.println("summary"+summary+" date"+date_name+" res"+assignto+"  id"+sc_id);
			SalesDao sd_obj=new SalesDaoImp();
			ArrayList<Scheduled_Call> sc_list=sd_obj.viewScheduleDetail(Integer.parseInt(sc_id));
			int contact=sc_list.get(0).getContact();
			int category=sc_list.get(0).getCategory();
			int priority=sc_list.get(0).getPriority();
			Scheduled_Call soc=new Scheduled_Call();
			soc.setSummary(summary);
			soc.setDate(date_name);
			soc.setContact(contact);
			soc.setResponsible(Integer.parseInt(assignto));
			soc.setCategory(category);
			soc.setPriority(priority);
			soc.setPhone_no(sc_list.get(0).getPhone_no());
			soc.setMobile_no1(sc_list.get(0).getMobile_no1());
			soc.setMobile_no2(sc_list.get(0).getMobile_no2());
			soc.setDescription(sc_list.get(0).getDescription());
			soc.setCreated_by(user_id);
			soc.setStatus("Confirmed");
			GenericsMethod<Scheduled_Call> gen_obj=new GenericsMethod<Scheduled_Call>();
			boolean flag=gen_obj.insertData(soc);
			if(flag){
				response.sendRedirect("home.jsp?p=Scheduled Calls");
			}
			
			
		}
		else if(action.equalsIgnoreCase("Logged Call")){
			String summary=request.getParameter("summary");
			String assignto=request.getParameter("assignto");
			String sc_id=request.getParameter("sc_id");
			SalesDao sd_obj=new SalesDaoImp();
			ArrayList<Scheduled_Call> sc_list=sd_obj.viewScheduleDetail(Integer.parseInt(sc_id));
			Logged_Call loc=new Logged_Call();
			loc.setSummary(summary);
			loc.setDate(sc_list.get(0).getDate());
			loc.setContact(sc_list.get(0).getContact());
			loc.setResponsible(Integer.parseInt(assignto));
			loc.setCreated_by(user_id);
			GenericsMethod<Logged_Call> gen_obj=new GenericsMethod<Logged_Call>();
			boolean flag=gen_obj.insertData(loc);
			if(flag){
				response.sendRedirect("home.jsp?p=Logged Calls");
			}
			
		}
		else{
			
		}
	}

}
