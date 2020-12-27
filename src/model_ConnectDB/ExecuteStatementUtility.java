
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

public class ExecuteStatementUtility {

	/**
	 * @implNote CHỈ DÙNG TRONG TRƯỜNG HỢP DANH SÁCH THAM SỐ ĐỀU LÀ STRING
	 * @param query      : câu lệnh UDATE chứa "?" làm tham số (String)
	 * @param parameters : danh sách tham số theo thứ tự.
	 * @return : trả về 1 ResultSet, null đối với câu lệnh Update, delete
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public ResultSet AccessDBstr(String query, Object[] parameters) {
		ResultSet resultSet = null;
		Connection con = null;
		try {
			con = DataSource.getConnection();
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
	public ResultSet AccessDBstr(String query)    {
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

		} catch (SQLException  e) {
			e.printStackTrace();
		} finally {
			DataSource.returnConnection(con);
		}
		return resultSet;
	}
	
	
	public static void main(String[] args) {
		new ExecuteStatementUtility().AccessDBstr("INSERT INTO TEST VALUES( ? )", new String[] {"2020-12-15"});
	}
	
}