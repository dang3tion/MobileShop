package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;

import model_beans.Branch;

public class DAO_Branch extends ExecuteStatementUtility {

	public ArrayList<Branch> listBranch(int start, int end) {
		ArrayList<Branch> list = new ArrayList<Branch>();
		String[] para = { start + "", end + "" };
		String query = "    WITH X AS (select ROW_NUMBER() OVER (ORDER BY MATH ASC) AS STT,* FROM THUONGHIEU ) SELECT * FROM X WHERE STT BETWEEN ? AND ?\r\n"
				+ "";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				list.add(new Branch(rs.getString("STT"), rs.getString("MATH").trim(), rs.getString("TENTH"),
						rs.getInt("SLDT"), rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<Branch> listSeach(String keyword, int start, int end) {
		ArrayList<Branch> list = new ArrayList<Branch>();
		String[] para = { keyword, start + "", end + "" };
		String query = "SELECT * FROM SEARCHBRANCH(?,?,?)";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				list.add(new Branch(rs.getString("STT"), rs.getString("MATH").trim(), rs.getString("TENTH"),
						rs.getInt("SLDT"), rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public Branch branch(String id) {
		String[] para = { id };
		String query = "SELECT * FROM THUONGHIEU WHERE MATH = ?";
		Branch branch = null;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				branch = new Branch(rs.getString("MATH").trim(), rs.getString("TENTH"), rs.getInt("SLDT"),
						rs.getString("TRANGTHAI"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return branch;
	}

	public void updateState(String id) {
		String check = branch(id).getState();
		if (check.equals("Còn kinh doanh")) {
			try {
				System.out.println("Ngưng");
				String query = "UPDATE THUONGHIEU SET TRANGTHAI = N'Ngừng kinh doanh' WHERE MATH = ?";
				String query1 = "UPDATE SANPHAM SET TINHTRANG = N'Ngưng kinh doanh' WHERE MATH = ? AND TINHTRANG = N'Đang bán'";
				String[] para = { id };
				try (ResultSet rs = super.AccessDBstr(query, para)) {
				}
				try (ResultSet rs = super.AccessDBstr(query1, para)) {
				}
	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (check.equals("Ngừng kinh doanh")) {
			try {
				System.out.println("còn");
				String query = "UPDATE THUONGHIEU SET TRANGTHAI = N'Còn kinh doanh' WHERE MATH = ?";
				String query1 = "UPDATE SANPHAM SET TINHTRANG = N'Đang bán' WHERE MATH = ? AND TINHTRANG = N'Ngưng kinh doanh'";
				String[] para = { id };
				try (ResultSet rs = super.AccessDBstr(query, para)) {
				}
				try (ResultSet rs = super.AccessDBstr(query1, para)) {
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		DAO_Branch dao = new DAO_Branch();
		dao.updateState("TH01");
	}

}
