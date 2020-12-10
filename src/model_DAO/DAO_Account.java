package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model_beans.Admin;
import model_beans.Customer;



public class DAO_Account extends ConnectDB {

	// Tên bảng trong database
	private final String ACCOUNT = "khachhang";
	private final String ADMIN = "admin";
	// tên các cột của bảng KhachHang
	private final String ID = "MaKH";
	private final String EMAIL = "email";
	private final String ENCRYT_PASSWORD = "matKhau";
	private final String STATUS = "trangThai";
	private final String TIMECREATE = "thoiGianTao";
	private final String NAME = "ten";
	private final String PHONE = "SDT";
	private final String ADDRESS = "diaChi";
	private final String SEARCH = "SEARCH";
	// bảng admin
	private final String USERNAME = "tentaikhoan";

	public void add(Customer acc) {
		try {
			String query = "INSERT INTO " + ACCOUNT + " VALUES(?,?,?,?,?,?,?,?)";
			String[] parameters = { //
					acc.getEmail(), //
					acc.getPassword(), //
					acc.getStatus(), //
					acc.getTimeCreate(), //
					acc.getName(), //
					acc.getPhoneNumber(), //
					acc.getAddress() //
			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(String id) {
		try {
			String query = "DELETE " + ACCOUNT + " WHERE " + EMAIL + " = ? ";

			try (ResultSet rs = super.AccessDBstr(query, new String[] { id })) {
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

	public void update(Customer newAcc) {
		String query = "UPDATE " //
				+ ACCOUNT + " SET "//
				+ ENCRYT_PASSWORD + " = ? , " //
				+ STATUS + " = ? ,"//
				+ NAME + " = ? , "//
				+ PHONE + " = ? ,"//
				+ ADDRESS + " = ? WHERE " + EMAIL + " = ? "; //
		Object[] parameters = { //
				newAcc.getPassword(), //
				newAcc.getStatus(), //
				newAcc.getName(), //
				newAcc.getPhoneNumber(), //
				newAcc.getAddress(), //
				newAcc.getEmail()//
		};
		try (ResultSet rs = super.AccessDBstr(query, parameters)) {

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Customer> search(String keyword, int start, int end) {
		List<Customer> listAcc = new ArrayList<Customer>();
		String query = "SELECT " //
				+ ID + "," //
				+ EMAIL + "," //
				+ STATUS + ","//
				+ TIMECREATE + "," //
				+ NAME + "," //
				+ PHONE + "," //
				+ ADDRESS//
				+ " FROM " + SEARCH + "(N'" + keyword + "'," + start + "," + end + ")";
		try (ResultSet rs = super.AccessDBstr(query)) {
			while (rs.next()) {
				Customer acc = new Customer( //
						rs.getString(ID), //
						rs.getString(EMAIL), //
						rs.getString(STATUS), //
						rs.getString(TIMECREATE), //
						rs.getString(NAME), //
						rs.getString(PHONE), //
						rs.getString(ADDRESS)//
				);//

				listAcc.add(acc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listAcc;
	}

	public int totalSearch(String keyword) {
		List<Customer> listAcc = new ArrayList<Customer>();
		String query = "SELECT * FROM " + SEARCH + "(N'" + keyword + "','2','99')";
		try (ResultSet rs = super.AccessDBstr(query)) {
			while (rs.next()) {
				Customer acc = new Customer( //
						rs.getString(ID), //
						rs.getString(EMAIL), //
						rs.getString(STATUS), //
						rs.getString(TIMECREATE), //
						rs.getString(NAME), //
						rs.getString(PHONE), //
						rs.getString(ADDRESS)//
				);//

				listAcc.add(acc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listAcc.size();
	}

	public boolean isExist(String email) {
		Customer acc = getCustomerInfo(email);
		if (acc != null) {
			return true;
		}

		return false;

	}

	public List<Customer> getListAccount(int start, int end) {
		List<Customer> listAcc = new ArrayList<Customer>();
		String query = "SELECT "//
				+ ID + "," //
				+ EMAIL + "," //
				+ STATUS + ","//
				+ TIMECREATE + "," //
				+ NAME + "," //
				+ PHONE + "," //
				+ ADDRESS + " FROM " + " (SELECT ROW_NUMBER() OVER (ORDER BY " + TIMECREATE + " DESC) AS STT ,* FROM "
				+ ACCOUNT + ") AS X " + " WHERE STT BETWEEN ? AND ? ";
		Object[] para = { start, end };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Customer acc = new Customer( //
						rs.getString(ID), //
						rs.getString(EMAIL), //
						rs.getString(STATUS), //
						rs.getString(TIMECREATE), //
						rs.getString(NAME), //
						rs.getString(PHONE), //
						rs.getString(ADDRESS)//
				);//

				listAcc.add(acc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listAcc;
	}

	public List<Customer> getListAcountStatus(String status) {
		List<Customer> listAcc = new ArrayList<Customer>();
		String query = "SELECT " //
				+ ID + "," //
				+ EMAIL + "," //
				+ STATUS + ","//
				+ TIMECREATE + "," //
				+ NAME + "," //
				+ PHONE + "," //
				+ ADDRESS//
				+ " FROM " + ACCOUNT + " WHERE " + STATUS + " = ? ";
		Object[] para = { status };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Customer acc = new Customer( //
						rs.getString(ID), //
						rs.getString(EMAIL), //
						rs.getString(STATUS), //
						rs.getString(TIMECREATE), //
						rs.getString(NAME), //
						rs.getString(PHONE), //
						rs.getString(ADDRESS)//
				);//

				listAcc.add(acc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listAcc;
	}

	public Customer getCustomerInfo(String email) {
		String query = "SELECT * FROM " + ACCOUNT + " WHERE " + EMAIL + " = ? ";
		try (ResultSet rs = super.AccessDBstr(query, new String[] { email })) {
			while (rs.next()) {
				return new Customer( //
						rs.getString(ID), //
						rs.getString(EMAIL), //
						rs.getString(STATUS), //
						rs.getString(TIMECREATE), //
						rs.getString(NAME), //
						rs.getString(PHONE), //
						rs.getString(ADDRESS)//
				);//
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getTotal() {
		int total = 0;
		String query = "SELECT COUNT(*) FROM " + ACCOUNT;
		try (ResultSet rs = super.AccessDBstr(query)) {
			while (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	public int getTotalStatusAccount(String status) {
		int total = 0;
		String query = "SELECT COUNT(*) FROM " + ACCOUNT + " WHERE  " + STATUS + " = ?";
		Object[] para = { status };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}

	public Admin getAdmin(String username) {
		String query = "SELECT * FROM " + ADMIN + " WHERE  " + USERNAME + " = ? ";
		try (ResultSet rs = super.AccessDBstr(query, new String[] { username })) {
			while (rs.next()) {
				return new Admin(rs.getString(USERNAME), rs.getString(ENCRYT_PASSWORD));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}



	public Customer getCustomerLoginInfo(String email) {
		String query = "SELECT "//
				+ EMAIL + "," //
				+ ENCRYT_PASSWORD + "," //
				+ STATUS//
				+ " FROM " + ACCOUNT + " WHERE " + EMAIL + " = ? ";
		try (ResultSet rs = super.AccessDBstr(query, new String[] { email })) {
			while (rs.next()) {
				return new Customer( //
						rs.getString(EMAIL), //
						rs.getString(ENCRYT_PASSWORD), //
						rs.getString(STATUS));//
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	

	
}

//-- HÀM TÌM KIẾM THEO TỪ KHÓA
//CREATE FUNCTION SEARCH(@SEA NVARCHAR(1000),@start int,@end int)
//RETURNS TABLE 
//AS
//RETURN SELECT * FROM (SELECT  ROW_NUMBER() OVER (ORDER BY thoigiantao DESC) AS STT, * FROM KHACHHANG WHERE email LIKE N'%'+@SEA+'%' OR thoiGianTao LIKE N'%'+@SEA+'%'
//OR KHACHHANG.TEN LIKE N'%'+@SEA+'%' OR SDT LIKE N'%'+@SEA+'%' OR KHACHHANG.diachi LIKE N'%'+@SEA+'%' ) AS RESULT
//WHERE STT BETWEEN @start AND @END 
