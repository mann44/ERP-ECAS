package bean.user_mgmt;

public class Privilege {
	private int privilege_id;
	private String privilege_name;
	private String privilege_desc;
	private int created_by;
	public int getPrivilege_id() {
		return privilege_id;
	}
	public void setPrivilege_id(int privilege_id) {
		this.privilege_id = privilege_id;
	}
	public String getPrivilege_name() {
		return privilege_name;
	}
	public void setPrivilege_name(String privilege_name) {
		this.privilege_name = privilege_name;
	}
	public String getPrivilege_desc() {
		return privilege_desc;
	}
	public void setPrivilege_desc(String privilege_desc) {
		this.privilege_desc = privilege_desc;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
}
