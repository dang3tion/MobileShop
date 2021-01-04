package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Account;

public class DAO_AddProduct extends ExecuteStatementUtility {
	
	public String createIdColor() {
		String color = "";
		String query = "select * from MAUSAC order by MAMAU desc";
		try (ResultSet rs = super.AccessDBstr(query)) {
			if (rs.next()) {
				color = rs.getString(1).replace("MS", "").trim();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "MS"+(Integer.parseInt(color)+1);
	}
	
	public void addColor(String id, String codeColor, String name) {
		try {
			String query = "INSERT INTO MAUSAC VALUES(?,?,?)";
			String[] parameters = { id, codeColor, name };

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String createIdProduct() {
		String id = "";
		String query = "select * from HINHANH order by MASP desc";
		try (ResultSet rs = super.AccessDBstr(query)) {
			if (rs.next()) {
				id = rs.getString(1).replace("SP", "").trim();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "SP"+(Integer.parseInt(id)+1);
	}
	
	public void addImg(String idProduct,String idColor,String linkImg,String type) {
		try {
			String query = "INSERT INTO HINHANH VALUES(?,?,?,?)";
			String[] parameters = {idProduct,idColor, linkImg,type };

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String createIdBrand() {
		String id = "";
		String query = "select * from THUONGHIEU order by MATH desc";
		try (ResultSet rs = super.AccessDBstr(query)) {
			if (rs.next()) {
				id = rs.getString(1).replace("TH", "").trim();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "TH"+(Integer.parseInt(id)+1);
	}
	
	public String idBrand(String name) {
		String idBrand = createIdBrand();
		String query = "select * from THUONGHIEU";
		try (ResultSet rs = super.AccessDBstr(query)) {
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
			String[] parameters = {idBrand,name,"0","Còn kinh doanh"};
			try (ResultSet rs = super.AccessDBstr(query1, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return idBrand;
	}
	
	public static void main(String[] args) {
		DAO_AddProduct dao = new DAO_AddProduct();
		System.out.println(dao.idBrand("HH"));
	}
	
}
