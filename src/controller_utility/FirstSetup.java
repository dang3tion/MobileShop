package controller_utility;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import model_DAO.DAO_Branch;
import model_DAO.DAO_ShopInfo;
import model_beans.Cart;

public class FirstSetup implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		session.setAttribute("LANGUAGE", "vi_VN");
		Cart cart = new Cart();
		try {
			cart.add("SP01", "MS04");
			cart.add("SP01", "MS04");
			cart.add("SP02", "MS03");
			cart.add("SP02", "MS04");
			cart.add("SP02", "MS04");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.setAttribute("CART", cart);
		session.setAttribute("SHOPINFO", DAO_ShopInfo.getDaoShopInfo().getInfo());

		HashMap<String, Boolean> listProductsViewed = new HashMap<String, Boolean>();
		session.setAttribute("COUNT_VIEWERS_PRODUCT", listProductsViewed);
		session.setAttribute("LIST_BRANCH_IN_DOPDOWN_MENU", DAO_Branch.getDAO_Branch().getAllBranch());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {

	}

}
