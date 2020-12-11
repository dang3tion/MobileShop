package model_beans;

import java.util.ArrayList;

public class Product {
	private String id;
	private String name;
	private int price;
	private int salePrice;
	private String thumbnail;

	private ArrayList<Picture_product> listPicture = new ArrayList<Picture_product>();
	private ArrayList<Color_product> listColor = new ArrayList<Color_product>();
	private ArrayList<Configuration> listConfig = new ArrayList<Configuration>();
	private ArrayList<Evaluate_product> listEvaluate = new ArrayList<Evaluate_product>();
	private String content;






	public Product(String id, String name, int price, int salePrice, String thumbnail,
			ArrayList<Picture_product> listPicture, ArrayList<Color_product> listColor,
			ArrayList<Configuration> listConfig, ArrayList<Evaluate_product> listEvaluate, String content) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.salePrice = salePrice;
		this.thumbnail = thumbnail;
		this.listPicture = listPicture;
		this.listColor = listColor;
		this.listConfig = listConfig;
		this.listEvaluate = listEvaluate;
		this.content = content;
	}

	public Product() {
	}

	public Product(String id, String thumbnail, String name, int price, int priceSale) {
		this.thumbnail = thumbnail;
		this.id = id;
		this.name = name;
		this.price = price;
		this.salePrice = priceSale;
	}


	

	

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public ArrayList<Picture_product> getListPicture() {
		return listPicture;
	}

	public void setListPicture(ArrayList<Picture_product> listPicture) {
		this.listPicture = listPicture;
	}

	public ArrayList<Color_product> getListColor() {
		return listColor;
	}

	public void setListColor(ArrayList<Color_product> listColor) {
		this.listColor = listColor;
	}

	public ArrayList<Configuration> getListConfig() {
		return listConfig;
	}

	public void setListConfig(ArrayList<Configuration> listConfig) {
		this.listConfig = listConfig;
	}

	public ArrayList<Evaluate_product> getListEvaluate() {
		return listEvaluate;
	}

	public void setListEvaluate(ArrayList<Evaluate_product> listEvaluate) {
		this.listEvaluate = listEvaluate;
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
