package model_beans;


public class Product_form {
	private String URL;
	private String id;
	private String name;
	private String img;
	private int price;
	private int priceSales;
	private double avgEvaluate;
	private String color;
	private String colorID;
	private String nameBranch;
	// KHÔNG ĐƯỢC XÓA THUỘC TÍNH NÀY
	private int quantityInCart;

	public int getQuantityInCart() {
		return quantityInCart;
	}

	public void setQuantityInCart(int quantityInCart) {
		this.quantityInCart = quantityInCart;
	}

	public Product_form(String id, String name, String img, int price, int priceSales, double avgEvaluate, String color,
			String colorID, String nameBranch) {
		this.id = id;
		this.name = name;
		this.img = img;
		this.price = price;
		this.priceSales = priceSales;
		this.avgEvaluate = avgEvaluate;
		this.color = color;
		this.colorID = colorID;
		this.nameBranch = nameBranch;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String URL) {
		this.URL = URL;
	}

	public String getColorID() {
		return colorID;
	}

	public void setColorID(String colorID) {
		this.colorID = colorID;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getNameBranch() {
		return nameBranch;
	}

	public void setNameBranch(String nameBranch) {
		this.nameBranch = nameBranch;
	}

	public Product_form() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getAvgEvaluate() {
		return avgEvaluate;
	}

	public void setAvgEvaluate(double avgEvaluate) {
		this.avgEvaluate = avgEvaluate;
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

	public int getModStart() {
		if (getCheckStart()) {
			return 5 - (getStartIntact() + 1);
		} else {
			return 5 - getStartIntact();
		}
	}

	public double duStart() {
		return avgEvaluate % 1;
	}

	public boolean getCheckStart() {
		if (duStart() < 0.4) {
			return false;
		} else {
			return true;
		}
	}

	public int getStartIntact() {
		int start = (int) (avgEvaluate - duStart());
		return start;
	}

	@Override
	public String toString() {
		return "Product_form [URL=" + URL + ", id=" + id + ", name=" + name + ", img=" + img + ", price=" + price
				+ ", priceSales=" + priceSales + ", avgEvaluate=" + avgEvaluate + ", color=" + color + ", colorID="
				+ colorID + ", nameBranch=" + nameBranch + "quantity cart" + quantityInCart+ " ]\n";
	}
}
