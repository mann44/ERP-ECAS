package controller.sales;

import iFaces.sales.SalesDelete;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.sales.SalesDeleteImp;


/**
 * Servlet implementation class SaleDeleteServ
 */
public class SaleDeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleDeleteServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		SalesDelete sd=new SalesDeleteImp();
		if(action.equalsIgnoreCase("lead")){
			String id=request.getParameter("id");
			boolean flg=sd.deleteLead(Integer.parseInt(id));
			if(flg)
				response.sendRedirect("home.jsp?p=Leads");
		}
		
		else if(action.equalsIgnoreCase("schedule call")){
			String id=request.getParameter("id");
			boolean flg=sd.DeleteScheduleCall(Integer.parseInt(id));
			if(flg)
				response.sendRedirect("home.jsp?p=Scheduled Calls");
			
		}
		
		else if(action.equalsIgnoreCase("logged call")){
			String id=request.getParameter("id");
			boolean flg=sd.deleteLoggedCall(Integer.parseInt(id));
			if(flg)
				response.sendRedirect("home.jsp?p=Logged Calls");

			
		}
		else if(action.equalsIgnoreCase("meeting")){
			String id=request.getParameter("id");
			boolean flg=sd.deleteMeeting(Integer.parseInt(id));
			if(flg)
				response.sendRedirect("home.jsp?p=Meetings");
			
		}
		else if(action.equalsIgnoreCase("customer")){
			String id=request.getParameter("id");
			boolean flg=sd.deleteCustomer(Integer.parseInt(id));
			if(flg)
				response.sendRedirect("home.jsp?p=Customers");

			
		}
	}

}
