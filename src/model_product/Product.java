package model_product;

import java.util.ArrayList;

public class Product {
	private String idProduct;
	private String nameProduct;
	private double price;
	private double priceSale;
	private ArrayList<Picture_product> listPicture = new ArrayList<Picture_product>();
	private ArrayList<Color_product> listColor = new ArrayList<Color_product>();
	private ArrayList<Configuration> listConfi = new ArrayList<Configuration>();
	private ArrayList<Evaluate_product> listEvaluate = new ArrayList<Evaluate_product>();
	private String contentProduct;
	public Product(String idProduct, String nameProduct, double price, double priceSale,
			ArrayList<Picture_product> listPicture, ArrayList<Color_product> listColor,
			ArrayList<Configuration> listConfi, ArrayList<Evaluate_product> listEvaluate, String contentProduct) {
		super();
		this.idProduct = idProduct;
		this.nameProduct = nameProduct;
		this.price = price;
		this.priceSale = priceSale;
		this.listPicture = listPicture;
		this.listColor = listColor;
		this.listConfi = listConfi;
		this.listEvaluate = listEvaluate;
		this.contentProduct = contentProduct;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}
	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
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
		return listConfi;
	}
	public void setListConfi(ArrayList<Configuration> listConfi) {
		this.listConfi = listConfi;
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
		return "Product [idProduct=" + idProduct + ", nameProduct=" + nameProduct + ", price=" + price + ", priceSale="
				+ priceSale + ", listPicture=" + listPicture + ", listColor=" + listColor + ", listConfi=" + listConfi
				+ ", listEvaluate=" + listEvaluate + ", contentProduct=" + contentProduct + "]";
	}
	
	
	
	
}
