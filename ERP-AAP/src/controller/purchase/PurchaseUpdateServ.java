package controller.purchase;

import iFaces.purchase.PurchaseDao;
import iFaces.purchase.PurchaseUpdate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.purchase.PurchaseDaoImp;
import dao.purchase.PurchaseUpdateImp;

import bean.purchase.Item;
import bean.purchase.Product;
import bean.purchase.Supplier;
import bean.sales.Customer;

/**
 * Servlet implementation class PurchaseUpdateServ
 */
public class PurchaseUpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseUpdateServ() {
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
		if(hid.equalsIgnoreCase("Edit Product")){
			String category_id=request.getParameter("category_id");
			String product=request.getParameter("product");
			String description=request.getParameter("description");
			String edit_id=request.getParameter("edit_id");
			Product pr=new Product();
			pr.setProduct_category(Integer.parseInt(category_id));
			pr.setProduct(product);
			pr.setDescription(description);
			pr.setUpdated_by(user_id);
			pr.setProduct_id(Integer.parseInt(edit_id));
			PurchaseUpdate pui=new PurchaseUpdateImp();
			boolean flg=pui.updateProduct(pr);
			if(flg)
				response.sendRedirect("home.jsp?p=Products");
		}
		else if(hid.equalsIgnoreCase("Edit Supplier")){
			String sup_name=request.getParameter("sup_name");
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
			String edit_id=request.getParameter("edit_id");
			Supplier cu=new Supplier();
			cu.setUpdated_by(user_id);
			cu.setSupplier_name(sup_name);
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
			cu.setSupplier_id(Integer.parseInt(edit_id));
			cu.setDescription(description);
			PurchaseDao pd=new PurchaseDaoImp();
			ArrayList<Supplier> old_lst=pd.supplierInfo(Integer.parseInt(edit_id));
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
			PurchaseUpdate pdu=new PurchaseUpdateImp();
			boolean flag=pdu.updateSupplier(cu);
			if(flag)
				response.sendRedirect("home.jsp?p=Supplier Info&id="+edit_id);
			
		}
		else if(hid.equalsIgnoreCase("Edit Item")){
			String product=request.getParameter("product");
			String item=request.getParameter("item");
			String description=request.getParameter("description");
			String edit_id=request.getParameter("edit_id");
			Item i=new Item();
			i.setProduct(Integer.parseInt(product));
			i.setItem(item);
			i.setDescription(description);
			i.setUpdated_by(user_id);
			i.setItem_id(Integer.parseInt(edit_id));
			PurchaseUpdate pu=new PurchaseUpdateImp();
			boolean flag=pu.updateItem(i);
			if(flag)
				response.sendRedirect("home.jsp?p=Item Info&id="+edit_id);
			
		}
		else{}
	}

}
