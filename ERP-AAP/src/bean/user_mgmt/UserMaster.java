package bean.user_mgmt;

public class UserMaster {
	private int user_id;
	private String login_id;
	private String password;
	private String full_name;
	private int role_type;
	private int created_by;
	private String gender;
	private String birth_dt;
	private String email;
	private String address;
	private int country;
	private int state;
	private int city;
	private String contact_no;
	private String internal_note;
	private String acc_lock;
	private String active_flag;
	private String assign_rights;
	private int updated_by;
	
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	public String getAcc_lock() {
		return acc_lock;
	}
	public void setAcc_lock(String acc_lock) {
		this.acc_lock = acc_lock;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public int getRole_type() {
		return role_type;
	}
	public void setRole_type(int role_type) {
		this.role_type = role_type;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth_dt() {
		return birth_dt;
	}
	public void setBirth_dt(String birth_dt) {
		this.birth_dt = birth_dt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCountry() {
		return country;
	}
	public void setCountry(int country) {
		this.country = country;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getCity() {
		return city;
	}
	public void setCity(int city) {
		this.city = city;
	}
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getInternal_note() {
		return internal_note;
	}
	public void setInternal_note(String internal_note) {
		this.internal_note = internal_note;
	}
	public String getAssign_rights() {
		return assign_rights;
	}
	public void setAssign_rights(String assign_rights) {
		this.assign_rights = assign_rights;
	}
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}
	

}
