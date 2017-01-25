package dao.sales;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.sales.Customer;
import bean.sales.Lead;
import bean.sales.Logged_Call;
import bean.sales.Meeting;
import bean.sales.Scheduled_Call;

import hibernate_files.hibernateUtil;
import iFaces.sales.SalesUpdate;

public class SalesUpdateImp implements SalesUpdate{
	Session session=null;
	Transaction tx=null;

	public boolean updateCustomer(Customer cu) {
		// TODO Auto-generated method stub
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("update Customer set cust_name='"+cu.getCust_name()+"',description='"+cu.getDescription()+"',email_id='"+cu.getEmail_id()+"',company_id='"+cu.getCompany_id()+"',phone_no='"+cu.getPhone_no()+"',mobile_no1='"+cu.getMobile_no1()+"',mobile_no2='"+cu.getMobile_no2()+"',website='"+cu.getWebsite()+"',address='"+cu.getAddress()+"',country='"+cu.getCountry()+"',state='"+cu.getState()+"',city='"+cu.getCity()+"',job_position='"+cu.getJob_position()+"',title='"+cu.getTitle()+"',fax='"+cu.getFax()+"',updated_by='"+cu.getUpdated_by()+"' where cust_id="+cu.getCust_id());
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}

	public boolean updateScheduledCall(Scheduled_Call sc) {
		// TODO Auto-generated method stub
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Scheduled_Call set summary='"+sc.getSummary()+"',date='"+sc.getDate()+"',contact='"+sc.getContact()+"',responsible='"+sc.getResponsible()+"',category='"+sc.getCategory()+"',priority='"+sc.getPriority()+"',phone_no='"+sc.getPhone_no()+"',mobile_no1='"+sc.getMobile_no1()+"',mobile_no2='"+sc.getMobile_no2()+"',description='"+sc.getDescription()+"',updated_by='"+sc.getUpdated_by()+"',status='"+sc.getStatus()+"' where schedule_id="+sc.getSchedule_id());
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}

	

	public boolean updateLead(Lead l) {
		// TODO Auto-generated method stub
		boolean flg=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q =session.createQuery("update Lead set subject='"+l.getSubject()+"',lead_dt='"+l.getLead_dt()+"',customer_id='"+l.getCustomer_id()+"',contact_name='"+l.getContact_name()+"',title='"+l.getTitle()+"',category='"+l.getCategory()+"',priority='"+l.getPriority()+"',address='"+l.getAddress()+"',email='"+l.getEmail()+"',fax='"+l.getFax()+"',phone_no='"+l.getPhone_no()+"',mobile_no1='"+l.getMobile_no1()+"',mobile_no2='"+l.getMobile_no2()+"',description='"+l.getDescription()+"',updated_by='"+l.getUpdated_by()+"',stage='"+l.getStage()+"' where lead_id="+l.getLead_id());
			int i=q.executeUpdate();
			if(i>0)
				flg=true;
			tx.commit();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return flg;
	}

	public boolean updateLoggedCall(Logged_Call l) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Logged_Call set summary='"+l.getSummary()+"',date='"+l.getDate()+"',contact='"+l.getContact()+"',responsible='"+l.getResponsible()+"' where logged_id="+l.getLogged_id());
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

	public boolean updateMeeting(Meeting m) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update Meeting set subject='"+m.getSubject()+"',date='"+m.getDate()+"',duration='"+m.getDuration()+"',attendies='"+m.getAttendies()+"',responsible='"+m.getResponsible()+"',location='"+m.getLocation()+"',description='"+m.getDescription()+"',updated_by='"+m.getUpdated_by()+"',attendees_names='"+m.getAttendees_names()+"' where meeting_id="+m.getMeeting_id());
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
