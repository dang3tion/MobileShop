package model_DAO;

import java.sql.ResultSet;
import java.time.format.DateTimeFormatter;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Bean_Contact;

public class Dao_Contact extends ExecuteStatementUtility {
	public void addEvaluate(Bean_Contact contact) {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String date = contact.getDate().format(formatter);
		System.out.println(date);
		try {
			String query = "INSERT INTO " + "PHANHOI" + " VALUES(?,?,?,?,?)";
			System.out.println(query);
			String[] parameters = { //
					contact.getEmail(),
					contact.getName(),
					contact.getNumberPhone(),
					date,
					contact.getContent()
			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		Dao_Contact dao = new Dao_Contact();
		dao.addEvaluate(new Bean_Contact("22dflkasdjkfsdf", "askdlfksdfksdkf", "1233", "cuong"));
	}
	
}
