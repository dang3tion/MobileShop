
// c SQL_JDBC bằng maven
// <dependency>
// <groupId>com.microsoft.sqlserver</groupId>
// <artifactId>mssql-jdbc</artifactId>
// <version>8.4.1.jre11</version>
// </dependency>

package model_ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ExecuteCRUD {

	/**
	 * @implNote CHỈ DÙNG TRONG TRƯỜNG HỢP DANH SÁCH THAM SỐ ĐỀU LÀ STRING
	 * @param query      : câu lệnh UDATE chứa "?" làm tham số (String)
	 * @param parameters : danh sách tham số theo thứ tự.
	 * @return : trả về 1 ResultSet, null đối với câu lệnh Update, delete
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public ResultSet ExecuteQuery(String query, Object... parameters) {
		ResultSet resultSet = null;
		Connection con = null;
		try {
			con = DataSource.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			int i = 0;
			for (Object object : parameters) {
				if (object instanceof String) {
					stmt.setString(i + 1, (String) object);
				}
				if (object instanceof Integer) {
					stmt.setInt(i + 1, (Integer) object);
				}
				i++;

			}
			if (query.toLowerCase().contains("select")) {
				resultSet = stmt.executeQuery();
			} else {
				stmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			DataSource.returnConnection(con);
		}
		return resultSet;
	}

	/**
	 * @implNote CHỈ DÙNG TRONG TRƯỜNG HỢP DANH SÁCH THAM SỐ ĐỀU LÀ STRING
	 * @param query : câu truy vấn không chứa tham số (String)
	 * @return : trả về 1 ResultSet, null đối với câu lệnh delete
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public ResultSet ExecuteQueryNonParameter(String query) {
		ResultSet resultSet = null;
		Connection con = null;
		try {
			con = DataSource.getConnection();
			Statement stmt = con.createStatement();
			if (query.toLowerCase().contains("select")) {
				resultSet = stmt.executeQuery(query);
			} else {
				stmt.executeUpdate(query);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataSource.returnConnection(con);
		}
		return resultSet;
	}

}