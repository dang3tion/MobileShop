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
	public static void main(String[] args) {
		DAO_AddProduct dao = new DAO_AddProduct();
		System.out.println(dao.createIdColor());
	}
	
}
