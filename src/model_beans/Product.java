package model_beans;

import java.util.ArrayList;

public class Product {
	private String id;
	private String name;
	private double price;
	private double priceSale;
	private String thumbnail;

	private ArrayList<Picture_product> listPicture = new ArrayList<Picture_product>();
	private ArrayList<Color_product> listColor = new ArrayList<Color_product>();
	private ArrayList<Configuration> listConfig = new ArrayList<Configuration>();
	private ArrayList<Evaluate_product> listEvaluate = new ArrayList<Evaluate_product>();
	private String contentProduct;

	public Product(String idProduct, String nameProduct, double price, double priceSale, String thumbnail,
			ArrayList<Picture_product> listPicture, ArrayList<Color_product> listColor,
			ArrayList<Configuration> listConfi, ArrayList<Evaluate_product> listEvaluate, String contentProduct) {
		this.id = idProduct;
		this.name = nameProduct;
		this.price = price;
		this.priceSale = priceSale;
		this.listPicture = listPicture;
		this.listColor = listColor;
		this.listConfig = listConfi;
		this.listEvaluate = listEvaluate;
		this.contentProduct = contentProduct;
	}

	public Product() {
	}

	public Product(String idProduct, String thumbnail, String nameProduct, double price, double priceSale) {
		this.thumbnail = thumbnail;
		this.id = idProduct;
		this.name = nameProduct;
		this.price = price;
		this.priceSale = priceSale;
	}

	public String getIdProduct() {
		return id;
	}

	public void setIdProduct(String idProduct) {
		this.id = idProduct;
	}

	public String getNameProduct() {
		return name;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public void setNameProduct(String nameProduct) {
		this.name = nameProduct;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(double priceSale) {
		this.priceSale = priceSale;
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

	public ArrayList<Configuration> getListConfi() {
		return listConfig;
	}

	public void setListConfi(ArrayList<Configuration> listConfi) {
		this.listConfig = listConfi;
	}

	public ArrayList<Evaluate_product> getListEvaluate() {
		return listEvaluate;
	}

	public void setListEvaluate(ArrayList<Evaluate_product> listEvaluate) {
		this.listEvaluate = listEvaluate;
	}

	public String getContentProduct() {
		return contentProduct;
	}

	public void setContentProduct(String contentProduct) {
		this.contentProduct = contentProduct;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", priceSale="
				+ priceSale + ", listPicture=" + listPicture + ", listColor=" + listColor + ", listConfig=" + listConfig
				+ ", listEvaluate=" + listEvaluate + ", contentProduct=" + contentProduct + "]\n";
	}

}
