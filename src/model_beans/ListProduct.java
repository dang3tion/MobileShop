package model_beans;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model_DAO.DAO_ListProduct;
import model_DAO.DAO_ListProduct.LISTP;
import model_DAO.DAO_ListProduct.ORDER;
import model_DAO.DAO_ListProduct.SELECT;

public class ListProduct {
	private String query;
	private String[] para;
	private ArrayList<Product_form> lstProduct;
	private Map<SELECT, ORDER> orderList = new HashMap<SELECT, ORDER>();

	public ListProduct(String query, ArrayList<Product_form> lstProduct) {
		super();
		this.query = query;
		this.lstProduct = lstProduct;
	}

	public ListProduct(String query, String[] para, ArrayList<Product_form> lstProduct) {
		super();
		this.query = query;
		this.para = para;
		this.lstProduct = lstProduct;
	}

	public String[] getPara() {
		return para;
	}

	public void setPara(String[] para) {
		this.para = para;
	}

	public Map<SELECT, ORDER> getOrderList() {
		return orderList;
	}

	public void setOrderList(Map<SELECT, ORDER> orderList) {
		this.orderList = orderList;
	}

	public void addOrderLIst(SELECT key, ORDER value) {
		if (!key.equals(DAO_ListProduct.SELECT.PRICE) && !orderList.containsKey(key)) {
			for (SELECT s : orderList.keySet()) {
				if (!s.equals(DAO_ListProduct.SELECT.PRICE)) {
					orderList.remove(s);
					break;
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
			for (SELECT s : orderList.keySet()) {
				if (count == 0) {
					str.append(" ORDER BY " + convertEnum(s) + " " + orderList.get(s));
				} else {
					str.append(", " + convertEnum(s) + " " + orderList.get(s));
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

	public String convertEnum(SELECT s) {
		switch (s) {
		case PRICE: {

			return "GIA";
		}
		case DATE: {

			return "NGAYCAPNHAT";
		}
		case EVALUATE: {

			return "AVGDANHGIA";
		}
		case NAME: {

			return "TENSP";
		}
		case TYPE: {

			return "LOAISP";
		}
		case VIEW: {

			return "LUOTXEM";
		}
		default:
			return "";
		}
	}

	public static void main(String[] args) throws SQLException {
		ListProduct list = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.HIGHESTPRICE, 100);
//		System.out.println(list.getLstProduct());
		list.addOrderLIst(SELECT.PRICE, ORDER.ASC);
		System.out.println(list.getQuery());
		System.out.println(list.getQueryOrder());
		list = DAO_ListProduct.getDao_ListProduct().orderListProduct(list, SELECT.PRICE, ORDER.ASC);
System.out.println(list.getLstProduct());
	}
}
