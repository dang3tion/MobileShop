package model_BO_service;

import java.util.ArrayList;

import model_DAO.DAO_Branch;
import model_beans.Branch;

public class BO_Branch {
	DAO_Branch dao = DAO_Branch.getDAO_Branch();

	public ArrayList<Branch> getListBranch(int start, int end) {
		return dao.listBranch(start, end);
	}

	public ArrayList<Branch> getListSearch(String keyword, int start, int end) {
		return dao.listSeach(keyword, start, end);
	}

	public void updateState(String id) {
		dao.updateState(id);
	}

	public void addBranch(String name) {
		 dao.addBranch(name);
	}
	public boolean checkAdd(String name) {
		return dao.checkBranch(name);
	}
}
