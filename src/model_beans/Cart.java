package model_beans;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import model_DAO.DAO_ListProduct;
import model_utility.CodeOrder;
import model_utility.Config;

public class Cart {

	private HashMap<String, HashMap<String, Integer>> listProduct = new HashMap<String, HashMap<String, Integer>>();
	CodeOrder codeOder = new CodeOrder();
//	private Map<Product_form, Integer> list = new HashMap<Product_form, Integer>();

	public CodeOrder getCodeOder() {
		return codeOder;
	}

	public void setListProduct(HashMap<String, HashMap<String, Integer>> listProduct) {
		this.listProduct = listProduct;
	}

	public void setCodeOder(CodeOrder codeOder) {
		this.codeOder = codeOder;
	}
	
	public HashMap<String, HashMap<String, Integer>> getListProduct() {
		return listProduct;
	}



	public Cart() {

	}


	public Set<String> getListProductID() {
		return listProduct.keySet();
	}

	public int getQuantityOfProductInCart() {
		int total = 0;
		for (String productID : listProduct.keySet()) {
			for (String colorID : listProduct.get(productID).keySet()) {
				total += listProduct.get(productID).get(colorID);
			}
		}
		return total;
	}

	public int getQuantityEveryProduct(String productID) {
		int total = 0;
		if (listProduct.containsKey(productID)) {
			for (String colorID : listProduct.get(productID).keySet()) {
				total += listProduct.get(productID).get(colorID);
			}
		}
		return total;
	}

	public int getQuantityEveryProductColor(String productID, String colorID) {
		int total = listProduct.get(productID).get(colorID);
		return total;
	}

	public HashMap<String, HashMap<String, Integer>> getListProduct_hashMap() {
		return this.listProduct;
	}

	/**
	 * @param productID
	 * @return 1 đạt đến số lượng sản phẩm tối đa mỗi model. 2 đạt đến số model sản
	 *         phẩm tối đa. 0 là đã thêm thành công.
	 * @throws SQLException
	 */
	public int add(String productID, String ColorID) throws SQLException {
		int resultCheckLimit = checkLimit(productID);
		if (resultCheckLimit != 0) {
			return resultCheckLimit;
		}
		// KHÔNG tồn tại productID ,ColorID không tồn tại
		if (!listProduct.containsKey(productID)) {
			HashMap<String, Integer> listProductColor = new HashMap<String, Integer>();
			listProductColor.put(ColorID, 1);
			listProduct.put(productID, listProductColor);
			return 0;
		}
		// đã tồn tại productID, ColorID KHÔNG tồn tại
		if (!listProduct.get(productID).containsKey(ColorID)) {
			listProduct.get(productID).put(ColorID, 1);
			return 0;
		}
		// đã tồn tại productID và ColorID
		listProduct.get(productID).put(ColorID, getQuantityEveryProductColor(productID, ColorID) + 1);
		return 0;

	}

	public void removeAllProductSameColor(String productID, String colorID) throws SQLException {
		listProduct.get(productID).remove(colorID);
	}

	public void removeProductItem(String productID, String colorID) throws SQLException {
		if (getQuantityEveryProductColor(productID, colorID) > 1) {
			listProduct.get(productID).put(colorID, getQuantityEveryProductColor(productID, colorID) - 1);
		}
	}

	public void removeAll() {
		listProduct.clear();
	}

	private int checkLimit(String productID) {
		if (getQuantityEveryProduct(productID) == Config.MAX_QUANTITY_OF_PRODUCT) {
			// đạt đến số lượng tối đa mỗi loại sản phẩm
			return 1;
		}

		if (listProduct.size() == Config.MAX_PRODUCT) {
			// đạt đến max số lượng model sản phẩm
			return 2;
		}
		// Chưa đạt đến max size giỏ hàng
		return 0;
	}

	



}
