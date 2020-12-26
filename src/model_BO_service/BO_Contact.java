package model_BO_service;

import java.util.ArrayList;

import model_DAO.Dao_Contact;
import model_beans.Bean_Contact;

public class BO_Contact {
	Dao_Contact dao = new Dao_Contact();

	public void addFeedback(String name, String email, String numberPhone, String content) {
		dao.addEvaluate(new Bean_Contact(name, email, numberPhone, content));
	}

	public ArrayList<Bean_Contact> listContact(int start, int end) {
		return dao.listContact(start, end);
	}

	public void updateState(String id) {
		dao.updateState(id);
	}
	
	public void delete(String id) {
		dao.deleteFeedback(id);
	}

}
