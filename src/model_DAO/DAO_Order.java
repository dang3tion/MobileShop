package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import model_ConnectDB.DataSource;
import model_ConnectDB.ExecuteCRUD;
import model_beans.Order;

public class DAO_Order extends ExecuteCRUD {

	private static DAO_Order dao = null;

	public static DAO_Order getDAO_Order() {
		if (dao == null) {
			dao = new DAO_Order();
		}
		return dao;
	}

	private DAO_Order() {

	}

	public boolean addNewOrder(Order newOrder) {
		String customerID = "null";
		if (newOrder.getCustomerID()!=null) {
			customerID = newOrder.getCustomerID();
		}
		String query = "INSERT INTO DONHANG VALUES(?,?,?,?,?,?,?,?,"+customerID+")";
		try (ResultSet rs = super.ExecuteQuery(query, //
				newOrder.getOrderID().trim(), //
				newOrder.getName(), //
				newOrder.getAddress(), //
				newOrder.getPhoneNumber(), //
				newOrder.getTotalMoney(), //
				newOrder.getTimeCreate(), //
				newOrder.getPaymentMethods(), //
				newOrder.getStatus() //
		)) {

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean addOrderDetail(String orderID, String productID, String colorID, int quantity) {
		
		String query = "INSERT INTO CTDH VALUES(?,?,?,?)";
		try (ResultSet rs = super.ExecuteQuery(query, orderID.trim(), productID.trim(), colorID.trim(), quantity)) {

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}



}
