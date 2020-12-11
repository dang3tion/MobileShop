package temporary_dropdata;

public class Beans_Product {
	private String id;
	private String name;
	private int price;
	private int salePrice;

	public Beans_Product(String id, String name, int price, int salePrice) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.salePrice = salePrice;
	}

	public int getSaleprice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public Beans_Product() {
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



	

	
}
