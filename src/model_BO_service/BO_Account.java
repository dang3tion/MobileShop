package model_BO_service;

import java.util.List;

import model_DAO.DAO_Account;
import model_beans.Account;
import model_utility.Config;
import model_utility.Const;
import model_utility.Encrypt;

public class BO_Account {

	private int pageNumber;
	private int numRowPerPage;
	private DAO_Account dao = DAO_Account.getDaoAccount();

	private static BO_Account boAccount = null;

	public static BO_Account getBoAccount() {
		if (boAccount == null) {
			boAccount = new BO_Account();
		}
		return boAccount;
	}

	protected BO_Account() {
	}

	// dùng để xuất danh sách tài khoản trong trang ADMIN
	public BO_Account(int pageNumber_str, int numRowPerPage_str) {
		this.pageNumber = pageNumber_str;
		this.numRowPerPage = numRowPerPage_str;
	}

	// chỉ get được thông tin customer
	public Account get(String email) {
		Account acc = dao.get(email);
		if (!acc.getRole().equals(Const.ADMIN_ROLE)) {
			return acc;
		}
		return null;
	}
	public Account getAdmin(String username) {
		Account acc = dao.get(username);
		if (acc.getRole().equals(Const.ADMIN_ROLE)) {
			return acc;
		}
		return null;
	}

	public Account getAccountByToken(String token) {
		return dao.getAccountByToken(token);
	}

	public void changeToken(Account acc) {
		dao.changeToken(acc);
	}

	public List<Account> getList() {
		List<Account> listAcc = dao.get(startRow(), endRow());
		return listAcc;

	}

	public boolean isExist(String email) {
		Account acc = dao.get(email);
		if (acc != null && !acc.getRole().equals(Const.ADMIN_ROLE)) {
			return true;
		}
		return false;
	}

	public void add(Account acc) {
		dao.add(acc);

	}

	/**
	 * @param email
	 * @param passwordPlaintext
	 * @param loại              tài khoản cần checks
	 * @return 1 là đăng nhập thành công. 2 là thông tin tài khoản không đúng. 3 là
	 *         tài khoản bị khóa
	 */
	public int checkLogin(String email, String passwordPlaintext, String roleCheck) {
		Account acc = dao.get(email);

		// kiểm tra mail
		if (acc != null) {
			String role = acc.getRole();
			String encrytPass = acc.getPassword();
			// kiểm tra trạng thái (có bị khóa không)
			if (role.equals(Const.CUSTOMER_ROLE)) {
				if (acc.getStatus().equals(Const.ACCONT_DISABLE)) {
					return 3;
				}
			}
			// kiểm tra quyền hạn
			if (!roleCheck.equals(role)) {
				return 2;
			}
			// kiểm tra pass
			if (Encrypt.MD5(passwordPlaintext).equals(encrytPass)) {
				return 1;
			}
		}
		return 2;
	}

	public void changePassword(String email, String passwordPlaintext) {
		Account acc = dao.get(email);
		acc.setPassword(Encrypt.MD5(passwordPlaintext));
		DAO_Account.getDaoAccount().update(acc);
	}

	public void update(Account acc) {
		DAO_Account.getDaoAccount().update(acc);
	}

	/**
	 * @param email
	 * @note : thường dùng kết hợp với hàm isExist()
	 */
	public boolean isDisable(String email) {
		Account acc = get(email);
		System.out.println(acc);
		if (acc.getStatus().equals(Const.ACCONT_DISABLE)) {
			return true;
		}
		return false;
	}

	// _____________________________________________________________________________
	public int getTotalAccount() {
		int total;
		// trừ acc admin

		total = DAO_Account.getDaoAccount().getTotal() - 1;

		return total;
	}

	public int getTotalStatusAccount(String status) {
		// trừ acc admin
		int total = dao.getTotalStatusAccount(status);
		return total;
	}

// dùng làm pagination
	public int totalPage() {
		int num = getTotalAccount() / numRowPerPage;

		if (getTotalAccount() % numRowPerPage > 1) {
			num += 1;
		}

		return num;
	}

	public int startRow() {
		int startRow = 0;
		if (pageNumber <= totalPage()) {
			startRow = endRow() - numRowPerPage + 1;
		}
		return startRow;
	}

	public int endRow() {
		int endRow = 0;
		if (pageNumber <= totalPage()) {
			endRow = pageNumber * numRowPerPage;
		}
		return endRow;
	}

//	public int totalSearch(String keyword) {
//		int total = dao.totalSearch(keyword);
//		return total;
//	}

//	public int totalPageSearch(String keyword) {
//		int num = totalSearch(keyword) / numRowPerPage;
//		return num;
//	}

	public void on_off_account(String email) {
		Account acc = get(email);
		if (acc.getStatus().equals(Const.ACCOUNT_ENABLE)) {
			acc.setStatus(Const.ACCONT_DISABLE);
			update(acc);
		} else {
			acc.setStatus(Const.ACCOUNT_ENABLE);
			update(acc);
		}

	}

	public List<Account> search(String keyword, int start, int end) {
		List<Account> listAcc = dao.search(keyword, start, end);
		return listAcc;

	}

	public List<Account> getListDisableAccount() {
		List<Account> listAcc = dao.getListAcountStatus(Const.ACCONT_DISABLE);
		return listAcc;
	}

//_____________________________________________________________________________

	
	
	
	
}
