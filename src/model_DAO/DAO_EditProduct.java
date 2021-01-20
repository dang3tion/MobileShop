package model_DAO;

import java.sql.ResultSet;

import model_ConnectDB.ExecuteCRUD;

public class DAO_EditProduct extends ExecuteCRUD {
	private static DAO_EditProduct dao;

	public static enum EDIHT {
		TENSP, LOAI_SP, MATH, TINHTRANG, GIOITHIEU, GIA, GIA_KM, SOLUONG, MAMAU, ANH, LOAIANH
	}

	public static enum TABLE {
		SANPHAM, SOLUONG_SP, GIA_SP, HINHANH
	}

	private DAO_EditProduct() {

	}

	public static DAO_EditProduct getInstance() {
		if (dao == null) {
			dao = new DAO_EditProduct();
		}
		return dao;
	}

	public boolean updateColumnProduct(TABLE table, EDIHT column, String id, String value) {
		String query = "UPDATE " + table + " SET " + column + "=? WHERE MASP=?";
		try (ResultSet rs = super.ExecuteQuery(query, value, id)) {
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean updateColorProduct(TABLE table, String id, String idColor, String idColorCurrent) {
		if (table != TABLE.HINHANH || table != TABLE.SOLUONG_SP) {
			return false;
		}
		String query = "UPDATE " + table + " SET MAMAU=? WHERE MASP=? AND MAMAU=?";
		try (ResultSet rs = super.ExecuteQuery(query, idColor, id, idColorCurrent)) {
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean updateQuantityProduct(TABLE table, String id, String idColor, int value) {
		if (table != TABLE.SOLUONG_SP) {
			return false;
		}

		String query = "UPDATE " + table + " SET " + EDIHT.SOLUONG + "=? WHERE MASP=? AND MAMAU=?";
		try (ResultSet rs = super.ExecuteQuery(query, value, id, idColor)) {
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean updateURLImage(TABLE table, String id, String idColor, String type, String url) {
		if (table != TABLE.HINHANH) {
			return false;
		}
		String query = "UPDATE " + table + " SET " + EDIHT.ANH + "=? WHERE MASP=? AND MAMAU=? AND LOAIANH=?";
		try (ResultSet rs = super.ExecuteQuery(query, url, id, idColor, type)) {
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean addURLImageSubs(String id, String idColor, String value) {
		String query = "INSERT INTO HINHANH VALUES(?,?,?,PHU)";

		try (ResultSet rs = super.ExecuteQuery(query, id, idColor, value)) {
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean deleteConfig(String idConfig) {
		String query = "DELETE CH_CTTT WHERE MACH=?";
		try (ResultSet rs = super.ExecuteQuery(query, idConfig)) {
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public static void main(String[] args) {
	}
}
