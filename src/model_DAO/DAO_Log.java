package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	
	
	// cập nhật log
	public void update(String idStaff, String content,String detail) {
		String query = "insert into LICHSU_THAOTAC values ( ?,?,?,?,?)";
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		   LocalDateTime now = LocalDateTime.now();
		   String date = dtf.format(now);
		
		
		
		try (ResultSet rs = super.ExecuteQuery(query,createId(),date,idStaff,content,detail)) {
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//tạo id
	
	public int createId() {
		String query = "select count(*) from LICHSU_THAOTAC";
		try (ResultSet rs = super.ExecuteQuery(query)) {
			if (rs.next()) {
				return rs.getInt(1)+1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public static void main(String[] args) {
		new DAO_Log().update("1", "Chào mừng", "Thay đổi trạng thái");
	}
}
