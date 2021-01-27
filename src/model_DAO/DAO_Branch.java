package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import model_BO_service.BO_Branch;
import model_ConnectDB.ExecuteCRUD;
import model_beans.Branch;

public class DAO_Branch extends ExecuteCRUD {

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
		String query = "WITH X AS (select ROW_NUMBER() OVER (ORDER BY MATH ASC) AS STT,* FROM THUONGHIEU ) SELECT * FROM X WHERE STT BETWEEN ? AND ? ";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
			while (rs.next()) {
				list.add(new Branch(rs.getString("STT"), rs.getString("MATH").trim(), rs.getString("TENTH"),
						countBranch(rs.getString("MATH")), rs.getString("TRANGTHAI")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public int countBranch(String id) {
		int count = 0;
		String query = "select COUNT(MATH) FROM SANPHAM WHERE MATH = ?";
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			count = 0;
		}

		return count;
	}

	public ArrayList<Branch> listSeach(String keyword, int start, int end) {
		ArrayList<Branch> list = new ArrayList<Branch>();
		String query = "SELECT * FROM SEARCHBRANCH(?,?,?)";
		try (ResultSet rs = super.ExecuteQuery(query, keyword, start, end)) {
			while (rs.next()) {
				list.add(new Branch(rs.getString("STT"), rs.getString("MATH").trim(), rs.getString("TENTH"),
						rs.getInt(countBranch(rs.getString("MATH"))), rs.getString("TRANGTHAI")));
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
				branch = new Branch(rs.getString("MATH").trim(), rs.getString("TENTH"), rs.getInt(countBranch(id)),
						rs.getString("TRANGTHAI"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return branch;
	}

	public String stateBranch(String id) {
		String state = "";
		String query = "select TRANGTHAI from THUONGHIEU where MATH = ?";
		try (ResultSet rs = super.ExecuteQuery(query, id)) {
			if (rs.next()) {
				state = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return state;

	}

	public void updateState(String id) {
		String check = stateBranch(id);
		if (check.equals("Đang kinh doanh")) {
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
				String query = "UPDATE THUONGHIEU SET TRANGTHAI = N'Đang kinh doanh' WHERE MATH = ?";
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
	// Tạo id tự động

	public String createId() {
		String query = "select count(MATH) from THUONGHIEU";
		String id = "";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				id = "TH" + (rs.getInt(1) + 1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	// thêm thương hiệu

	public void addBranch(String name) {
		String query = "insert into THUONGHIEU values (?,?,'0',N'Đang kinh doanh')";
		boolean check = false;
		if (!checkBranch(name)) {
			try (ResultSet rs = super.ExecuteQuery(query, createId(), name)) {
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// kiểm tra thương hiệu đã tồn tại hay chưa
	public boolean checkBranch(String name) {
		String query = "SELECT * FROM THUONGHIEU WHERE  TENTH = ?";
		boolean check = false;
		try (ResultSet rs = super.ExecuteQuery(query, name)) {
			if (rs.next()) {
				check = true;
			} else {
				check = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

}
