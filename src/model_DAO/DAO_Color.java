package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteCRUD;
import model_beans.Color_product;

public class DAO_Color extends ExecuteCRUD {
	private static DAO_Color dao;

	private DAO_Color() {

	}

	public static DAO_Color getInstance() {
		if (dao == null) {
			dao = new DAO_Color();
		}
		return dao;
	}
	
	public ArrayList<Color_product> getAllColor() {
		ArrayList<Color_product> arr = new ArrayList<Color_product>();
		String query = "SELECT * FROM MAUSAC";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			while (rs.next()) {
				Color_product c = new Color_product(rs.getString("MAMAU").trim(), rs.getString("TENMAU"));
				arr.add(c);
			}
			return arr;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
