package model_DAO;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteCRUD;
import model_beans.Branch;

public class DAO_Branch extends ExecuteCRUD  {

	private static DAO_Branch dao_Branch = null;

	private DAO_Branch() {

	}

	public static DAO_Branch getDAO_Branch() {
		if (dao_Branch == null) {
			dao_Branch = new DAO_Branch();
		}
		return dao_Branch;
	}

	public ArrayList<Branch> listBranch(int start, int end) {
		ArrayList<Branch> list = new ArrayList<Branch>();
		String query = "    WITH X AS (select ROW_NUMBER() OVER (ORDER BY MATH ASC) AS STT,* FROM THUONGHIEU ) SELECT * FROM X WHERE STT BETWEEN ? AND ? ";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
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
		String query = "SELECT * FROM SEARCHBRANCH(?,?,?)";
		try (ResultSet rs = super.ExecuteQuery(query, keyword, start, end)) {
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
		String query = "SELECT * FROM THUONGHIEU WHERE MATH = ?";
		Branch branch = null;
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
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
				String query = "UPDATE THUONGHIEU SET TRANGTHAI = N'Ngừng kinh doanh' WHERE MATH = ?";
				String query1 = "UPDATE SANPHAM SET TINHTRANG = N'Ngưng kinh doanh' WHERE MATH = ? AND TINHTRANG = N'Đang bán'";
				try (ResultSet rs = super.ExecuteQuery(query, id)) {
				}
				try (ResultSet rs = super.ExecuteQuery(query1, id)) {
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (check.equals("Ngừng kinh doanh")) {
			try {
				String query = "UPDATE THUONGHIEU SET TRANGTHAI = N'Còn kinh doanh' WHERE MATH = ?";
				String query1 = "UPDATE SANPHAM SET TINHTRANG = N'Đang bán' WHERE MATH = ? AND TINHTRANG = N'Ngưng kinh doanh'";
				try (ResultSet rs = super.ExecuteQuery(query, id)) {
				}
				try (ResultSet rs = super.ExecuteQuery(query1, id)) {
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// Dùng cho thanh menu
	public ArrayList<Branch> getAllBranch() {
		ArrayList<Branch> listBranch = new ArrayList<Branch>();
		String query = "SELECT MATH, TENTH FROM THUONGHIEU";
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			while (rs.next()) {
				Branch brand = new Branch();
				brand.setId(rs.getString("MATH").trim());
				brand.setName(rs.getString("TENTH"));
				listBranch.add(brand);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listBranch;
	}

}
