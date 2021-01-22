package model_beans;

import java.io.Serializable;

public class Branch implements Serializable{
	private String numOrder;
	private String id;
	private String name;
	private int productQuantity;
	private String state;

	public Branch(String id, String name, int productQuantity) {
		this.id = id;
		this.name = name;
		this.productQuantity = productQuantity;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Branch(String numOrder, String id, String name, int productQuantity, String state) {
		this.numOrder = numOrder;
		this.id = id;
		this.name = name;
		this.productQuantity = productQuantity;
		this.state = state;
	}

	public Branch(String id, String name, int productQuantity, String state) {
		this.id = id;
		this.name = name;
		this.productQuantity = productQuantity;
		this.state = state;
	}

	public Branch() {
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

	public int getproductQuantity() {
		return productQuantity;
	}

	public void setproductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getNumOrder() {
		return numOrder;
	}

	public void setNumOrder(String numOrder) {
		this.numOrder = numOrder;
	}

	@Override
	public String toString() {
		return "[id=" + id + ", name=" + name + ", productQuantity=" + productQuantity + ", state=" + state
				+ "]\n";
	}


}
