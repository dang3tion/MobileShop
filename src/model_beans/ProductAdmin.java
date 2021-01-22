package model_beans;

public class ProductAdmin {
	private String numOrder;
	private String id;
	private String img;
	private String name;
	private String branch;
	private String date;
	private int quatity;
	private int quatityRemain;
	private String price;
	private String priceSale;
	private String state;
	public ProductAdmin(String numOrder, String id, String img, String name, String branch, String date, int quatity,
			int quatityRemain, String price, String priceSale, String state) {
		super();
		this.numOrder = numOrder;
		this.id = id;
		this.img = img;
		this.name = name;
		this.branch = branch;
		this.date = date;
		this.quatity = quatity;
		this.quatityRemain = quatityRemain;
		this.price = price;
		this.priceSale = priceSale;
		this.state = state;
	}
	public ProductAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNumOrder() {
		return numOrder;
	}
	public void setNumOrder(String numOrder) {
		this.numOrder = numOrder;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getQuatity() {
		return quatity;
	}
	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}
	public int getQuatityRemain() {
		return quatityRemain;
	}
	public void setQuatityRemain(int quatityRemain) {
		this.quatityRemain = quatityRemain;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPriceSale() {
		return priceSale;
	}
	public void setPriceSale(String priceSale) {
		this.priceSale = priceSale;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "ProductAdmin [numOrder=" + numOrder + ", id=" + id + ", img=" + img + ", name=" + name + ", branch="
				+ branch + ", date=" + date + ", quatity=" + quatity + ", quatityRemain=" + quatityRemain + ", price="
				+ price + ", priceSale=" + priceSale + ", state=" + state + "]";
	}
	
	}
