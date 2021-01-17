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
		String query = "INSERT INTO DONHANG VALUES(?,?,?,?,?,?,?,?,?)";
		try (ResultSet rs = super.ExecuteQuery(query, //
				newOrder.getOrderID(), //
				newOrder.getName(), //
				newOrder.getAddress(), //
				newOrder.getPhoneNumber(), //
				newOrder.getTotalMoney(), //
				newOrder.getTimeCreate(), //
				newOrder.getPaymentMethods(), //
				newOrder.getStatus(), //
				newOrder.getCustomerID()//
		)) {

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
	public boolean addOrderDetail(String orderID, String productID, String quantity) {
		String query = "INSERT INTO CTDH VALUES(?,?,?)";
		try (ResultSet rs = super.ExecuteQuery(query, orderID, productID, quantity
		)) {

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	
	public static void main(String[] args) {
		System.out.println(DataSource.getConnection());
		new DAO_Order().addNewOrder(new Order("dsdsadasd", "sdfsdff", "dffdasda", "3653454", 42221, "2011-12-12", "xcxczxc", "ádsadsad", 3));
	}
	
}
