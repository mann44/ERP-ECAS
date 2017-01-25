package dao.sales;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate_files.hibernateUtil;
import iFaces.sales.SalesDelete;

public class SalesDeleteImp implements SalesDelete{

	Session session=null;
	Transaction tx=null;
	public boolean deleteLead(int d_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("delete from Lead where lead_id="+d_id);
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
	
	public boolean DeleteScheduleCall(int d_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("delete from Scheduled_Call where schedule_id="+d_id);
			int i=q.executeUpdate();
			if(i>0)
				flag=true;
			tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flag;
	}

	public boolean deleteLoggedCall(int d_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("delete from Logged_Call where logged_id="+d_id);
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

	public boolean deleteMeeting(int m_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("delete from Meeting where meeting_id="+m_id);
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

	public boolean deleteCustomer(int c_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("delete from Customer where cust_id="+c_id);
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

}
