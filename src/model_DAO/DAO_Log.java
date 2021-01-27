package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteCRUD;

import model_beans.Log;

public class DAO_Log extends ExecuteCRUD {

	public ArrayList<Log> listLog(int start, int end) {
		ArrayList<Log> list = new ArrayList<Log>();
		String query = "WITH X AS (select ROW_NUMBER() OVER (ORDER BY LICHSU_THAOTAC.mals ASC) AS STT,  LICHSU_THAOTAC.*,TAIKHOAN.TENND from LICHSU_THAOTAC inner join TAIKHOAN on TAIKHOAN.id = LICHSU_THAOTAC.MANV) SELECT * FROM X WHERE STT BETWEEN ? AND ? ";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
			while (rs.next()) {
				list.add(new Log(rs.getString(3),  rs.getString(7), rs.getString(5), rs.getString(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		System.out.println(new DAO_Log().listLog(1, 10));
	}
}
