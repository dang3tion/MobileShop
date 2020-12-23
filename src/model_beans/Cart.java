package model_beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import model_utility.CodeOrder;
import model_utility.Config;

public class Cart {

	private HashMap<String, Integer> listProduct = new HashMap<String, Integer>();
	private HashMap<String, ArrayList<String>> listColorEveryProduct = new HashMap<String, ArrayList<String>>();
	CodeOrder codeOder = new CodeOrder();

	public CodeOrder getCodeOder() {
		return codeOder;
	}

	public Cart() {

	}

	public Set<String> getListProductID() {
		return listProduct.keySet();
	}

	public  ArrayList<String> getListColorOfProduct(String productID) {
		return listColorEveryProduct.get(productID);
	}

	public int getQuantityOfProductInCart() {
		int total = 0;
		for (String productID : listProduct.keySet()) {
			total += listProduct.get(productID);
		}
		return total;
	}

	public int getQuantityEveryProduct(String productID) {
		if (listProduct.containsKey(productID)) {
			return listProduct.get(productID);
		}
		return 0;
	}

	public HashMap<String, Integer> getListProduct() {
		return listProduct;
	}

	/**
	 * @param productID
	 * @return 1 đạt đến số lượng sản phẩm tối đa mỗi model. 2 đạt đến số model sản
	 *         phẩm tối đa. 0 là đã thêm thành công.
	 */
	public int add(String productID) {
		int resultCheckLimit = checkLimit(productID);
		if (resultCheckLimit != 0) {
			return resultCheckLimit;
		}
		if (listProduct.containsKey(productID)) {
			listProduct.put(productID, getQuantityEveryProduct(productID) + 1);
		} else {
			listProduct.put(productID, 1);
		}
		return 0;
	}

	public void removeProductModel(String productID) {
		listProduct.remove(productID);
	}

	public void removeProductItem(String productID) {
		if (getQuantityEveryProduct(productID) > 1) {
			listProduct.put(productID, getQuantityEveryProduct(productID) - 1);
		}
	}

	public void removeAll() {
		listProduct.clear();
	}

	private int checkLimit(String productID) {
		if (getQuantityEveryProduct(productID) == Config.MAX_QUANTITY_OF_PRODUCT) {
			return 1;
		}

		if (listProduct.size() == Config.MAX_PRODUCT) {
			return 2;
		}
		return 0;
	}

}
