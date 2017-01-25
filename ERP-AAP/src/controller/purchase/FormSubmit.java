package controller.purchase;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.purchase.Product;
import bean.purchase.Quotation_Detail;

/**
 * Servlet implementation class FormSubmit
 */
public class FormSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormSubmit() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String product=request.getParameter("product");
		String item=request.getParameter("item");
		String desc=request.getParameter("desc");
		String fdate=request.getParameter("fdate");
		String qnty=request.getParameter("qnty");
		String price=request.getParameter("price");
		String ta_x=request.getParameter("ta_x");
		Quotation_Detail qd=new Quotation_Detail();
		qd.setProduct(Integer.parseInt(product));
		qd.setItem(Integer.parseInt(item));
		qd.setDescription(desc);
		qd.setSchedule_dt(fdate);
		qd.setQuantity(Double.parseDouble(qnty));
		qd.setUnit_price(Double.parseDouble(price));
		qd.setTaxs(Double.parseDouble(ta_x));
		ArrayList<Quotation_Detail> lst=new ArrayList<Quotation_Detail>();
		lst.add(qd);
		session.setAttribute("list", lst);
		out.println("<tr style='border-bottom:1px solid #cdcdcd; height: 40px;'>");
		out.println("<td>"+qd.getProduct()+"</td>");
		out.println("<td>"+qd.getItem()+"</td>");
		out.println("<td>"+qd.getDescription()+"</td>");
		out.println("<td>"+qd.getSchedule_dt()+"</td>");
		out.println("<td>"+qd.getQuantity()+"</td>");
		out.println("<td>"+qd.getUnit_price()+"</td>");
		out.println("<td>"+qd.getTaxs()+"</td>");
		out.println("<td></td>");
		out.println("</tr>");
		
		
		System.out.println("product"+product);
		System.out.println("item"+item);
	}

}
