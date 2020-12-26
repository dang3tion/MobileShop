package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Bean_Contact;

public class Dao_Contact extends ExecuteStatementUtility {
	
	public int createId() {
		int count = 0;
		try {
			String query = "SELECT TOP 1 MAPH FROM PHANHOI \r\n"
					+ "\r\n"
					+ "ORDER BY MAPH DESC";
			try (ResultSet rs = super.AccessDBstr(query)) {
				 count = Integer.parseInt("1");
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public void addEvaluate(Bean_Contact contact) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		try {
			String query = "INSERT INTO " + "PHANHOI" + " VALUES(?,?,?,?,?,?,?)";
			System.out.println(query);
			String[] parameters = { createId()+"",
					contact.getEmail(), contact.getName(), contact.getNumberPhone(), date, contact.getContent(),"Chưa phản hồi" };

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Bean_Contact> listContact(int start, int end) {
		ArrayList<Bean_Contact> list = new ArrayList<Bean_Contact>();
		String[] para = { start + "", end + "" };
		String query = " WITH X AS (select ROW_NUMBER() OVER (ORDER BY PHANHOI.trangthai ASC, THOIGIAN DESC) AS STT,* FROM PHANHOI ) SELECT * FROM X WHERE STT BETWEEN ? AND ?\r\n"
				+ "";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				list.add(new Bean_Contact(rs.getString("MAPH").trim(),rs.getString("HOTEN"),rs.getString("EMAIL"),rs.getString("SDT"),rs.getString("THOIGIAN"),rs.getString("LOINHAN"),rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public void updateState(String id) {
		try {
			String query = " UPDATE PHANHOI SET TRANGTHAI = N'Đã phản hồi' WHERE MAPH = ?";
			String[] para= {id};
			try (ResultSet rs = super.AccessDBstr(query,para)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteFeedback(String id) {
		try {
			String query = "DELETE FROM PHANHOI WHERE MAPH = ?";
			String[] para= {id};
			try (ResultSet rs = super.AccessDBstr(query,para)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) {
		Dao_Contact dao = new Dao_Contact();
//		for (int i = 0; i < dao.listContact(1, 3).size(); i++) {
//			System.out.println(dao.listContact(1, 3).get(i).toString());
//		}
		dao.updateState("PH2");
	}

}
