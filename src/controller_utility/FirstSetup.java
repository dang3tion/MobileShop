package controller_utility;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import model_ConnectDB.DataSource;
import model_DAO.DAO_ShopInfo;
import model_beans.Cart;

public class FirstSetup implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		session.setAttribute("LANGUAGE", "vi_VN");

		session.setAttribute("CART", new Cart());
		session.setAttribute("SHOPINFO", DAO_ShopInfo.getDaoShopInfo().getInfo());

		
		HashMap<String, Boolean> listProductsViewed = new HashMap<String, Boolean>();
		session.setAttribute("COUNT_VIEWERS_PRODUCT", listProductsViewed );
		
		System.out.println(session
				.getAttribute("COUNT_VIEWERS_PRODUCT"));

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {

	}
	
	

}
