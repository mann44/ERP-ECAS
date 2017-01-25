package dao.sales;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.sales.Categories;
import bean.sales.Company;
import bean.sales.Customer;
import bean.sales.Lead;
import bean.sales.Logged_Call;
import bean.sales.Meeting;
import bean.sales.Phone_Category;
import bean.sales.Priority;
import bean.sales.Scheduled_Call;
import bean.sales.Title;
import hibernate_files.hibernateUtil;
import iFaces.sales.SalesDao;

public class SalesDaoImp implements SalesDao{
	Session session=null;
	Transaction tx=null;

	public ArrayList<Title> checkTitle(Title t) {
		// TODO Auto-generated method stub
		ArrayList<Title> list= new ArrayList<Title>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from Title where title='"+t.getTitle()+"'");
			list=(ArrayList<Title>) q.list();
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	public ArrayList<Customer> viewCustomer(Customer c) {
		// TODO Auto-generated method stub
		ArrayList<Customer> list= new ArrayList<Customer>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from Customer where created_by="+c.getCreated_by());
			list=(ArrayList<Customer>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	public ArrayList<Customer> CustomerInfo(int id) {
		// TODO Auto-generated method stub
		ArrayList<Customer> lst= new ArrayList<Customer>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from Customer where cust_id="+id);
			lst=(ArrayList<Customer>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!= null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

	public String getTitle(int t_id) {
		// TODO Auto-generated method stub
		String title=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Title where title_id="+t_id);
			ArrayList<Title> lst=(ArrayList<Title>) q.list();
			if(!lst.isEmpty())
			title=lst.get(0).getTitle();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx !=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return title;
	}

	public ArrayList<Company> getCompany(int id) {
		// TODO Auto-generated method stub
		ArrayList<Company> list=new ArrayList<Company>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Company where company_id="+id);
			 list=(ArrayList<Company>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx !=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return list;
	}

	public ArrayList<Lead> viewLeads(Lead l) {
		// TODO Auto-generated method stub
		ArrayList<Lead> lst=new ArrayList<Lead>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Lead where created_by="+l.getCreated_by());
			lst=(ArrayList<Lead>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

	public ArrayList<Scheduled_Call> viewScheduleCalls(Scheduled_Call sc) {
		// TODO Auto-generated method stub
		ArrayList<Scheduled_Call> lst= new ArrayList<Scheduled_Call>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from Scheduled_Call where created_by="+sc.getCreated_by());
			lst=(ArrayList<Scheduled_Call>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

	public ArrayList<Scheduled_Call> viewScheduleDetail(int sc_id) {
		// TODO Auto-generated method stub
		ArrayList<Scheduled_Call> lst= new ArrayList<Scheduled_Call>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Scheduled_Call where schedule_id="+sc_id);
			lst=(ArrayList<Scheduled_Call>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

	public String getPhoneCategoty(int cat_id) {
		// TODO Auto-generated method stub
		String category=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Phone_Category where category_id="+cat_id);
			ArrayList<Phone_Category> lst=(ArrayList<Phone_Category>) q.list();
			category=lst.get(0).getCategory_name();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return category;
	}

	public String getPriority(int p_id) {
		// TODO Auto-generated method stub
		String priority=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Priority where priority_id="+p_id);
			ArrayList<Priority> lst=(ArrayList<Priority>) q.list();
			priority=lst.get(0).getPriority();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return priority;
	}

	public ArrayList<Logged_Call> viewLoggedCall(Logged_Call l) {
		// TODO Auto-generated method stub
		ArrayList<Logged_Call> lst=new ArrayList<Logged_Call>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q = session.createQuery("from Logged_Call where created_by="+l.getCreated_by());
			lst=(ArrayList<Logged_Call>) q.list();
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

	public ArrayList<Lead> LeadInfo(int l_id) {
		// TODO Auto-generated method stub
		ArrayList<Lead> lst=new ArrayList<Lead>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q = session.createQuery("from Lead where lead_id="+l_id);
			lst=(ArrayList<Lead>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

	public String getCategory(int c_id) {
		// TODO Auto-generated method stub
		String category=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Categories where category_id="+c_id);
			ArrayList<Categories> lst=(ArrayList<Categories>) q.list();
			category=lst.get(0).getCategory();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return category;
	}

	public ArrayList<Logged_Call> viewDetailLoggedcall(int l_id) {
		// TODO Auto-generated method stub
		ArrayList<Logged_Call> list=new ArrayList<Logged_Call>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Logged_Call where logged_id="+l_id);
			list=(ArrayList<Logged_Call>) q.list();
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

	public ArrayList<Meeting> viewMeetings(Meeting mt) {
		// TODO Auto-generated method stub
		ArrayList<Meeting> list=new ArrayList<Meeting>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Meeting where created_by="+mt.getCreated_by());
			list=(ArrayList<Meeting>) q.list();
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

	public ArrayList<Meeting> MeetingInfo(int m_id) {
		// TODO Auto-generated method stub
		ArrayList<Meeting> lst=new ArrayList<Meeting>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Meeting where meeting_id="+m_id);
			lst=(ArrayList<Meeting>) q.list();
			tx.commit();
			
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return lst;
	}

}
