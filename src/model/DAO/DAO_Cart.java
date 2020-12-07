package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.beans.CartItem;

public class DAO_Cart extends ConnectDB {
	private final String CART = "cart";
	private final String EMAIL = "email";
	private final String PRODUCTID = "maSP";
	private final String QUANTITY = "soLuong";

	private String email;

	public DAO_Cart(String email) {
		this.email = email;
	}

	public void changeQuantity(String productID, int quantity) {
		String query = "UPDATE " + CART + " SET " + QUANTITY + " = ? WHERE " + EMAIL + " = ?  AND " + PRODUCTID
				+ " = ? ";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, quantity);
			stmt.setString(2, this.email);
			stmt.setString(3, productID);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public CartItem getItem(String productID) {
		CartItem item = null;
		String query = "SELECT * FROM " + CART + " WHERE " + EMAIL + " = ? AND " + PRODUCTID + " = ?";
		Object[] param = { this.email, productID };
		try (ResultSet rs = super.AccessDBstr(query, param)) {
			while (rs.next()) {
				item = new CartItem(rs.getString(PRODUCTID), rs.getInt(QUANTITY));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	private boolean isExist(String productID) {
		if (getItem(productID) != null) {
			return true;
		}
		return false;
	}

	public void addItemToCart(String productID) {
		if (isExist(productID)) {
			int currentQuantiy = getItem(productID).getQuantity();
			changeQuantity(productID, currentQuantiy + 1);
		} else {
			String query = "INSERT INTO " + CART + " VALUES( ?, ? , ? )";
			try {
				Connection con = super.getConnection();
				PreparedStatement stmt = con.prepareStatement(query);
				stmt.setString(1, this.email);
				stmt.setString(2, productID);
				stmt.setInt(3, 1);
				stmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void delete(String productID) {
		String query = "DELETE " + CART + " WHERE " + EMAIL + " = ? AND  " + PRODUCTID + " = ?";
		Object[] param = { this.email, productID };
		try (ResultSet rs = super.AccessDBstr(query, param)) {
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public ArrayList<CartItem> getCart() {
		ArrayList<CartItem> cart = new ArrayList<CartItem>();
		CartItem item = null;
		try (ResultSet rs = super.AccessDBstr("SELECT * FROM " + CART + " WHERE " + EMAIL + " = ? ",
				new Object[] { this.email })) {
			while (rs.next()) {
				item = new CartItem(rs.getString(PRODUCTID), rs.getInt(QUANTITY));
				cart.add(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}

	public void deleteCart() {
		try (ResultSet rs = super.AccessDBstr("DELETE " + CART + " WHERE " + EMAIL + " = ? ",
				new Object[] { this.email })) {

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
