
// c SQL_JDBC bằng maven
// <dependency>
// <groupId>com.microsoft.sqlserver</groupId>
// <artifactId>mssql-jdbc</artifactId>
// <version>8.4.1.jre11</version>
// </dependency>

package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.utility.Config;

/**
 * @description khi sử dụng method -->AccessDBstr<-- của class này phải đặt
 *              trong câu lệnh "try-with-resource" để đóng kết nối sau
 *              khi kết thúc hàm.
 *
 */
public class ConnectDB {

	// ===> Dùng Single Connection cho hệ thống nhỏ
	// ===> Khi nào lượng Customer tăng cao nâng cấp thành Connection Pool

	public String URL = Config.SERVER_NAME + ";databaseName=" + Config.DATABASE_NAME;

	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(Config.DBDRIVER);
			connection = DriverManager.getConnection(URL, Config.USERNAME_DB, Config.PASSWORD_DB);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * @implNote CHỈ DÙNG TRONG TRƯỜNG HỢP DANH SÁCH THAM SỐ ĐỀU LÀ STRING
	 * @param query      : câu lệnh UDATE chứa "?" làm tham số (String)
	 * @param parameters : danh sách tham số theo thứ tự.
	 * @return : trả về 1 ResultSet, null đối với câu lệnh Update, delete
	 * @throws SQLException
	 */
	public ResultSet AccessDBstr(String query, Object[] parameters) {
		ResultSet resultSet = null;
		try {
			Connection con = getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			for (int i = 0; i < parameters.length; i++) {
				stmt.setString(i + 1, parameters[i].toString());
			}
			if (query.toLowerCase().contains("select")) {
				resultSet = stmt.executeQuery();
			} else {
				stmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}

	/**
	 * @implNote CHỈ DÙNG TRONG TRƯỜNG HỢP DANH SÁCH THAM SỐ ĐỀU LÀ STRING
	 * @param query : câu truy vấn không chứa tham số  (String)
	 * @return : trả về 1 ResultSet, null đối với câu lệnh delete
	 * @throws SQLException
	 */
	public ResultSet AccessDBstr(String query) {
		ResultSet resultSet = null;
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			if (query.toLowerCase().contains("select")) {
				resultSet = stmt.executeQuery(query);
			} else {
				stmt.executeUpdate(query);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}

}