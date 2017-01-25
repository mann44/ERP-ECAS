package iFaces.user_mgmt;


import bean.user_mgmt.Privilege_Comp;
import bean.user_mgmt.UserMaster;

public interface UpdateData {
	public boolean updateUser(UserMaster mst);
	public boolean blockUnblock(UserMaster mst);
	public boolean updateIdFname(UserMaster mst);
	public boolean updateComponentBind(Privilege_Comp pc);
	public boolean updateRights(UserMaster u);
}
