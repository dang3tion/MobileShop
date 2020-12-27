package model_BO_service;

import java.util.ArrayList;

import model_DAO.DAO_Branch;
import model_beans.Branch;

public class BO_Branch {
	DAO_Branch dao = new DAO_Branch();
	public ArrayList<Branch> getListBranch(int start, int end) {
		return dao.listBranch(start, end);
	}
	public static void main(String[] args) {
		BO_Branch dao = new BO_Branch();
		for (int i = 0; i < dao.getListBranch(1, 10).size(); i++) {
			System.out.println(dao.getListBranch(1, 10).get(i).toString());
		}
	}
}
