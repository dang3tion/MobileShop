package model_beans;

import java.util.ArrayList;

public class Product {
	private String id;
	private String name;
	private int price;
	private int salePrice;
	private String thumbnail;
	private String content;
	private int quantityInCart;
	private String idConfig;




	public Product() {
	}

	public Product(String id, String thumbnail, String name,String content, int price, int priceSale,String idConfig) {
		this.thumbnail = thumbnail;
		this.id = id;
		this.name = name;
		this.content = content;
		this.price = price;
		this.salePrice = priceSale;
		this.idConfig = idConfig;
	}

	
	public Product(String id, String thumbnail, String name,String content, int price, int priceSale) {
		this.thumbnail = thumbnail;
		this.id = id;
		this.name = name;
		this.content = content;
		this.price = price;
		this.salePrice = priceSale;
	}

	public int getQuantityInCart() {
		return quantityInCart;
	}

	public void setQuantityInCart(int quantityInCart) {
		this.quantityInCart = quantityInCart;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getIdConfig() {
		return idConfig;
	}

	public void setIdConfig(String idConfig) {
		this.idConfig = idConfig;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", salePrice=" + salePrice + ", thumbnail="
				+ thumbnail + "]\n";
	}

}
