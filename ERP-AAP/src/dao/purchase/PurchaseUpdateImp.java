package dao.purchase;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.purchase.Item;
import bean.purchase.Product;
import bean.purchase.Supplier;
import hibernate_files.hibernateUtil;
import iFaces.purchase.PurchaseUpdate;

public class PurchaseUpdateImp implements PurchaseUpdate{
	Session session=null;
	Transaction tx=null;
	public boolean updateProduct(Product pr) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Product set product_category='"+pr.getProduct_category()+"',product='"+pr.getProduct()+"',description='"+pr.getDescription()+"',updated_by='"+pr.getUpdated_by()+"' where product_id="+pr.getProduct_id());
			int i=q.executeUpdate();
			if(i>0)
				flag=true;
			tx.commit();
			
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
	public boolean updateSupplier(Supplier s) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Supplier set supplier_name='"+s.getSupplier_name()+"',description='"+s.getDescription()+"',email_id='"+s.getEmail_id()+"',company_id='"+s.getCompany_id()+"',phone_no='"+s.getPhone_no()+"',mobile_no1='"+s.getMobile_no1()+"',mobile_no2='"+s.getMobile_no2()+"',website='"+s.getWebsite()+"',address='"+s.getAddress()+"',country='"+s.getCountry()+"',state='"+s.getState()+"',city='"+s.getCity()+"',job_position='"+s.getJob_position()+"',title='"+s.getTitle()+"',fax='"+s.getFax()+"',updated_by='"+s.getUpdated_by()+"' where supplier_id="+s.getSupplier_id());
			int i=q.executeUpdate();
			if(i>0)
				flag=true;
			tx.commit();
			
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
	public boolean updateItem(Item i) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Item set product='"+i.getProduct()+"',item='"+i.getItem()+"',description='"+i.getDescription()+"',updated_by='"+i.getUpdated_by()+"' where item_id="+i.getItem_id());
			int j=q.executeUpdate();
			if(j>0)
				flag=true;
			tx.commit();
			
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

}
