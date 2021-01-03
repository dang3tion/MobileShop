package model_beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model_DAO.DAO_ListProduct;

public class ListProduct {
	private String query;
	private ArrayList<Product_form> lstProduct;
	private Map<String, String> orderList = new HashMap<String, String>();

	public ListProduct(String query, ArrayList<Product_form> lstProduct) {
		super();
		this.query = query;
		this.lstProduct = lstProduct;
	}

	public void addOrderLIst(String key, String value) {
		if (!key.equals(DAO_ListProduct.SELECT.PRICE + "") && !orderList.containsKey(key)) {
			for (String s : orderList.keySet()) {
				if (!s.equals(DAO_ListProduct.SELECT.PRICE)) {
					orderList.remove(s);
				}
			}
		}
		orderList.put(key, value);
	}

	public String getQueryOrder() {
		if (orderList.isEmpty()) {
			return query;
		} else {
			int count = 0;
			StringBuilder str = new StringBuilder();
			str.append(query);
			for (String s : orderList.keySet()) {
				if (count == 0) {
					str.append(" ORDER BY " + s + " " + orderList.get(s));
				} else {
					str.append(", " + s + " " + orderList.get(s));
				}
				count++;
			}
			return str.toString();
		}
	}

	public ListProduct() {
		super();
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public ArrayList<Product_form> getLstProduct() {
		return lstProduct;
	}

	public void setLstProduct(ArrayList<Product_form> lstProduct) {
		this.lstProduct = lstProduct;
	}

}
