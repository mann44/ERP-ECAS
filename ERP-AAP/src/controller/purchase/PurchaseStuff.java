package controller.purchase;

import generics.user_mgmt.GenericsMethod;
import iFaces.purchase.PurchaseDao;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.purchase.PurchaseDaoImp;

import bean.purchase.Item;
import bean.purchase.Item_Size;
import bean.purchase.P_Quotation;
import bean.purchase.Product;
import bean.purchase.Product_Category;
import bean.purchase.Quotation_Detail;
import bean.purchase.Supplier;
import bean.purchase.Supplier_Company;
import bean.sales.Customer;

/**
 * Servlet implementation class PurchaseStuff
 */
public class PurchaseStuff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseStuff() {
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
		if(hid.equalsIgnoreCase("Add Product")){
			String category_id=request.getParameter("category_id");
			String product=request.getParameter("product");
			String description=request.getParameter("description");
			PurchaseDao p_obj=new PurchaseDaoImp();
			Product pr_old=new Product();
			pr_old.setProduct_category(Integer.parseInt(category_id));
			pr_old.setProduct(product);
			boolean check=p_obj.checkProduct(pr_old);
			if(check){
				ArrayList<Product_Category> c_lst=p_obj.getProductCategory(Integer.parseInt(category_id));
				int pr_type=c_lst.get(0).getProduct_type_id();
				Product pr=new Product();
				
				pr.setProduct_category(Integer.parseInt(category_id));
				pr.setProduct(product);
				pr.setDescription(description);
				pr.setCreated_by(user_id);
				pr.setActive_flag("1");
				pr.setProduct_type(pr_type);
				GenericsMethod<Product> pg_obj=new GenericsMethod<Product>();
				boolean flag=pg_obj.insertData(pr);
				if(flag)
					response.sendRedirect("home.jsp?p=Products");
				
			}
			else{
				response.sendRedirect("home.jsp?p=Products");
			}
			
		}
		else if(hid.equalsIgnoreCase("Add Item")){
			String product=request.getParameter("product");
			String item=request.getParameter("item");
			String description=request.getParameter("description");
			PurchaseDao pdi=new PurchaseDaoImp();
			ArrayList<Product> p_lst=pdi.productInfo(Integer.parseInt(product));
			int p_type=p_lst.get(0).getProduct_type();
			int p_cat=p_lst.get(0).getProduct_category();
				Item i=new Item();
				i.setProduct(Integer.parseInt(product));
				i.setProduct_type(p_type);
				i.setProduct_category(p_cat);
				i.setItem(item);
				i.setDescription(description);
				i.setActive_flag("1");
				i.setCreated_by(user_id);
				GenericsMethod<Item> g_obj=new GenericsMethod<Item>();
				boolean flag=g_obj.insertData(i);
				if(flag)
					response.sendRedirect("home.jsp?p=Items");
			
		}
		else if(hid.equalsIgnoreCase("Add Item Size")){
			String item=request.getParameter("item");
			String size=request.getParameter("size");
			Item_Size is=new Item_Size();
			is.setItem(Integer.parseInt(item));
			is.setSize(size);
			PurchaseDao pd=new PurchaseDaoImp();
			boolean check=pd.checkSize(is);
			System.out.println(check);
			if(check){
				is.setCreated_by(user_id);
				GenericsMethod<Item_Size> g_obj=new GenericsMethod<Item_Size>();
				boolean flg=g_obj.insertData(is);
				if(flg)
					response.sendRedirect("home.jsp?p=Add Item Size");
			}
			else{
				response.sendRedirect("home.jsp?p=Add Item Size");
			}
			
			
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
			Supplier_Company  sc=new Supplier_Company();
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
			GenericsMethod<Supplier_Company> gen_obj=new GenericsMethod<Supplier_Company>();
			boolean flag=gen_obj.insertData(sc);
			if(flag)
				response.sendRedirect("home.jsp?p=Create Supplier");
			
		}
		else if(hid.equalsIgnoreCase("Add Supplier")){
			String chbox=request.getParameter("isco");
			String Sup_name=request.getParameter("Sup_name");
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
			Supplier cu=new Supplier();
			cu.setSupplier_name(Sup_name);
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
			GenericsMethod<Supplier> g_obj=new GenericsMethod<Supplier>();
			boolean flag=g_obj.insertData(cu);
			if(flag)
				response.sendRedirect("home.jsp?p=Suppliers");
			
		}
		else if(hid.equalsIgnoreCase("Quotation Detail")){
			String product=request.getParameter("product");
			String item=request.getParameter("item");
			String description=request.getParameter("description");
			String s_date=request.getParameter("s_date");
			String quantity=request.getParameter("quantity");
			String u_price=request.getParameter("u_price");
			String tax=request.getParameter("tax");
			PurchaseDao pd=new PurchaseDaoImp();
			int n_id=pd.nextInc();
			System.out.println(n_id);
			Quotation_Detail qd=new Quotation_Detail();
			qd.setQuotation_id(n_id);
			qd.setProduct(Integer.parseInt(product));
			qd.setItem(Integer.parseInt(item));
			qd.setDescription(description);
			qd.setSchedule_dt(s_date);
			qd.setQuantity(Double.parseDouble(quantity));
			qd.setUnit_price(Double.parseDouble(u_price));
			qd.setTaxs(Double.parseDouble(tax));
			GenericsMethod<Quotation_Detail> g_obj=new GenericsMethod<Quotation_Detail>();
			boolean flag=g_obj.insertData(qd);
			if(flag)
				response.sendRedirect("home.jsp?p=Create Quotation");
		}
		else if(hid.equalsIgnoreCase("Create Quotation")){
			String supplier=request.getParameter("supplier");
			String sref=request.getParameter("sref");
			String odate=request.getParameter("odate");
			String edate=request.getParameter("edate");
			String status=request.getParameter("status");
			P_Quotation pq=new P_Quotation();
			pq.setSupplier(Integer.parseInt(supplier));
			pq.setSupplier_ref(sref);
			pq.setOrder_dt(odate);
			pq.setExpected_dt(edate);
			pq.setStatus(status);
			pq.setCreated_by(user_id);
			GenericsMethod<P_Quotation> g_obj=new GenericsMethod<P_Quotation>();
			boolean flag=g_obj.insertData(pq);
			if(flag)
				response.sendRedirect("home.jsp?p=Quotations");
			
		}
		else{}
	}

}
