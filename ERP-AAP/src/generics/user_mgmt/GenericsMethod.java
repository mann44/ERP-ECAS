package generics.user_mgmt;

import java.util.ArrayList;

import hibernate_files.hibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class GenericsMethod<E> {
	Session session=null;
	Transaction tx=null;
	boolean flag=false;
	
	public boolean insertData(E e)
	{
		try{
		session=hibernateUtil.openSession();
		tx=session.beginTransaction();
		int i=(Integer) session.save(e);
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
	
	public ArrayList<E> viewDate(E e){
		ArrayList<E> lst=new ArrayList<E>();
		try{
		session=hibernateUtil.openSession();
		tx=session.beginTransaction();
		String classname=e.getClass().getName();
		Query q=session.createQuery("from "+classname.substring(classname.lastIndexOf(".")+1));
		lst=(ArrayList<E>) q.list();
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
	
	

}
