package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import model_ConnectDB.ExecuteCRUD;

public class DAO_AddProduct extends ExecuteCRUD {
	private static DAO_AddProduct dao;

	private DAO_AddProduct() {

	}

	public static DAO_AddProduct getInstance() {
		if (dao == null) {
			dao = new DAO_AddProduct();
		}
		return dao;
	}

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

	public boolean addImg(String idProduct, String idColor, String linkImg, String type) {
		try {

			if (!isContainerImg(idProduct, idColor, linkImg)) {

				String query = "INSERT INTO HINHANH VALUES(?,?,?,?)";
				try (ResultSet rs = super.ExecuteQuery(query, idProduct, idColor, linkImg, type)) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean isContainerImg(String idProduct, String idColor, String linkImg) {
		String query = "SELECT * FROM HINH ANH WHERE MASP=? AND MAMAU =? ANH=?";
		try (ResultSet rs = super.ExecuteQuery(query, idProduct, idColor, linkImg)) {
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
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

	public boolean addPrice(String id, int price, int priceSale) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		try {
			String query = "INSERT INTO GIA_SP VALUES(?,?,?,?)";
			try (ResultSet rs = super.ExecuteQuery(query, id, date, price, priceSale)) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
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

	public String addConfig(String id, int number) {
		try {
			String query = "INSERT INTO CAUHINH VALUES(?,?)";

			try (ResultSet rs = super.ExecuteQuery(query, id, number)) {
				return id;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//	public String createIdProper() {
//		String id = "";
//		String query = "select COUNT(MATT) from THUOCTINH";
//		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
//			if (rs.next()) {
//				id = rs.getString(1);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		if (id.equals("")) {
//			id = "0";
//		}
//		return "TT" + (Integer.parseInt(id) + 1);
//	}
//
//	public void addProper(String id, String typeValue, String content, String idClass) {
//		try {
//			String query = "INSERT INTO THUOCTINH VALUES(?,?,?,?)";
//			try (ResultSet rs = super.ExecuteQuery(query, id, typeValue, content, idClass)) {
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

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
		return "CTN" + (Integer.parseInt(id) + 1);
	}

	public boolean isTextValue(String idAtt) {
		String query = "SELECT LOAI_GIATRI FROM THUOCTINH WHERE MATT=?";
		try (ResultSet rs = super.ExecuteQuery(query, idAtt)) {
			if (rs.next()) {
				if (rs.getString("LOAI_GIATRI").equalsIgnoreCase("so")) {
					return false;
				}
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	public String addDetailProper(String content, String idProper) {
		String query = "INSERT INTO CHITIET_THUOCTINH VALUES(?,?,?,?)";
		String value = content;
		if (!isTextValue(idProper)) {
			value = extractMaximum(value) + "";
		}
		String id = createIdDetailProper();
		try (ResultSet rs = super.ExecuteQuery(query, id, value, content, idProper)) {
			return id;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int extractMaximum(String str) {
		int num = 0, res = 0;

		// Start traversing the given string
		for (int i = 0; i < str.length(); i++) {
			// If a numeric value comes, start converting
			// it into an integer till there are consecutive
			// numeric digits
			if (Character.isDigit(str.charAt(i))) {
				System.out.println(str.charAt(i));
				System.out.println((str.charAt(i) - '0'));
				num = num * 10 + (str.charAt(i) - '0');
				System.out.println(num);
			}

			// Update maximum value
			else {
				res = Math.max(res, num);

				// Reset the number
				num = 0;
			}
		}

		// Return maximum value
		return Math.max(res, num);
	}

	public boolean addQuantity(String idProduct, String idColor, int quantity) {
		String query = "INSERT INTO SOLUONG_SP VALUES(?,?,?,0)";

		try (ResultSet rs = super.ExecuteQuery(query, idProduct, idColor, quantity)) {
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public String addProduct(String name, String type, String idBranch, String status, String introduce,
			String idConfig) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		String query = "INSERT INTO SANPHAM VALUES(?,?,?,?,?,?,?,0,?)";
		String id = createIdProduct();
		try (ResultSet rs = super.ExecuteQuery(query, id, name, type, idBranch, status, date, introduce, idConfig)) {
			return id;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		System.out.println(DAO_Attribute.getInstance().getIdDetail("Nguyên khối", "Tt27"));
	}
}
