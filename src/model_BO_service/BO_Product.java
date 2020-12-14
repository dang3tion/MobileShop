package model_BO_service;

import java.util.ArrayList;

import model_DAO.DAO_Product;
import model_beans.Product;

public class BO_Product {

	DAO_Product dao = new DAO_Product();

	public Product getProduct(String id) {
		return dao.getProduct(id);
	}

	public ArrayList<Product> getList(int start, int end) {
		return dao.getList(start, end);
	}

}
