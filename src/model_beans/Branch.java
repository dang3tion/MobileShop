package model_beans;

public class Branch {
	private String id;
	private String name;
	private int quantity_product;

	public Branch(String id, String name, int quantity_product) {
		super();
		this.id = id;
		this.name = name;
		this.quantity_product = quantity_product;
	}

	public Branch() {
		super();
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

	public int getQuantity_product() {
		return quantity_product;
	}

	public void setQuantity_product(int quantity_product) {
		this.quantity_product = quantity_product;
	}

}
