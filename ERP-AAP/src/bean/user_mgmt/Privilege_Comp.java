package bean.user_mgmt;

public class Privilege_Comp {

	private int privilege_comp_id;
	private int privilege_id;
	private String component_names;
	private int created_by;
	public int getPrivilege_comp_id() {
		return privilege_comp_id;
	}
	public void setPrivilege_comp_id(int privilege_comp_id) {
		this.privilege_comp_id = privilege_comp_id;
	}
	public int getPrivilege_id() {
		return privilege_id;
	}
	public void setPrivilege_id(int privilege_id) {
		this.privilege_id = privilege_id;
	}
	public String getComponent_names() {
		return component_names;
	}
	public void setComponent_names(String component_names) {
		this.component_names = component_names;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
}
