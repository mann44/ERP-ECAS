package bean.purchase;

public class Product_Category {
	private int pc_id;
	private int product_type_id;
	private String product_caegory;
	private String description;
	private int created_by;
	public int getPc_id() {
		return pc_id;
	}
	public void setPc_id(int pc_id) {
		this.pc_id = pc_id;
	}
	public int getProduct_type_id() {
		return product_type_id;
	}
	public void setProduct_type_id(int product_type_id) {
		this.product_type_id = product_type_id;
	}
	public String getProduct_caegory() {
		return product_caegory;
	}
	public void setProduct_caegory(String product_caegory) {
		this.product_caegory = product_caegory;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

}
