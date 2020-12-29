package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;

import model_beans.Branch;

public class DAO_Branch extends ExecuteStatementUtility{
	
	public ArrayList<Branch> listBranch(int start, int end) {
		ArrayList<Branch> list = new ArrayList<Branch>();
		String[] para = { start + "", end + "" };
		String query = "    WITH X AS (select ROW_NUMBER() OVER (ORDER BY MATH ASC) AS STT,* FROM THUONGHIEU ) SELECT * FROM X WHERE STT BETWEEN ? AND ?\r\n"
				+ "";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				list.add(new Branch(rs.getString("MATH").trim(), rs.getString("TENTH"), rs.getInt("SLDT"), rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	

	public ArrayList<Branch> listSeach(String keyword,int start, int end) {
		ArrayList<Branch> list = new ArrayList<Branch>();
		String[] para = { keyword,start + "", end + "" };
		String query = "SELECT * FROM SEARCHBRANCH(?,?,?)";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				list.add(new Branch(rs.getString("MATH").trim(), rs.getString("TENTH"), rs.getInt("SLDT"), rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public static void main(String[] args) {
		DAO_Branch dao = new DAO_Branch();
//		for (int i = 0; i < dao.listBranch(1, 10).size(); i++) {
//			System.out.println(dao.listBranch(1, 10).get(i).toString());
//		}
		for (int i = 0; i < dao.listSeach("còn kinh doanh", 1, 2).size(); i++) {
			System.out.println(dao.listSeach("còn kinh doanh", 1, 2).get(i).toString());
		}
	}

}	
