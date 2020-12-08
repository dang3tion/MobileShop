package temporary_dropdata;

public class Beans_Product {
	private String id;
	private String name;
	private int price;

	public Beans_Product(String id, String name, int price) {
		this.id = id;
		this.name = name;
		this.price = price;
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



	@Override
	public String toString() {
		return "Beans_Product [id=" + id + ", name=" + name + ", price=" + price + "]\n";
	}

	
}
