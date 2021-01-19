package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.DataSource;
import model_ConnectDB.ExecuteCRUD;
import model_beans.Order;
import model_beans.OrderDetail;

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
		if (newOrder.getCustomerID() != null) {
			customerID = newOrder.getCustomerID();
		}
		String query = "INSERT INTO DONHANG VALUES(?,?,?,?,?,?,?,?," + customerID + ")";
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

	public boolean addOrderDetail(OrderDetail orderDetail) {

		String query = "INSERT INTO CTDH VALUES(?,?,?,?)";
		try (ResultSet rs = super.ExecuteQuery(query, //
				orderDetail.getOrderID().trim(), //
				orderDetail.getProductID().trim(), //
				orderDetail.getColorID().trim(), //
				orderDetail.getQuantity())) {

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public int totalOrder() {
		String query = "SELECT COUNT(*) DONHANG";
		int total = 0;
		try (ResultSet rs = super.ExecuteQueryNonParameter(query)) {
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;

	}

	public ArrayList<OrderDetail> getOrderDetail(String orderID) {
		ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
		String query = "SELECT * FROM CTDH WHERE MaDH = ? ";
		try (ResultSet rs = super.ExecuteQuery(query, orderID.trim())) {
			while (rs.next()) {
				list.add(new OrderDetail(//
						rs.getString(1).trim(), //
						rs.getString(2).trim(), //
						rs.getString(3).trim(), //
						rs.getInt(4)));//
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Order> getListOrder(int start, int end) {
		ArrayList<Order> list = new ArrayList<Order>();
		String query = "SELECT * FROM  (SELECT ROW_NUMBER() OVER (ORDER BY NGAYLAP DESC) AS STT ,* FROM  DONHANG) AS X  WHERE STT BETWEEN ? AND ? ";
		try (ResultSet rs = super.ExecuteQuery(query, start, end)) {
			while (rs.next()) {
				
				
				list.add(new Order(//
						rs.getString(2).trim(), //
						rs.getString(3), //
						rs.getString(4), //
						rs.getString(5), ///
						rs.getInt(6), //
						rs.getString(7), //
						rs.getString(8), //
						rs.getString(9), //
						rs.getInt(10) + "")//

				);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
