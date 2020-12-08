package model.BO_service;

import java.util.ArrayList;

import model.beans.Product;

public class BO_Product {

	public ArrayList<Product> demoListProduct() {
		ArrayList<Product> list = new ArrayList<Product>();
		String img1 = "https://cdn.tgdd.vn/Products/Images/42/230867/samsung-galaxy-note-20-ultra-5g-trang-400x400-2-400x400.png";
		String img2 = "https://cdn.tgdd.vn/Products/Images/42/228736/iphone-12-128gb-195720-105752-400x400.png";
		String img3 = "https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-white-400x400-400x400.png";
		list.add(new Product("MBS_001", "Iphone", 23456, img1));
		list.add(new Product("MBS_008", "Nokia", 345678, img2));
		list.add(new Product("MBS_005", "Samsung", 2343, img3));
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

	public static void main(String[] args) {
		System.out.println((new BO_Product().demoListProduct()));
	}

}
