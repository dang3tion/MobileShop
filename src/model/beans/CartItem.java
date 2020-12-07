package model.beans;

public class CartItem {
	private String productID;
	private int quantity;

	public CartItem(String productID, int quantity) {
		this.productID = productID;
		this.quantity = quantity;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartItem [productID=" + productID + ", quantity=" + quantity + "]\n";
	}

}
