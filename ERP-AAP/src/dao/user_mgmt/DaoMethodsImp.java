package dao.user_mgmt;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;



import bean.user_mgmt.AssignRight;
import bean.user_mgmt.City;
import bean.user_mgmt.Country;
import bean.user_mgmt.Privilege;
import bean.user_mgmt.Privilege_Comp;
import bean.user_mgmt.Role;
import bean.user_mgmt.State;
import bean.user_mgmt.UserMaster;
import hibernate_files.hibernateUtil;
import iFaces.user_mgmt.DaoMethods;

public class DaoMethodsImp implements DaoMethods{
	
	Session session=null;
	Transaction tx=null;
	
	public ArrayList<State> fetchState(int id) {
		ArrayList<State> list= new ArrayList<State>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from State where country_id="+id);
			list=(ArrayList<State>) q.list();
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
	public ArrayList<City> fetchCity(int id) {
		// TODO Auto-generated method stub
		ArrayList<City> list=new ArrayList<City>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from City where state_id="+id);
			list=(ArrayList<City>) q.list();
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
	public ArrayList<UserMaster> viewAllData(UserMaster m) {
		session=hibernateUtil.openSession();
		ArrayList<UserMaster> list=null;
		int u_id=m.getUser_id();
		session.beginTransaction();
		Query q=session.createQuery("from UserMaster where created_by="+u_id+" and acc_lock='0'");
		list=(ArrayList<UserMaster>) q.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public ArrayList<UserMaster> fetchUser(UserMaster u) {
		// TODO Auto-generated method stub
		ArrayList<UserMaster> list = new ArrayList<UserMaster>();
				try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from UserMaster where assign_rights='0' and role_type='"+u.getRole_type()+"' and created_by="+u.getCreated_by());
			list=(ArrayList<UserMaster>) q.list();
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
	public ArrayList<AssignRight> getPrivilege(UserMaster u) {
		// TODO Auto-generated method stub
		ArrayList<AssignRight> list= new ArrayList<AssignRight>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q =session.createQuery("from AssignRight where user_id="+u.getUser_id());
			list=(ArrayList<AssignRight>) q.list();
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
	public String getPrivilegeName(int p_id) {
		// TODO Auto-generated method stub
		String p_name=new String();
		ArrayList<Privilege> pr= new ArrayList<Privilege>();
		try{
				session=hibernateUtil.openSession();
				tx=session.beginTransaction();
				Query q = session.createQuery("from Privilege where privilege_id="+p_id);
				pr=(ArrayList<Privilege>) q.list();
				p_name=pr.get(0).getPrivilege_name().toString();
				tx.commit();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return p_name;
	}
	public String getComponent(int p_id) {
		// TODO Auto-generated method stub
		String co_name=new String();
		ArrayList<Privilege_Comp> list= new ArrayList<Privilege_Comp>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from Privilege_Comp where privilege_id="+p_id);
			list=(ArrayList<Privilege_Comp>) q.list();
			co_name=list.get(0).getComponent_names().toString();
			tx.commit();
			
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return co_name;
	}
	public ArrayList<UserMaster> viewAllData(int u_id) {
		// TODO Auto-generated method stub
		ArrayList<UserMaster> list= new ArrayList<UserMaster>();
		
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q = session.createQuery("from UserMaster where user_id="+u_id);
			list=(ArrayList<UserMaster>) q.list();
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
	public String getRole(int r_id) {
		// TODO Auto-generated method stub
		String role_name=new String();
		ArrayList<Role> list= new ArrayList<Role>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from Role where r_id="+r_id);
			list=(ArrayList<Role>) q.list();
			role_name=list.get(0).getRole();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
		ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return role_name;
	}
	public boolean deleteUser(int u_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q = session.createQuery("update UserMaster set acc_lock='1' where user_id="+u_id);
			int result=q.executeUpdate();
			if(result > 0)
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
	public String getCity(int c_id) {
		// TODO Auto-generated method stub
		String city=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from City where city_id="+c_id);
			ArrayList<City> lst=(ArrayList<City>) q.list();
			city=lst.get(0).getCity_name();
			
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return city;
	}
	public String getState(int s_id) {
		// TODO Auto-generated method stub
		String state=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from State where state_id="+s_id);
			ArrayList<State> lst=(ArrayList<State>) q.list();
			state=lst.get(0).getState_name();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return state;
	}
	public String getCountry(int c_id) {
		// TODO Auto-generated method stub
		String country=new String();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q= session.createQuery("from Country where id="+c_id);
			ArrayList<Country> lst=(ArrayList<Country>) q.list();
			country=lst.get(0).getC_name();
		}catch(Throwable ex){
			if(tx != null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return country;
	}
	public ArrayList<Privilege_Comp> getBindComp(int pr_id) {
		// TODO Auto-generated method stub
		ArrayList<Privilege_Comp> list=new ArrayList<Privilege_Comp>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from Privilege_Comp where privilege_id="+pr_id);
			list=(ArrayList<Privilege_Comp>) q.list();
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
	public ArrayList<UserMaster> LoginDetail(UserMaster u) {
		// TODO Auto-generated method stub
		ArrayList<UserMaster> list=new ArrayList<UserMaster>();
		try{
			session=hibernateUtil.openSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from UserMaster where login_id='"+u.getLogin_id()+"'or email='"+u.getLogin_id()+"' and password='"+u.getPassword()+"' and role_type='"+u.getRole_type()+"' and acc_lock='0'");
			list=(ArrayList<UserMaster>) q.list();
			tx.commit();
		}catch(Throwable ex){
			if(tx!=null)
				tx.rollback();
			ex.printStackTrace();
		}
		finally{session.close();}
		return list;
	}
	
	}