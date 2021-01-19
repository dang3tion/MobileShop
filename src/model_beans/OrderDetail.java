package model_beans;

public class OrderDetail {
	private String orderID;
	private String productID;
	private String colorID;
	private int quantity;

	public OrderDetail() {

	}

	public OrderDetail(String orderID, String productID, String colorID, int quantity) {
		this.orderID = orderID;
		this.productID = productID;
		this.colorID = colorID;
		this.quantity = quantity;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getColorID() {
		return colorID;
	}

	public void setColorID(String colorID) {
		this.colorID = colorID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderID=" + orderID + ", productID=" + productID + ", colorID=" + colorID + ", quantity="
				+ quantity + "]\n";
	}

}
