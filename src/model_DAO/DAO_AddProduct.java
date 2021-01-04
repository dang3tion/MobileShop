package model_DAO;

import java.sql.ResultSet;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Account;

public class DAO_AddProduct extends ExecuteStatementUtility {
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
}
