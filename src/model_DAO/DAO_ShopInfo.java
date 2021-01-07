package model_DAO;

import java.sql.ResultSet;

import model_ConnectDB.ExecuteCRUD;
import model_beans.ShopInfo;

public class DAO_ShopInfo extends ExecuteCRUD {

	private final String INFO = "THONGTIN_SHOP";
	private final String SHOPNAME = "TENSHOP";
	private final String POLICY = "CHINHSACH";
	private final String URL_FB = "DC_FB";
	private final String URL_YT = "DC_YTB";
	private final String ADDRESS = "DC_THUC";

	
	private static DAO_ShopInfo daoShopInfo = null;

	public static DAO_ShopInfo getDaoShopInfo() {
		if ( daoShopInfo == null) {
			 daoShopInfo = new DAO_ShopInfo();
		}
		return  daoShopInfo;
	}

	protected DAO_ShopInfo() {
	}

	
	
	public void setInfo(ShopInfo info) {
		try {
			String query = "UPDATE " //
					+ INFO + " SET "//
					+ SHOPNAME + " = ? , "//
					+ POLICY + " = ? , "//
					+ URL_FB + " = ? , "//
					+ URL_YT + " = ? , "//
					+ ADDRESS + " = ? WHERE ID = '00'";

			String[] param = { info.getName(), info.getPolicy(), info.getURL_facebook(), info.getURL_youtube(),
					info.getAddress() };
			try (ResultSet rs = super.ExecuteQuery(query, param)) {
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

	public ShopInfo getInfo() {
		try (ResultSet rs = super.ExecuteQueryNonParameter("SELECT * FROM " + INFO + " ;")) {
			while (rs.next()) {

				return new ShopInfo(rs.getString(SHOPNAME), //
						rs.getString(POLICY), //
						rs.getString(URL_FB), //
						rs.getString(URL_YT), //
						rs.getString(ADDRESS));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
}
