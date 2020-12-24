package model_ConnectDB;

import java.sql.Connection;
import java.sql.SQLException;

import model_DAO.DAO_Product;

public class DataSource {

	// POOL Này dùng cho toàn web size
	private static final ConnectionPoolManager pool = new ConnectionPoolManager();

	public static Connection getConnection() {
		Connection connection = pool.getSingleConnectionFromPool();
		return connection;
	}

	public static void returnConnection(Connection connection) {
		pool.returnConnectionToPool(connection);
	}

	
	
	
}
