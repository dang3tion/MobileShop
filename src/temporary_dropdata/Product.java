package temporary_dropdata;

public class Product {
	private long id;
	private String name;
	private String price;
	private String priceSale;
	private String img;

	public Product() {
	}

	public Product(long id, String name, String price, String priceSale, String img) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.priceSale = priceSale;
		this.img = img;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
