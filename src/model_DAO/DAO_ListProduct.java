package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.ListProduct;
import model_beans.Product_form;

public class DAO_ListProduct extends ExecuteStatementUtility {
	private final String PRODUCT = "SANPHAM";
	private final String ID = "MASP";

	public enum SELECT {
		NAME, PRICE, EVALUATE, DATE, VIEW, TYPE
	}

	public enum ORDER {
		DESC, ASC;
	}

	public enum LISTP {
		SPECIAL, NEW, HIGHESTPRICE;

	}

	private static DAO_ListProduct dao_List = null;
	private String query = null;

	public DAO_ListProduct() {
		super();
	}

	public static DAO_ListProduct getDao_ListProduct() {
		if (dao_List == null) {
			dao_List = new DAO_ListProduct();

		}
		return dao_List;
	}

	public ListProduct getListFollowBranch(String idBranch) throws SQLException {
		String[] para = { idBranch };
		query = "SELECT * FROM GET_PRODUCT_BRANCH(?)";

		ListProduct list = getListProduct(query, para);

		return list;
	}

	public ListProduct getListFollowPrices(int fromPrice, int toPrice) throws SQLException {
		String[] para = { fromPrice + "", toPrice + "" };
		query = "SELECT * FROM GET_PRODUCT_PRICES(?,?)";
		ListProduct list = getListProduct(query, para);

		return list;
	}

	public ListProduct getListFollowPricesBigger(int fromPrice) throws SQLException {
		String[] para = { fromPrice + "" };
		query = "SELECT * FROM GET_PRODUCT_PRICES_BIGGER(?)";
		ListProduct list = getListProduct(query, para);

		return list;
	}

	public ListProduct getListFollowPricesSmaller(int toPrice) throws SQLException {
		String[] para = { toPrice + "" };
		query = "SELECT * FROM GET_PRODUCT_PRICES_SMAILLER(?)";
		ListProduct list = getListProduct(query, para);

		return list;
	}

	public ListProduct getListFollowtType(String type) throws SQLException {
		String[] para = { type };
		query = "SELECT * FROM GET_PRODUCT_TYPE(?)";

		ListProduct list = getListProduct(query, para);

		return list;
	}

	public ListProduct getListProMenu(LISTP s, int number) throws SQLException {
		if (s == LISTP.SPECIAL) {
			query = "SELECT * FROM GET_PRODUCT_SPECIAL(?) ";
		} else if (s == LISTP.NEW) {
			query = "SELECT * FROM GET_PRODUCT_NEW(?) ";
		} else if (s == LISTP.HIGHESTPRICE) {
			query = "SELECT * FROM GET_PRODUCT_HIGHESTPRICE(?) ";
		}
		String[] para = { number + "" };

		ListProduct list = getListProduct(query, para);

		return list;
	}

	public ListProduct orderListProduct(ListProduct list, SELECT type, ORDER order)
			throws NumberFormatException, SQLException {
		list.addOrderLIst(type + "", order + "");
		String query = list.getQueryOrder();
		return getListProduct(query);

	}

	public ListProduct getListProduct(String query, String[] para) throws NumberFormatException, SQLException {
		ArrayList<Product_form> lstProduct = new ArrayList<Product_form>();
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Product_form p = new Product_form();
				p.setId(rs.getString("MASP").trim());
				p.setName(rs.getString("TENSP"));
				p.setPrice(Integer.parseInt(rs.getString("GIA")));
				if (rs.getString("GIA_KM") != null) {

					p.setPriceSales(Integer.parseInt(rs.getString("GIA_KM")));
				}
				p.setImg(rs.getString("ANH"));
				p.setAvgEvaluate(Double.parseDouble(rs.getString("AVGDANHGIA")));
				lstProduct.add(p);
			}
		}
		ListProduct result = new ListProduct();
		result.setLstProduct(lstProduct);
		result.setQuery(query);
		return result;
	}

	public ListProduct getListProduct(String query) throws NumberFormatException, SQLException {
		ArrayList<Product_form> lstProduct = new ArrayList<Product_form>();
		try (ResultSet rs = super.AccessDBstr(query)) {
			while (rs.next()) {
				Product_form p = new Product_form();
				p.setId(rs.getString("MASP").trim());
				p.setName(rs.getString("TENSP"));
				p.setPrice(Integer.parseInt(rs.getString("GIA")));
				if (rs.getString("GIA_KM") != null) {

					p.setPriceSales(Integer.parseInt(rs.getString("GIA_KM")));
				}
				p.setImg(rs.getString("ANH"));
				p.setAvgEvaluate(Double.parseDouble(rs.getString("AVGDANHGIA")));
				lstProduct.add(p);
			}
		}
		ListProduct result = new ListProduct();
		result.setLstProduct(lstProduct);
		result.setQuery(query);
		return result;

	}

	public Product_form getProductColor(String id, String idColor) throws SQLException {
		Product_form p = new Product_form();
		query = "SELECT * FROM GET_PRODUCT_COLOR(?,?)	";
		String[] para = { id, idColor };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				p.setId(rs.getString("MASP").trim());
				p.setName(rs.getString("TENSP"));
				p.setNameBranch(rs.getString("TENTH"));
				p.setPrice(Integer.parseInt(rs.getString("GIA")));
				if (rs.getString("GIA_KM") != null) {
					p.setPriceSales(Integer.parseInt(rs.getString("GIA_KM")));
				}
				p.setImg(rs.getString("ANH"));
				p.setAvgEvaluate(Double.parseDouble(rs.getString("AVGDANHGIA")));
				p.setColor(rs.getString("TENMAU"));
				p.setColorID(idColor);
			}
		}
		return p;
	}
}
