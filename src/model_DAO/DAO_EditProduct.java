package model_DAO;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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

	public boolean isUpdatePrice(String id) {
		String query = "SELECT * FROM GIA_SP WHERE MASP=? AND NGAYCAPNHAT=?";
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		try (ResultSet rs = super.ExecuteQuery(query, id, date)) {
			if (rs.next()) {
				return true;

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public boolean updatePrice(int price, int priceSale, String id) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		if (!isUpdatePrice(id)) {
			String query = "INSERT INTO " + TABLE.GIA_SP + " VALUES(?,?,?,?)";
			try (ResultSet rs = super.ExecuteQuery(query, id, date, price, priceSale)) {
				return true;
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else {
			String query = "UPDATE " + TABLE.GIA_SP + " SET GIA=? , GIA_KM=? WHERE MASP=? AND NGAYCAPNHAT=?";
			try (ResultSet rs = super.ExecuteQuery(query, price, priceSale, id, date)) {
				return true;
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return false;

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
		if (table != TABLE.HINHANH && table != TABLE.SOLUONG_SP) {
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

	public boolean updateURLImage(TABLE table, String id, String idColor, String type, String url, String urlCurrent) {
		if (table != TABLE.HINHANH) {
			return false;
		}
		String query = "UPDATE " + table + " SET " + EDIHT.ANH + "=? WHERE MASP=? AND MAMAU=? AND LOAIANH=? AND ANH=?";
		try (ResultSet rs = super.ExecuteQuery(query, url, id, idColor, type, urlCurrent)) {
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

}
