package bean.purchase;

public class Item {
	private int item_id;
	private int product;
	private int product_type;
	private int product_category;
	private String item;
	private String description;
	private String active_flag;
	private int created_by;
	private int updated_by;
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getProduct() {
		return product;
	}
	public void setProduct(int product) {
		this.product = product;
	}
	public int getProduct_type() {
		return product_type;
	}
	public void setProduct_type(int product_type) {
		this.product_type = product_type;
	}
	public int getProduct_category() {
		return product_category;
	}
	public void setProduct_category(int product_category) {
		this.product_category = product_category;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	public int getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}

}
