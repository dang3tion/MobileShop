package controller_user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Product;
import model_beans.Product;

@WebServlet(urlPatterns = "/cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Integer> cart;
	BO_Product bo = new BO_Product();

//	private final int maxAgeCookie = 99999999 * 9999999 * 9999999 * 9999999 * 9999999;
//	private final static String prefixProductID = "MBS_";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		cart = (HashMap<String, Integer>) session.getAttribute("CART");

		ArrayList<Product> listProduct = new ArrayList<Product>();

		// display Cart
		if (cart != null) {
			for (String ProductID : cart.keySet()) {
				listProduct.add(bo.getProduct(ProductID));
			}

			request.setAttribute("LIST_PRODUCT_IN_CART", listProduct);
		}

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/cart.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productID = request.getParameter("id");
		String choose = request.getParameter("choose");

		HttpSession session = request.getSession();

		int QuantityItemInCart = (Integer) session.getAttribute("CART_QUANTITY");

		switch (choose) {
		case "add":
			if (session.getAttribute("CART") != null) {
				cart = (HashMap<String, Integer>) session.getAttribute("CART");

				// XỬ LÝ SỐ LƯỢNG MODEL SẢN PHẨM
				if (cart.size() == 5 && QuantityItemInCart == 25) {
					request.setAttribute("message", "Tối đa 10 sản phẩm");
					RequestDispatcher dispatcher //
							= this.getServletContext().getRequestDispatcher("/product-detail?id=" + productID);
					dispatcher.forward(request, response);
					return;
				}

				// XỬ LÝ SỐ LƯỢNG MỖI LOẠI SẢN PHẨM
				if (cart.containsKey(productID)) {
					int currentQuantity = cart.get(productID);
					if (currentQuantity <= 4) {
						cart.put(productID, currentQuantity + 1);
						session.setAttribute("CART_QUANTITY", QuantityItemInCart + 1);
					} else {
						request.setAttribute("message", "Tối đa 5 sản phẩm cho mỗi mẫu điện thoại");
					}
				} else {
					cart.put(productID, 1);
					session.setAttribute("CART_QUANTITY", QuantityItemInCart + 1);
				}

			} else {
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put(productID, 1);
				session.setAttribute("CART", map);
				session.setAttribute("CART_QUANTITY", QuantityItemInCart + 1);
			}
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/product-detail?id=" + productID);
			dispatcher.forward(request, response);
			break;

		default:
			break;
		}

	}

	// kiểm tra đã đăng nhập hay chưa
//	HttpSession session = request.getSession();
//
//	if (session.getAttribute(Const.ACCOUNT_LOGINED) == null) {
//		for (Cookie c : request.getCookies()) {
//			String name = c.getName();
//			String value = c.getValue();
//			if (name.equals(productID) && checkInt(value)) {
//				int quantity = Integer.parseInt(value) + 1;
//				Cookie newCookie = new Cookie(productID, quantity + "");
//				newCookie.setMaxAge(maxAgeCookie);
//				response.addCookie(newCookie);
//			} else {
//				Cookie newCookie = new Cookie(productID, "1");
//				newCookie.setMaxAge(maxAgeCookie);
//				response.addCookie(newCookie);
//			}
//		}
//	} else {
//		String email = ((Customer) session.getAttribute(Const.ACCOUNT_LOGINED)).getEmail();
//		BO_Cart bo = new BO_Cart(email);
//
//		switch (choose) {
//		case "add":
//			bo.addProduct(productID);
//			break;
//		case "increase":
//			bo.changeQuantity(productID, bo.currentQuantity(productID) + 1);
//			break;
//		case "decrease":
//			bo.changeQuantity(productID, bo.currentQuantity(productID) - 1);
//			break;
//		case "deleteProduct":
//			bo.deleteProduct(productID);
//			break;
//		case "deleteCart":
//			bo.deleteCart();
//			break;
//
//		default:
//			break;
//		}
//
//	}

//	public static HashMap<String, Integer> loadCartFromCookie(HttpServletRequest request) {
//		HashMap<String, Integer> list = new HashMap<String, Integer>();
//		for (Cookie c : request.getCookies()) {
//			String name = c.getName();
//			String value = c.getValue();
//			if (name.startsWith(prefixProductID) && checkInt(value)) {
//				list.put(name, Integer.parseInt(value));
//			}
//		}
//		return list;
//
//	}

//	private static boolean checkInt(String input) {
//		try {
//			Integer.parseInt(input);
//		} catch (Exception e) {
//			return false;
//		}
//		return true;
//	}

}
