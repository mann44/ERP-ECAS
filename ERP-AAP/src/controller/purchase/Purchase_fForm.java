package controller.purchase;

import generics.user_mgmt.GenericsMethod;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.purchase.Product_Category;

/**
 * Servlet implementation class Purchase_fForm
 */
public class Purchase_fForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Purchase_fForm() {
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
		if(hid.equalsIgnoreCase("ptoduct_category")){
			String product_type=request.getParameter("product_type");
			String category=request.getParameter("category");
			String description=request.getParameter("description");
			Product_Category pc=new Product_Category();
			GenericsMethod<Product_Category> gpc=new GenericsMethod<Product_Category>();
			ArrayList<Product_Category> pc_lst=gpc.viewDate(pc);
			boolean check=true;
			for(int i=0;i<pc_lst.size();i++){
				if(pc_lst.get(i).getProduct_caegory().equalsIgnoreCase(category)){
					check=false;
					break;
				}
			}
			if(check){
			pc.setProduct_type_id(Integer.parseInt(product_type));
			pc.setProduct_caegory(category);
			pc.setDescription(description);
			pc.setCreated_by(user_id);
			GenericsMethod<Product_Category> g_obj=new GenericsMethod<Product_Category>();
			boolean flag=g_obj.insertData(pc);
			if(flag)
				System.out.println("Data Inserted");
			}
		}
	}

}
