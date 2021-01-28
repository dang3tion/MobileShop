package model_beans;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import model_DAO.DAO_ListProduct;
import model_DAO.DAO_ListProduct.LISTP;
import model_DAO.DAO_ListProduct.ORDER;
import model_DAO.DAO_ListProduct.SELECT;

public class ListProduct implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String query;
	private Object[] para;
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

	public Object[] getPara() {
		return para;
	}

	public void setPara(Object[] para) {
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

	public void removerOrder(SELECT key) {

		if (orderList.containsKey(key)) {
			orderList.remove(key);
		}
	}

	public String getQueryOrder(int start, int end) {

		int count = 0;
		StringBuilder str = new StringBuilder();
		str.append("SELECT * FROM  (SELECT ROW_NUMBER() OVER (");
		if (orderList.isEmpty()) {
			switch (query) {
			case "SELECT * FROM GET_PRODUCT_SPECIAL(?) ": {
				str.append(" ORDER BY AVGDANHGIA DESC ");
				break;
			}
			case "SELECT * FROM GET_PRODUCT_NEW(?) ": {
				str.append(" ORDER BY NGAYCAPNHAT DESC ");
				break;
			}
			default:
				str.append(" ORDER BY GIA DESCF");
			}
		} else {
			for (SELECT s : orderList.keySet()) {
				if (count == 0) {
					str.append(" ORDER BY " + convertEnum(s) + " " + orderList.get(s));
				} else {
					str.append(", " + convertEnum(s) + " " + orderList.get(s));
				}
				count++;
			}
		}

		str.append(") AS STT , * FROM (SELECT TOP(SELECT COUNT(*) FROM (" + query + ")TK) * FROM(" + query
				+ ")TK) TK) AS X   WHERE STT BETWEEN " + start + " AND " + end);
		return str.toString();
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

			return "LOAI_SP";
		}
		case VIEW: {

			return "LUOTXEM";
		}
		default:
			return "";
		}
	}

	public static void main(String[] args) throws SQLException {
		ListProduct lst = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.NEW, 100);
		System.out.println(lst.getLstProduct());
		lst.addOrderLIst(SELECT.PRICE, ORDER.ASC);
		lst.setLstProduct(DAO_ListProduct.getDao_ListProduct().orderListProduct(lst, lst.getQueryOrder(10, 20)));
		System.out.println("aaaa");
		System.out.println(lst.getLstProduct());

	}

}
