package model.beans;

public class Product {
	private String id;
	private String name;
	private int price;
	private String imgSrc;

	public Product(String id, String name, int price, String imgSrc) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.imgSrc = imgSrc;
	}

	public Product() {
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getPrice() {
		return price;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", imgSrc=" + imgSrc + "]\n";
	}

	
}
