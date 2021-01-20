package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Iterator;

import model_ConnectDB.ExecuteCRUD;

public class DAO_Access extends ExecuteCRUD {
	// cập nhật lượt truy cập trong ngày
	public boolean updateAccess() {
		boolean check = false;
		String date = LocalDate.now() + "";
		if (checkDate()) {
			String query = "UPDATE LUOTTRUYCAP SET SOLUOT = ? WHERE NGAY = ?";
			try (ResultSet rs = super.ExecuteQuery(query, (amoutAccess() + 1), date)) {

				check = true;

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			String query = "INSERT INTO LUOTTRUYCAP VALUES (?,?)";
			try (ResultSet rs = super.ExecuteQuery(query, date, "1")) {
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}

	// kiểm tra ngày đã tồn tại
	public boolean checkDate() {
		String date = LocalDate.now() + "";
		String query = "select * from LUOTTRUYCAP where NGAY = ?";
		try (ResultSet rs = super.ExecuteQuery(query, date)) {
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// lấy số lượt truy cập trong ngày
	public int amoutAccess() {
		int sum = 0;
		String query = "select * from LUOTTRUYCAP where NGAY = ?";
		String date = LocalDate.now() + "";
		try (ResultSet rs = super.ExecuteQuery(query, date)) {
			if (rs.next()) {
				sum = rs.getInt(2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

}
