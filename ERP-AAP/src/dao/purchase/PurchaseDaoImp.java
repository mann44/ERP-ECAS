package dao.purchase;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.purchase.Item;
import bean.purchase.Item_Size;
import bean.purchase.P_Quotation;
import bean.purchase.Product;
import bean.purchase.Product_Category;
import bean.purchase.Product_type;
import bean.purchase.Quotation_Detail;
import bean.purchase.Supplier;
import bean.purchase.Supplier_Company;
import hibernate_files.hibernateUtil;
import iFaces.purchase.PurchaseDao;

public class PurchaseDaoImp implements PurchaseDao{

	Session session=null;
	Transaction tx=null;
	public ArrayList<Product_Category> getProductCategory(int pc_id) {
		// TODO Auto-generated method stub
		ArrayList<Product_Category> list=new ArrayList<Product_Category>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Product_Category where pc_id="+pc_id);
			list=(ArrayList<Product_Category>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		
		return list;
	}
	public String getProductType(int t_id) {
		// TODO Auto-generated method stub
		String ptype=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Product_type where type_id="+t_id);
			ArrayList<Product_type> lst=(ArrayList<Product_type>) q.list();
			ptype=lst.get(0).getType();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return ptype;
	}
	public ArrayList<Product> productInfo(int p_id) {
		// TODO Auto-generated method stub
		ArrayList<Product> list=new ArrayList<Product>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Product where product_id='"+p_id+"' and active_flag='1'");
			list=(ArrayList<Product>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public boolean checkProduct(Product pr) {
		// TODO Auto-generated method stub
		boolean flag=true;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Product where product_category='"+pr.getProduct_category()+"' and product='"+pr.getProduct()+"'");
			ArrayList<Product> list=(ArrayList<Product>) q.list();
			if(!list.isEmpty())
				flag=false;
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}
	public ArrayList<Item> stockableItem() {
		// TODO Auto-generated method stub
		ArrayList<Item> list=new ArrayList<Item>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item where product_type=1");
			list=(ArrayList<Item>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public boolean checkSize(Item_Size i) {
		// TODO Auto-generated method stub
		boolean flag=true;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item_Size where item='"+i.getItem()+"' and size='"+i.getSize()+"'");
			ArrayList<Item_Size> lst=(ArrayList<Item_Size>) q.list();
			System.out.println("dao"+lst.isEmpty());
			if(!lst.isEmpty())
				flag=false;
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}
	public ArrayList<Supplier> viewSupplier(Supplier s) {
		// TODO Auto-generated method stub
		ArrayList<Supplier> list=new ArrayList<Supplier>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Supplier where created_by="+s.getCreated_by());
			list=(ArrayList<Supplier>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public ArrayList<Supplier> supplierInfo(int s_id) {
		// TODO Auto-generated method stub
		ArrayList<Supplier> list=new ArrayList<Supplier>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Supplier where supplier_id="+s_id);
			list=(ArrayList<Supplier>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public ArrayList<Supplier_Company> companyDetail(int c_id) {
		// TODO Auto-generated method stub
		ArrayList<Supplier_Company> list=new ArrayList<Supplier_Company>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Supplier_Company where company_id="+c_id);
			list=(ArrayList<Supplier_Company>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public ArrayList<Item> itemDetail(int i_id) {
		// TODO Auto-generated method stub
		ArrayList<Item> list=new ArrayList<Item>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item where item_id="+i_id);
			list=(ArrayList<Item>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public ArrayList<Item_Size> getItemSize(int i_id) {
		// TODO Auto-generated method stub
		ArrayList<Item_Size> list=new ArrayList<Item_Size>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item_Size where item="+i_id);
			list=(ArrayList<Item_Size>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public ArrayList<Item> getItem(int p_id) {
		// TODO Auto-generated method stub
		ArrayList<Item> list=new ArrayList<Item>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Item where product="+p_id);
			list=(ArrayList<Item>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	public int nextInc() {
		// TODO Auto-generated method stub
		int id=0;
		String res=null;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			SQLQuery query=session.createSQLQuery("SELECT TABLE_ROWS+1 FROM information_schema.tables WHERE table_name='purchase_quotation' AND table_schema = DATABASE()");
			query.addScalar("TABLE_ROWS+1", Hibernate.STRING);
			List<String> lst=query.list();
			id=Integer.parseInt(lst.get(0));
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return id;
	}
	public ArrayList<Quotation_Detail> view_QDetail_byQ_id(int id) {
		// TODO Auto-generated method stub
		ArrayList<Quotation_Detail> list=new ArrayList<Quotation_Detail>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Quotation_Detail where quotation_id="+id);
			list=(ArrayList<Quotation_Detail>) q.list();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}
	
}
