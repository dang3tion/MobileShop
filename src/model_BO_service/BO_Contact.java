package model_BO_service;

import model_DAO.Dao_Contact;
import model_beans.Bean_Contact;

public class BO_Contact {
Dao_Contact dao = new Dao_Contact();
	
	public void addFeedback(String name, String email,String numberPhone,String content) {
		dao.addEvaluate(new Bean_Contact(name, email, numberPhone, content));
	}
	
}
