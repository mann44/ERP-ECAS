package iFaces.user_mgmt;

import java.util.ArrayList;

import bean.user_mgmt.AssignRight;
import bean.user_mgmt.City;
import bean.user_mgmt.Privilege_Comp;
import bean.user_mgmt.Role;
import bean.user_mgmt.State;
import bean.user_mgmt.UserMaster;

public interface DaoMethods {
	public ArrayList<State> fetchState(int id);
	public ArrayList<City> fetchCity(int id);
	public ArrayList<UserMaster> viewAllData(UserMaster m);
	public ArrayList<UserMaster> fetchUser(UserMaster u);
	public ArrayList<AssignRight> getPrivilege(UserMaster u);
	public String getPrivilegeName(int p_id);
	public String getComponent(int p_id);
	public ArrayList<UserMaster> viewAllData(int u_id);
	public String getRole(int r_id);
	public boolean deleteUser(int u_id);
	public String getCity(int c_id);
	public String getState(int s_id);
	public String getCountry(int c_id);
	public ArrayList<Privilege_Comp> getBindComp(int pr_id);
	public ArrayList<UserMaster> LoginDetail(UserMaster u);
}
