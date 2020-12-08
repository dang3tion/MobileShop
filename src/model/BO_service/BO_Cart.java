package model.BO_service;

import model.DAO.DAO_Cart;

public class BO_Cart {

	private DAO_Cart dao;

	public BO_Cart(String email) {
		this.dao = new DAO_Cart(email);
	}

	public void addProduct(String productID) {
		dao.addItemToCart(productID);
	}

	public void deleteProduct(String productID) {
		dao.delete(productID);
	}

	public void deleteCart() {
		dao.deleteCart();
	}

	public void changeQuantity(String productID, int quantity) {
		dao.changeQuantity(productID, quantity);
	}

	public int currentQuantity(String productID) {
		return dao.getItem(productID).getQuantity();
	}

}
