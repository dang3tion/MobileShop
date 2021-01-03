package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Product_form;

public class DAO_ListProduct extends ExecuteStatementUtility {
	private final String PRODUCT = "SANPHAM";
	private final String ID = "MASP";
	private final String PRICE = "GIA_SP";
	private final String PRICE_DATE = "NGAYCAPNHAT";
	private static DAO_ListProduct dao_List = null;
	private String query = null;

	public DAO_ListProduct() {
		super();
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public static DAO_ListProduct getDao_ListProduct() {
		if (dao_List == null) {
			dao_List = new DAO_ListProduct();

		}
		return dao_List;
	}

	public List<Product_form> getListFollowBranch(String idBranch) throws SQLException {
		ArrayList<Product_form> lstProduct = new ArrayList<Product_form>();
		String[] para = { idBranch };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Product_form p = new Product_form();
				p.setId(rs.getString("MASP"));
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
		return lstProduct;
	}

	public List<Product_form> getListFollowPrices(int fromPrice, int toPrice) throws SQLException {
		ArrayList<Product_form> lstProduct = new ArrayList<Product_form>();
		String[] para = { fromPrice + "", toPrice + "" };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Product_form p = new Product_form();
				p.setId(rs.getString("MASP"));
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
		return lstProduct;
	}

}
