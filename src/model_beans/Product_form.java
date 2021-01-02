package model_beans;

public class Product_form {
	private String name;
	private String img;
	private int price;
	private int priceSales;

	public Product_form(String name, String img, int price, int priceSales) {
		super();
		this.name = name;
		this.img = img;
		this.price = price;
		this.priceSales = priceSales;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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
