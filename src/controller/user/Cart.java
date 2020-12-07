package controller.user;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO_Service.BO_Cart;
import model.beans.Account;
import model.utility.Const;

@WebServlet(urlPatterns = "/cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final int maxAgeCookie = 99999999 * 9999999 * 9999999 * 9999999 * 9999999;
	private final static String prefixProductID = "MBS_";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.setAttribute(Const.TOKEN_CART_TO_PAY, "TOKEN");
		

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/cart.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productID = request.getParameter("id");
		String choose = request.getParameter("choose");
	
		// kiểm tra đã đăng nhập hay chưa
		HttpSession session = request.getSession();

		if (session.getAttribute(Const.ACCOUNT_LOGINED) == null) {
			for (Cookie c : request.getCookies()) {
				String name = c.getName();
				String value = c.getValue();
				if (name.equals(productID) && checkInt(value)) {
					int quantity = Integer.parseInt(value) + 1;
					Cookie newCookie = new Cookie(productID, quantity + "");
					newCookie.setMaxAge(maxAgeCookie);
					response.addCookie(newCookie);
				} else {
					Cookie newCookie = new Cookie(productID, "1");
					newCookie.setMaxAge(maxAgeCookie);
					response.addCookie(newCookie);
				}
			}
		} else {
			String email = ((Account) session.getAttribute(Const.ACCOUNT_LOGINED)).getEmail();
			BO_Cart bo = new BO_Cart(email);

			switch (choose) {
			case "add":
				bo.addProduct(productID);
				break;
			case "increase":
				bo.changeQuantity(productID, bo.currentQuantity(productID) + 1);
				break;
			case "decrease":
				bo.changeQuantity(productID, bo.currentQuantity(productID) - 1);
				break;
			case "deleteProduct":
				bo.deleteProduct(productID);
				break;
			case "deleteCart":
				bo.deleteCart();
				break;

			default:
				break;
			}

		}

		response.sendRedirect(request.getContextPath() + "/views/cart.jsp");
	}

	public static HashMap<String, Integer> loadCookie(HttpServletRequest request) {
		HashMap<String, Integer> list = new HashMap<String, Integer>();
		for (Cookie c : request.getCookies()) {
			String name = c.getName();
			String value = c.getValue();
			if (name.startsWith(prefixProductID) && checkInt(value)) {
				list.put(name, Integer.parseInt(value));
			}
		}
		return list;

	}

	private static boolean checkInt(String input) {
		try {
			Integer.parseInt(input);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}
