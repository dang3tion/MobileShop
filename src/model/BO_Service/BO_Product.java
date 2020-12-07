package model.BO_Service;

import java.util.ArrayList;

import model.beans.Product;

public class BO_Product {

	private ArrayList<Product> demoListProduct() {
		ArrayList<Product> list = new ArrayList<Product>();
		list.add(new Product("MBS_001", "Iphone", 23456));
		list.add(new Product("MBS_008", "Nokia", 345678));
		list.add(new Product("MBS_005", "Samsung", 2343));
		return list;
	}

	public Product demoGet(String id) {
		for (Product p : demoListProduct()) {
			if (p.getId().equals(id)) {
				return p;
			}
		}
		return null;
	}

}
