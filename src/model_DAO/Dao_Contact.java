package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import model_ConnectDB.ExecuteCRUD;
import model_beans.Bean_Contact;

public class Dao_Contact extends ExecuteCRUD {

	public void addContact(Bean_Contact contact) {
		LocalDate localDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = localDate.format(formatter);
		try {
			String query = "INSERT INTO " + "PHANHOI" + " VALUES(?,?,?,?,?,?)";
			String[] parameters = { contact.getEmail(), contact.getName(), contact.getNumberPhone(), date,
					contact.getContent(), "Chưa phản hồi" };

			try (ResultSet rs = super.ExecuteQuery(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Bean_Contact> listContact(int start, int end) {
		ArrayList<Bean_Contact> list = new ArrayList<Bean_Contact>();
		String query = " WITH X AS (select ROW_NUMBER() OVER (ORDER BY PHANHOI.trangthai ASC, THOIGIAN DESC) AS STT,* FROM PHANHOI ) SELECT * FROM X WHERE STT BETWEEN ? AND ?\r\n"
				+ "";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
			while (rs.next()) {
				list.add(new Bean_Contact(rs.getString("STT"), rs.getString("MAPH").trim(), rs.getString("HOTEN"),
						rs.getString("EMAIL"), rs.getString("SDT"), rs.getString("THOIGIAN"), rs.getString("LOINHAN"),
						rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<Bean_Contact> listSearch(String keyword, int start, int end) {
		ArrayList<Bean_Contact> list = new ArrayList<Bean_Contact>();
		String query = "WITH X AS (select ROW_NUMBER() OVER (ORDER BY trangthai ASC, THOIGIAN DESC) AS STT,* FROM SEARCHFBACK(N'"
				+ keyword + "') ) SELECT * FROM X WHERE STT BETWEEN ? AND ?\r\n" + "";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
			while (rs.next()) {
				list.add(new Bean_Contact(rs.getString("STT"), rs.getString("MAPH").trim(), rs.getString("HOTEN"),
						rs.getString("EMAIL"), rs.getString("SDT"), rs.getString("THOIGIAN"), rs.getString("LOINHAN"),
						rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public void updateState(String id) {
		try {
			String query = " UPDATE PHANHOI SET TRANGTHAI = N'Đã phản hồi' WHERE MAPH = ?";
			try (ResultSet rs = super.ExecuteQuery(query, id)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteFeedback(String id) {
		try {
			String query = "DELETE FROM PHANHOI WHERE MAPH = ?";
			try (ResultSet rs = super.ExecuteQuery(query, id)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
