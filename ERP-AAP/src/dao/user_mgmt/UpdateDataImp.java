package dao.user_mgmt;
import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.user_mgmt.Privilege_Comp;
import bean.user_mgmt.UserMaster;
import hibernate_files.hibernateUtil;
import iFaces.user_mgmt.UpdateData;;

public class UpdateDataImp implements UpdateData{
	Session session=null;
	Transaction tx=null;

	public boolean updateUser(UserMaster u_mst) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("update UserMaster set login_id='"+u_mst.getLogin_id()+"',full_name='"+u_mst.getFull_name()+"',role_type='"+u_mst.getRole_type()+"',gender='"+u_mst.getGender()+"',birth_dt='"+u_mst.getBirth_dt()+"',email='"+u_mst.getEmail()+"',address='"+u_mst.getAddress()+"',country='"+u_mst.getCountry()+"',state='"+u_mst.getState()+"',city='"+u_mst.getCity()+"',contact_no='"+u_mst.getContact_no()+"',internal_note='"+u_mst.getInternal_note()+"',updated_by='"+u_mst.getUpdated_by()+"' where user_id="+u_mst.getUser_id());
			int i=q.executeUpdate();
			if(i>0){
				flag=true;
			}
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

	public boolean blockUnblock(UserMaster mst) {
		// TODO Auto-generated method stub
		boolean flag=false;
		DaoMethodsImp d_obj= new DaoMethodsImp();
		ArrayList<UserMaster> lst=d_obj.viewAllData(mst.getUser_id());
		String status=lst.get(0).getActive_flag();
		String modify;
		if(status.equals("0"))
			modify="1";
		else
			modify="0";
		
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update UserMaster set active_flag='"+modify+"' where user_id="+mst.getUser_id());
			int flg=q.executeUpdate();
			if(flg>0)
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

	public boolean updateIdFname(UserMaster mst) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("update UserMaster set full_name='"+mst.getFull_name()+"',login_id='"+mst.getLogin_id()+"' where user_id="+mst.getUser_id());
			int i=q.executeUpdate();
			if(i>0){
				flag=true;
			}
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

	public boolean updateComponentBind(Privilege_Comp pc) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			String get=pc.getComponent_names();
			Query q=session.createQuery("update Privilege_Comp set component_names='"+pc.getComponent_names()+"' where privilege_id="+pc.getPrivilege_id());
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

	public boolean updateRights(UserMaster u) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("update UserMaster set assign_rights='1' where user_id="+u.getUser_id());
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

}
