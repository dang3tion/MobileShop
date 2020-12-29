package model_beans;

public class Branch {
	private String numOrder;
	private String id;
	private String name;
	private int quantity_product;
	private String state;

	public Branch(String id, String name, int quantity_product) {
		super();
		this.id = id;
		this.name = name;
		this.quantity_product = quantity_product;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Branch(String numOrder, String id, String name, int quantity_product, String state) {
		super();
		this.numOrder = numOrder;
		this.id = id;
		this.name = name;
		this.quantity_product = quantity_product;
		this.state = state;
	}

	public Branch(String id, String name, int quantity_product, String state) {
		super();
		this.id = id;
		this.name = name;
		this.quantity_product = quantity_product;
		this.state = state;
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

	public String getNumOrder() {
		return numOrder;
	}

	public void setNumOrder(String numOrder) {
		this.numOrder = numOrder;
	}

	@Override
	public String toString() {
		return "Branch [id=" + id + ", name=" + name + ", quantity_product=" + quantity_product + ", state=" + state
				+ "]";
	}

}
