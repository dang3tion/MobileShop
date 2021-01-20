package model_DAO;

import java.awt.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.StringTokenizer;

import model_ConnectDB.ExecuteCRUD;
import model_beans.Statictical;

public class DAO_HOME_ADMIN extends ExecuteCRUD {

	// tổng doanh thu
	public int totalMoney() {
		int sum = 0;
		String query = "select sum(TONGIA) from DONHANG";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	// tổng số sản phẩm đã bán
	public int productSaled() {
		int sum = 0;
		String query = "select SUM(SOLUONG) from CTDH inner join DONHANG on CTDH.MADH = DONHANG.MADH where TRANGTHAI = 'complete'  ";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	// tổng số lượt truy cập
	public int sumAccess() {
		int sum = 0;
		String query = "select SUM(SOLUOT) from LUOTTRUYCAP";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				sum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	public String yearStart() {
		String year = "";
		String query = "select ngaybatdau from THONGTIN_SHOP";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				year = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return year;

	}

	public int monthOfBetween() {
		LocalDate dateNow = LocalDate.now();
		StringTokenizer token = new StringTokenizer(yearStart(), "-");
		LocalDate date = LocalDate.of(Integer.parseInt(token.nextToken()), Integer.parseInt(token.nextToken()),
				Integer.parseInt(token.nextToken()));
		int timeMonth = dateNow.getMonthValue() - date.getMonthValue();

		int year = dateNow.getYear() - date.getYear();
		int numMonth = (year * 12) + timeMonth;
		return numMonth;
	}

	public int avgTotalMoney() {
		return totalMoney() / monthOfBetween();
	}

	// list tháng, năm
	public ArrayList<String> listDate() {
		ArrayList<String> list = new ArrayList<String>();
		LocalDate dateNow = LocalDate.now();
		StringTokenizer token = new StringTokenizer(yearStart(), "-");
		LocalDate date = LocalDate.of(Integer.parseInt(token.nextToken()), Integer.parseInt(token.nextToken()),
				Integer.parseInt(token.nextToken()));

		int yearNow = dateNow.getYear();

		int yeared = date.getYear();
		int monthNow = dateNow.getMonthValue();

		int monthed = date.getMonthValue();
		int checkYear = yeared;
		int checkMonth = monthed;

		if (monthNow == 1) {
			while (checkYear != yearNow && monthNow != checkMonth) {
				if (checkYear == yeared) {
					for (int i = monthed; i <= 12; i++) {
						list.add(i + "-" + checkYear);
					}
					checkYear++;
				} else {

					for (int i = 1; i <= 12; i++) {
						list.add(i + "-" + checkYear);
					}
					checkYear++;
				}

			}
			list.add("1-" + checkYear);
		} else {
			while (checkYear != yearNow && monthNow != checkMonth) {
				if (checkYear == yeared) {
					for (int i = monthed; i <= 12; i++) {
						list.add(i + "-" + checkYear);
					}
					checkYear++;
				} else {

					if (checkYear == yearNow) {
						System.out.println("haha");
						for (int i = 1; i <= monthNow; i++) {
							list.add(i + "-" + checkYear);
						}
						checkYear++;
					} else {
						for (int i = 1; i <= 12; i++) {
							list.add(i + "-" + checkYear);
						}
						checkYear++;
					}
				}
			}
		}

		return list;
	}
	//lấy tổng từng tháng
	
	// tổng doanh thu
		public int totalMoneyMonth(String date) {
			int sum = 0;
			StringTokenizer dte = new StringTokenizer(date, "-");
			String query = "select sum(TONGIA) from DONHANG where MONTH(NGAYLAP) = ? and YEAR(NGAYLAP) = ?";
			try (ResultSet rs = super.ExecuteQuery(query,dte.nextToken(),dte.nextToken())) {
				if (rs.next()) {
					sum = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return sum;
		}
	
		// tổng số sản phẩm đã bán trong tháng
		public int productSaledMonth(String date) {
			int sum = 0;
			StringTokenizer dte = new StringTokenizer(date, "-");
			String query = "select SUM(SOLUONG) from CTDH inner join DONHANG on CTDH.MADH = DONHANG.MADH where TRANGTHAI = 'complete' and MONTH(DONHANG.NGAYLAP) = ? and YEAR(donhang.NGAYLAP) = ?";
			try (ResultSet rs = super.ExecuteQuery(query,dte.nextToken(),dte.nextToken())) {
				if (rs.next()) {
					sum = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return sum;
		}
		
		// tổng số lượt truy cập từng tháng
		public int sumAccessMonth(String date) {
			int sum = 0;
			StringTokenizer dte = new StringTokenizer(date, "-");
			String query = "select SUM(SOLUOT) from LUOTTRUYCAP where MONTH(NGAY) = ? and YEAR(NGAY) = ?";
			try (ResultSet rs = super.ExecuteQuery(query,dte.nextToken(),dte.nextToken())) {
				if (rs.next()) {
					sum = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return sum;
		}

	public ArrayList<Statictical> listSta(int start,int end){
		ArrayList<Statictical> list  = new ArrayList<Statictical>();
		if (end>listDate().size()) {
			for (int i = listDate().size()-1; i >=start; i--) {
				String date = listDate().get(i);
				list.add(new Statictical(date, totalMoneyMonth(date), productSaledMonth(date), sumAccessMonth(date)));	
			}
		}else {
			for (int i = end; i >=start; i--) {
				String date = listDate().get(i);
				list.add(new Statictical(date, totalMoneyMonth(date), productSaledMonth(date), sumAccessMonth(date)));	
			}
		}
		
		return list;
	}
	public static void main(String[] args) {
		DAO_HOME_ADMIN dao = new DAO_HOME_ADMIN();
		System.out.println(dao.listDate());
		System.out.println(dao.listSta(1,200));
	}
}
