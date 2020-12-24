package model_beans;

public class Price_product_main {
	private String date;
	private int price;
	private int priceSales;
	public Price_product_main(String date, int price, int priceSales) {
		super();
		this.date = date;
		this.price = price;
		this.priceSales = priceSales;
	}
	public Price_product_main() {
		super();
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPriceSales() {
		return priceSales;
	}

	public void setPriceSales(int priceSales) {
		this.priceSales = priceSales;
	}
}
