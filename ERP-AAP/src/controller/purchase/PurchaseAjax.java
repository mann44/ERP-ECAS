package controller.purchase;

import iFaces.purchase.PurchaseDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.purchase.Item;

import dao.purchase.PurchaseDaoImp;

/**
 * Servlet implementation class PurchaseAjax
 */
public class PurchaseAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseAjax() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String product_id=request.getParameter("value");
		PurchaseDao pdi=new PurchaseDaoImp();
		ArrayList<Item> i_lst=pdi.getItem(Integer.parseInt(product_id));
		out.println("<td>");
		out.println("<select style='width:100%;margin-top: 5px;' name='item' id='i_id'>");
		for(int i=0;i<i_lst.size();i++){
			out.println("<option value="+i_lst.get(i).getItem_id()+">"+i_lst.get(i).getItem()+"</option>");
		}
		out.println("</select></td>");
		
			
		
		
	}

}
