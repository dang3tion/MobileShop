package model_beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model_DAO.DAO_ListProduct;

public class Product_main {
	private String ID;
	private String name;
	private String type;
	private Branch branch;
	private String status;
	private String update_date;
	private String posts;

	private int view;
	private Price_product_main prices;
	private ArrayList<Attribute> attributes = new ArrayList<Attribute>();
	private ArrayList<Color_main> colors = new ArrayList<Color_main>();
	private StarEvaluate evaluate;

	public Product_main(String iD, String name, String type, Branch branch, String status, String update_date,
			String posts, int quantity, int sale_quantity, int view, Price_product_main prices,
			ArrayList<Attribute> attributes, ArrayList<Color_main> colors, StarEvaluate evaluate) {
		super();
		ID = iD;
		this.name = name;
		this.type = type;
		this.branch = branch;
		this.status = status;
		this.update_date = update_date;
		this.posts = posts;
		this.view = view;
		this.prices = prices;
		this.attributes = attributes;
		this.colors = colors;
		this.evaluate = evaluate;
	}

	public int getQuantity() {
		int result = 0;
		for (Color_main co : colors) {
			result += co.getQuantity();
		}
		return result;
	}

	public StarEvaluate getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(StarEvaluate evaluate) {
		this.evaluate = evaluate;
	}

	public Price_product_main getPrices() {
		return prices;
	}

	public void setPrices(Price_product_main prices) {
		this.prices = prices;
	}

	public Product_main() {
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getPosts() {
		return posts;
	}

	public void setPosts(String posts) {
		this.posts = posts;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public ArrayList<Attribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(ArrayList<Attribute> attributes) {
		this.attributes = attributes;
	}

	public ArrayList<Color_main> getColors() {
		return colors;
	}

	public void setColors(ArrayList<Color_main> colors) {
		this.colors = colors;
	}

	@Override
	public String toString() {
		return "Product_main [ID=" + ID + ", name=" + name + ", type=" + type + ", branch=" + branch + ", status="
				+ status + ", update_date=" + update_date + ", posts=" + posts + ", view=" + view + ", attributes="
				+ attributes + ", colors=" + colors + "]/n";
	}

	public static void main(String[] args) {
		Map<Enum, String> map = new HashMap<Enum, String>();
		map.put(DAO_ListProduct.SELECT.PRICE, "");
		map.put(DAO_ListProduct.SELECT.EVALUATE, "");
		for (Enum a : map.keySet()) {
			System.out.println("key: " + a + " value: " + map.get(a));
		}
	}
}
