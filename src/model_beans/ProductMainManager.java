package model_beans;

import java.io.Serializable;
import java.util.ArrayList;

public class ProductMainManager implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String type;
	private Branch branch;
	private String status;
	private String update_date;
	private String posts;
	private Price_product_main prices;
	private ArrayList<Color_main> colors = new ArrayList<Color_main>();
	private ArrayList<AttributeManager> listAttribute = new ArrayList<AttributeManager>();
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
	public Price_product_main getPrices() {
		return prices;
	}
	public void setPrices(Price_product_main prices) {
		this.prices = prices;
	}
	public ArrayList<Color_main> getColors() {
		return colors;
	}
	public void setColors(ArrayList<Color_main> colors) {
		this.colors = colors;
	}
	public ArrayList<AttributeManager> getListAttribute() {
		return listAttribute;
	}
	public void setListAttribute(ArrayList<AttributeManager> listAttribute) {
		this.listAttribute = listAttribute;
	}
	@Override
	public String toString() {
		return "ProductMainManager [id=" + id + ", name=" + name + ", type=" + type + ", branch=" + branch + ", status="
				+ status + ", update_date=" + update_date + ", posts=" + posts + ", prices=" + prices + ", colors="
				+ colors + ", listAttribute=" + listAttribute + "]";
	}
	
}
