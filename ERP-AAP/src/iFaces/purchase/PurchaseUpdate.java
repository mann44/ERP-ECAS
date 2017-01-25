package iFaces.purchase;

import bean.purchase.Item;
import bean.purchase.Product;
import bean.purchase.Supplier;

public interface PurchaseUpdate {
	public boolean updateProduct(Product pr);
	public boolean updateSupplier(Supplier s);
	public boolean updateItem(Item i);

}
