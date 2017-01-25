package iFaces.purchase;

import java.util.ArrayList;

import bean.purchase.Item;
import bean.purchase.Item_Size;
import bean.purchase.Product;
import bean.purchase.Product_Category;
import bean.purchase.Quotation_Detail;
import bean.purchase.Supplier;
import bean.purchase.Supplier_Company;

public interface PurchaseDao {
	public ArrayList<Product_Category> getProductCategory(int pc_id);
	public String getProductType(int t_id);
	public ArrayList<Product> productInfo(int p_id);
	public boolean checkProduct(Product pr);
	public ArrayList<Item> stockableItem();
	public boolean checkSize(Item_Size i);
	public ArrayList<Supplier> viewSupplier(Supplier s);
	public ArrayList<Supplier> supplierInfo(int s_id);
	public ArrayList<Supplier_Company> companyDetail(int c_id);
	public ArrayList<Item> itemDetail(int i_id);
	public ArrayList<Item_Size> getItemSize(int i_id);
	public ArrayList<Item> getItem(int p_id);
	public int nextInc();
	public ArrayList<Quotation_Detail> view_QDetail_byQ_id(int id);

}
