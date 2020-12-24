package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model_beans.Account;
import model_utility.Config;
import model_utility.Const;
import model_utility.Encrypt;
import model_ConnectDB.ExecuteStatementUtility;

public class DAO_Account extends ExecuteStatementUtility {

	// Tên bảng trong database
	private final String ACCOUNT = "taikhoan";
	// tên các cột của bảng ACCOUNT
	private final String CUSTOMERID = "MAKH";
	private final String EMAIL = "email";
	private final String ENCRYT_PASSWORD = "matKhau";
	private final String ROLE = "quyenHan";
	private final String STATUS = "trangThai";
	private final String TIMECREATE = "THOIGIANTAO";
	private final String NAME = "ten";
	private final String PHONE = "SDT";
	private final String ADDRESS = "diaChi";
	private final String TOKEN = "TOKENREMEMBER";

	private static DAO_Account daoAccount = null;

	public static DAO_Account getDaoAccount() {
		if (daoAccount == null) {
			daoAccount = new DAO_Account();
		}
		return daoAccount;
	}

	protected DAO_Account() {
	}

	public void add(Account acc) {
		try {
			String query = "INSERT INTO " + ACCOUNT + " VALUES(?,?,?,?,?,?,?,?,?)";
			String[] parameters = { //
					acc.getEmail(), //
					acc.getPassword(), //
					acc.getStatus(), //
					acc.getTimeCreate(), //
					acc.getRole(), //
					acc.getName(), //
					acc.getPhoneNumber(), //
					acc.getAddress(), //
					acc.getTokenLogin() //
			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(String id) {
		// TODO Auto-generated method stub

	}

	public Account getAccountByToken(String token) {
		String query = "SELECT * FROM " + ACCOUNT + " WHERE " + TOKEN + " = ? ";
		String[] para = { token };
		Account account = null;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Account acc = new Account( //
						rs.getString(EMAIL), //
						rs.getString(ENCRYT_PASSWORD), //
						rs.getString(ROLE), //
						rs.getString(STATUS), //
						rs.getString(TIMECREATE), //
						rs.getString(NAME), //
						rs.getString(PHONE), //
						rs.getString(ADDRESS), //
						rs.getString(TOKEN)//
				);//
				account = acc;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return account;
	}

	public void update(Account newAcc) {
		String query = "UPDATE " + ACCOUNT + " SET "//
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

	public void changeToken(Account Acc) {
		Acc.setTokenLogin(Encrypt.MD5(Encrypt.SHA1(Encrypt.rdText(99))));
		String query = "UPDATE " + ACCOUNT + " SET "//
				+ TOKEN + " = ? WHERE " + EMAIL + " = ? "; //
		Object[] parameters = { //
				Acc.getTokenLogin(), //
				Acc.getEmail() //
		};
		try (ResultSet rs = super.AccessDBstr(query, parameters)) {

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Account> search(String keyword, int start, int end) {
		List<Account> listAcc = new ArrayList<Account>();
		String query = "SELECT * FROM SEARCH(N'" + keyword + "'," + start + "," + end + ")";
		try (ResultSet rs = super.AccessDBstr(query)) {
			while (rs.next()) {
				Account acc = new Account( //
						rs.getString(CUSTOMERID), //
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
		List<Account> listAcc = new ArrayList<Account>();
		String query = "SELECT * FROM SEARCH(N'" + keyword + "')";
		try (ResultSet rs = super.AccessDBstr(query)) {
			while (rs.next()) {
				Account acc = new Account( //
						rs.getString(CUSTOMERID), //
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
		Account acc = get(email);
		if (acc != null) {
			return true;
		}

		return false;

	}

	public List<Account> get(int start, int end) {
		List<Account> listAcc = new ArrayList<Account>();
		String query = "SELECT * FROM " + " (SELECT ROW_NUMBER() OVER (ORDER BY ID DESC) AS STT ,* FROM " + ACCOUNT
				+ ") AS X " + " WHERE STT BETWEEN ? AND ? AND " + ROLE + " = '" + Const.CUSTOMER_ROLE + "'";
		Object[] para = { start, end };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Account acc = new Account( //
						rs.getString(CUSTOMERID), //
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

	public List<Account> getListAcountStatus(String status) {
		List<Account> listAcc = new ArrayList<Account>();
		String query = "SELECT * FROM " + ACCOUNT + " WHERE " + STATUS + " = ?";
		Object[] para = { status };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Account acc = new Account( //
						rs.getString(CUSTOMERID), //
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

	/**
	 * Trả về toàn bộ thông tin của user có email là tham số
	 */
	public Account get(String email) {
		String query = "SELECT * FROM " + ACCOUNT + " WHERE " + EMAIL + " = ? ";
		String[] para = { email };
		Account account = null;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Account acc = new Account( //
						rs.getString(EMAIL), //
						rs.getString(ENCRYT_PASSWORD), //
						rs.getString(ROLE), //
						rs.getString(STATUS), //
						rs.getString(TIMECREATE), //
						rs.getString(NAME), //
						rs.getString(PHONE), //
						rs.getString(ADDRESS), //
						rs.getString(TOKEN)//
				);//
				account = acc;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return account;
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
		String query = "SELECT COUNT(*) FROM " + ACCOUNT + " WHERE  " + STATUS + " = ? AND  " + ROLE + "  = '"
				+ Const.CUSTOMER_ROLE + "' ";
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

	
	
}
