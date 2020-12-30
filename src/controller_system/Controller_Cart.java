package controller_system;

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
import model_beans.Cart;
import model_beans.Product;
import model_utility.CodeOrder;
import model_utility.Config;

@WebServlet(urlPatterns = "/cart")
public class Controller_Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BO_Product bo = BO_Product.getBoProduct();
	RequestDispatcher dispatcher;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("CART");

		// display Cart
		ArrayList<Product> listProduct = new ArrayList<Product>();
		for (String productID : cart.getListProductID()) {
			Product pro = bo.getProduct(productID);
			pro.setQuantityInCart(cart.getQuantityEveryProduct(productID));
			listProduct.add(pro);

			request.setAttribute("LIST_PRODUCT_IN_CART", listProduct);
			request.setAttribute("SUM_CART", cart.getQuantityOfProductInCart());
			request.setAttribute("message", request.getAttribute("message"));
		}
		dispatcher = this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/cart.jsp");
		dispatcher.forward(request, response);
		return;

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productID = request.getParameter("id");
		String choose = request.getParameter("choose");
		String page = request.getParameter("page");
		String datHang = request.getParameter("datHang");

		String color = request.getParameter("color");
		System.out.println(color + "xxx");

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("CART");

		switch (choose) {
		case "add":
			String message = null;
			switch (cart.add(productID)) {
			case 1:
				message = "tối đa " + Config.MAX_QUANTITY_OF_PRODUCT + " sản phẩm mỗi mẫu điện thoại";
				break;
			case 2:
				message = "tối đa " + Config.MAX_PRODUCT + " mẫu điện thoại trong giỏ hàng";
				break;
			}

			if (datHang != null) {
				updateCart(cart, session);
				response.sendRedirect(request.getContextPath() + "/cart");
				return;
			}

			if (page != null) {
				updateCart(cart, session);
				request.setAttribute("message", message);
				doGet(request, response);
				return;
			}

			updateCart(cart, session);
			request.setAttribute("message", message);
			dispatcher = this.getServletContext().getRequestDispatcher("/product-detail?id=" + productID);
			dispatcher.forward(request, response);

			break;
		case "decrease":
			cart.removeProductItem(productID);
			updateCart(cart, session);
			response.sendRedirect(request.getContextPath() + "/cart");
			break;
		case "remove":
			cart.removeProductModel(productID);
			updateCart(cart, session);
			response.sendRedirect(request.getContextPath() + "/cart");
			break;

		case "remove-all":
			cart.removeAll();
			updateCart(cart, session);
			response.sendRedirect(request.getContextPath() + "/cart");
			break;
		default:
			break;
		}

	}

	private void updateCart(Cart cart, HttpSession session) {
		session.setAttribute("CART", cart);
		session.setAttribute("CART_QUANTITY", cart.getQuantityOfProductInCart());
		session.setAttribute("PRODUCT_QUANTITY", cart.getListProduct().size());

	}

	// kiểm tra đã đăng nhập hay chưa
//	HttpSession session = request.getSession();
//
//	if (session.getAttribute(Const.CUSTOMER_LOGINED) == null) {
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
//		String email = ((Customer) session.getAttribute(Const.CUSTOMER_LOGINED)).getEmail();
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
