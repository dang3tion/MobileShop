package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.DataSource;
import model_ConnectDB.ExecuteCRUD;
import model_beans.Cart;
import model_beans.Order;
import model_beans.OrderDetail;
import model_beans.Product_form;
import model_beans.Product_main;

public class DAO_Order extends ExecuteCRUD {

	private static DAO_Order daoOrder = null;

	private static DAO_Product_main daoProductMain = DAO_Product_main.getDao_Product_main();

	public static DAO_Order getDAO_Order() {
		if (daoOrder == null) {
			daoOrder = new DAO_Order();
		}
		return daoOrder;
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

				Order order = new Order(//
						rs.getString(2).trim(), //
						rs.getString(3), //
						rs.getString(4), //
						rs.getString(5), ///
						rs.getInt(6), //
						rs.getString(7), //
						rs.getString(8), //
						rs.getString(9), //
						rs.getInt(10) + "");

				if (order.getCustomerID().equals("0")) {
					order.setCustomerID("Không đăng nhập");
				}
				order.setOrderDetail(getOrderDetail(order.getOrderID()));
				order.setListProduct(getListInstanceProductInCart(order.getOrderDetail()));

				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Product_form> getListInstanceProductInCart(ArrayList<OrderDetail> ListorderDetail) {
		ArrayList<Product_form> listProduct = new ArrayList<Product_form>();
		for (OrderDetail orderDetail : ListorderDetail) {
			Product_main product = daoProductMain.getProduct_main(orderDetail.getProductID());
			String color = daoProductMain.getColorName(orderDetail.getColorID());
			Product_form product_form = new Product_form();

			product_form.setId(product.getID());
			product_form.setName(product.getName());
			product_form.setNameBranch(product.getBranch().getName());
			product_form.setPrice(product.getPrices().getPrice());
			product_form.setImg(daoProductMain.getURLthumbnail(orderDetail.getProductID(), orderDetail.getColorID()));
			product_form.setColorID(orderDetail.getColorID());
			product_form.setColor(color);
			product_form.setQuantityInCart(orderDetail.getQuantity());

			listProduct.add(product_form);
		}
		return listProduct;
	}

	public boolean switchOrderStatus(String orderID) {
		String currentOrderStatus = "";

		try (ResultSet rs = super.ExecuteQuery("select TRANGTHAI from DONHANG Where MaDH = ?", orderID)) {
			if (rs.next()) {
				currentOrderStatus = rs.getString(1).trim();
			}	
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		switch (currentOrderStatus) {
		case value:
			
			break;

		default:
			break;
		}
		
		try(ResultSet rs = super.ExecuteQuery("update DONHANG set TRANGTHAI = ? where MaDH = ? ", newOrderStatus, orderID) ) {
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	

	}

}
