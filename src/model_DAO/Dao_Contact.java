package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Bean_Contact;
import model_beans.Product;

public class Dao_Contact extends ExecuteStatementUtility {
	public void addEvaluate(Bean_Contact contact) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		try {
			String query = "INSERT INTO " + "PHANHOI" + " VALUES(?,?,?,?,?)";
			System.out.println(query);
			String[] parameters = { //
					contact.getEmail(), contact.getName(), contact.getNumberPhone(), date, contact.getContent() };

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Bean_Contact> listContact(int start, int end) {
		ArrayList<Bean_Contact> list = new ArrayList<Bean_Contact>();
		String[] para = { start + "", end + "" };
		String query = "WITH X AS (select ROW_NUMBER() OVER (ORDER BY PHANHOI.EMAIL DESC) AS STT,* FROM PHANHOI) SELECT * FROM X WHERE STT BETWEEN ? AND ?\r\n"
				+ "";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				list.add(new Bean_Contact(rs.getString("HOTEN"),rs.getString("EMAIL"),rs.getString("SDT"),rs.getString("THOIGIAN"),rs.getString("LOINHAN")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public static void main(String[] args) {
		Dao_Contact dao = new Dao_Contact();
//		for (int i = 0; i < dao.listContact(1, 3).size(); i++) {
//			System.out.println(dao.listContact(1, 3).get(i).toString());
//		}
		dao.addEvaluate(new Bean_Contact("cuong", "123", "nguyen", "nooij dung"));
		
	}

}
