package bean.sales;

public class Logged_Call {
	private int logged_id;
	private String summary;
	private String date;
	private int contact;
	private int responsible;
	private int created_by;
	public int getLogged_id() {
		return logged_id;
	}
	public void setLogged_id(int logged_id) {
		this.logged_id = logged_id;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
	public int getResponsible() {
		return responsible;
	}
	public void setResponsible(int responsible) {
		this.responsible = responsible;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

}
