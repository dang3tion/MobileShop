package controller_format;

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


	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {

	}

}
