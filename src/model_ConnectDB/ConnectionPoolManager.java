package model_ConnectDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model_utility.Config;
import model_utility.Const;

public class ConnectionPoolManager {

	// danh sách các single connection ĐANG TRỐNG trong một connection Pool
	private List<Connection> availableConnections = new ArrayList<Connection>();

	public ConnectionPoolManager() {
		while (!isMaxPool()) {
			availableConnections.add(createNewConnectionPool());
		}
	}

	public String getAvailableConnections() {
		return "available:" + availableConnections.size() + "/Max:" + Config.DB_MAX_CONNECTIONS;
	}

	private synchronized boolean isMaxPool() {
		final int MAX_POOL_SIZE = Config.DB_MAX_CONNECTIONS;

		if (availableConnections.size() < MAX_POOL_SIZE) {
			return false;
		}

		return true;
	}

	// Tạo mới 1 single connection
	private Connection createNewConnectionPool() {
		String URL = Config.SERVER_NAME + ";databaseName=" + Config.DATABASE_NAME;
		Connection connection = null;
		try {
			Class.forName(Config.DBDRIVER);
			connection = DriverManager.getConnection(URL, Config.USERNAME_DB, Config.PASSWORD_DB);
			return connection;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Thực hiện câu truy vấn SQL bằng connection này ( lấy ra từ list connection )
	public synchronized Connection getSingleConnectionFromPool() {
		Connection connection = null;
		if (availableConnections.size() > 0) {
			connection = (Connection) availableConnections.get(0);
			availableConnections.remove(0);
		}
		return connection;
	}

	// Hoàn trả single Connection về Pool sau khi sử dụng xong ( list avail tăng lên
	// 1 ).
	public synchronized void returnConnectionToPool(Connection connection) {
		if (connection != null) {
			availableConnections.add(connection);
		}
	}
	


}