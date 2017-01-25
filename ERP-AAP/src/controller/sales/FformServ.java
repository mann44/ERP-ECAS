package controller.sales;

import generics.user_mgmt.GenericsMethod;

import iFaces.sales.SalesDao;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.sales.SalesDaoImp;

import bean.sales.Categories;
import bean.sales.Company;
import bean.sales.Title;

/**
 * Servlet implementation class FformServ
 */
public class FformServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FformServ() {
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
		String hid=request.getParameter("hid_val");
		if(hid.equalsIgnoreCase("title")){
			String title=request.getParameter("title_name");
			Title t = new Title();
			t.setTitle(title);
			SalesDao s_obj= new SalesDaoImp();
			ArrayList<Title> lst=s_obj.checkTitle(t);
			if(lst.isEmpty()){
			GenericsMethod<Title> g_obj= new GenericsMethod<Title>();
			boolean flg=g_obj.insertData(t);
			if(flg){
				System.out.println("data inserted");
				response.sendRedirect("home.jsp?p=Add Customer");
			}
			}
			else{
				response.sendRedirect("home.jsp?p=Add Customer");
			}
			
		}
		
		else if(hid.equalsIgnoreCase("company")){
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
			Company co=new Company();
			co.setCompany_name(c_name);
			co.setEmail(email);
			co.setWebsite(website);
			co.setPhn_no(phn_no);
			co.setFax(fax);
			co.setMobile_no1(m_no1);
			co.setMobile_no2(m_no2);
			co.setAddress(address);
			co.setCountry(Integer.parseInt(country));
			co.setState(Integer.parseInt(state));
			co.setCity(Integer.parseInt(city));
			co.setDescription(description);
			GenericsMethod<Company> g_obj= new GenericsMethod<Company>();
			boolean flg=g_obj.insertData(co);
			if(flg){
				System.out.println("Data Inserted");
			}
			
		}
		else if(hid.equalsIgnoreCase("category")){
			String c_name=request.getParameter("category_name");
			boolean check=false;
			Categories cat= new Categories();
			GenericsMethod<Categories> g_obj= new GenericsMethod<Categories>();
			ArrayList<Categories> cat_list=g_obj.viewDate(cat);
			for(int i=0;i<cat_list.size();i++){
				if(cat_list.get(i).getCategory().equalsIgnoreCase(c_name)){
					check=true;
					break;
				}
			}
			if(!check){
				cat.setCategory(c_name);
				boolean flag=g_obj.insertData(cat);
				if(flag){
					System.out.println("Data Inserted");
			}
			
			
			}
		}
		else{
			
		}
	}

}
