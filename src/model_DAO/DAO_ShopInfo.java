package model_DAO;

import java.sql.ResultSet;

import model_beans.ShopInfo;

public class DAO_ShopInfo extends ConnectDB {

	private final String INFO = "THONGTIN_SHOP";
	private final String SHOPNAME = "TENSHOP";
	private final String POLICY = "CHINHSACH";
	private final String URL_FB = "DC_FB";
	private final String URL_YT = "DC_YTB";
	private final String ADDRESS = "DC_THUC";




	public void setInfo(ShopInfo info) {
		try {
			String query = "UPDATE " //
					+ INFO + " SET "//
					+ SHOPNAME + " = ? , "//
					+ POLICY + " = ? , "//
					+ URL_FB + " = ? , "//
					+ URL_YT + " = ? , "//
					+ ADDRESS + " = ? WHERE ID = 'const'";

			String[] param = { info.getName(), info.getPolicy(), info.getURL_facebook(), info.getURL_youtube(),
					info.getAddress() };
			try (ResultSet rs = super.AccessDBstr(query, param)) {
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

	public ShopInfo getInfo() {
		try (ResultSet rs = super.AccessDBstr("SELECT * FROM " + INFO + " ;")) {
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
