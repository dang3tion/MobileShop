package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import model_ConnectDB.ExecuteCRUD;
import model_beans.Account;

public class DAO_AddProduct extends ExecuteCRUD {

	public String createIdColor() {
		String color = "";
		String query = "select * from MAUSAC order by MAMAU desc";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			if (rs.next()) {
				color = rs.getString(1).replace("MS", "").trim();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (color.equals("")) {
			color = "0";
		}
		return "MS" + (Integer.parseInt(color) + 1);
	}

	public void addColor(String id, String codeColor, String name) {
		try {
			String query = "INSERT INTO MAUSAC VALUES(?,?,?)";

			try (ResultSet rs = super.ExecuteQuery(query, id, codeColor, name)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String createIdProduct() {
		String id = "";
		String query = "select COUNT(MASP) from SANPHAM";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			if (rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (id.equals("")) {
			id = "1";
		}
		return "SP" + (Integer.parseInt(id) + 1);
	}

	public void addImg(String idProduct, String idColor, String linkImg, String type) {
		try {
			String query = "INSERT INTO HINHANH VALUES(?,?,?,?)";

			try (ResultSet rs = super.ExecuteQuery(query, idProduct, idColor, linkImg, type)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String createIdBrand() {
		String id = "";
		String query = "select * from THUONGHIEU order by MATH desc";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			if (rs.next()) {
				id = rs.getString(1).replace("TH", "").trim();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (id.equals("")) {
			id = "0";
		}
		return "TH" + (Integer.parseInt(id) + 1);
	}

	public String idBrand(String name) {
		String idBrand = createIdBrand();
		String query = "select * from THUONGHIEU";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			while (rs.next()) {
				if (name.equals(rs.getString("TENTH"))) {
					return idBrand = rs.getString("MATH");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			String query1 = "INSERT INTO THUONGHIEU VALUES(?,?,?,?)";
			String[] parameters = { idBrand, name, "0", "Còn kinh doanh" };
			try (ResultSet rs = super.ExecuteQuery(query1, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return idBrand;
	}

	public void addProduct(String id, String name, String type, String idBrand, String state, String introduce,
			String quatity, String idConfig) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		try {
			String query = "INSERT INTO SANPHAM VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			String[] parameters = { id, name, type, idBrand, state, date, introduce, quatity, "0", "0", idConfig };

			try (ResultSet rs = super.ExecuteQuery(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addPrice(String id, String price, String priceSale) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		try {
			String query = "INSERT INTO GIA_SP VALUES(?,?,?,?)";

			try (ResultSet rs = super.ExecuteQuery(query, id, date, price, priceSale)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String createIdConfig() {
		String id = "";
		String query = "select COUNT(MACH) from CAUHINH";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			if (rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (id.equals("")) {
			id = "0";
		}
		return "CH" + (Integer.parseInt(id) + 1);
	}

	public void addConfig(String id, String number) {
		try {
			String query = "INSERT INTO CAUHINH VALUES(?,?)";

			try (ResultSet rs = super.ExecuteQuery(query, id, number)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String createIdProper() {
		String id = "";
		String query = "select COUNT(MATT) from THUOCTINH";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			if (rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (id.equals("")) {
			id = "0";
		}
		return "TT" + (Integer.parseInt(id) + 1);
	}

	public void addProper(String id, String typeValue, String content, String idClass) {
		try {
			String query = "INSERT INTO THUOCTINH VALUES(?,?,?,?)";
			try (ResultSet rs = super.ExecuteQuery(query, id, typeValue, content, idClass)) {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String createIdDetailProper() {
		String id = "";
		String query = "select COUNT(MACT) from CHITIET_THUOCTINH";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			if (rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (id.equals("")) {
			id = "0";
		}
		return "CT" + (Integer.parseInt(id) + 1);
	}

	public void addDetailProper(String id, String value, String content, String idProper) {

	}

}
