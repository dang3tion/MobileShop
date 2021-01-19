package controller_system;

import java.io.IOException;
import java.time.LocalDate;
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
import model_DAO.DAO_Order;
import model_DAO.DAO_Product_main;
import model_beans.Account;
import model_beans.Cart;
import model_beans.Order;
import model_beans.OrderDetail;
import model_beans.Product;
import model_utility.CodeOrder;
import model_utility.Const;
import model_utility.VerifyCaptcha;

@WebServlet(urlPatterns = "/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BO_Product bo = BO_Product.getBoProduct();
	DAO_Order daoOder = DAO_Order.getDAO_Order();
	DAO_Product_main daoProductMain = DAO_Product_main.getDao_Product_main();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("CART");
		String codeOder = cart.getCodeOder().getCode();

		request.setAttribute("LIST_INSTANCE_PRODUCT", Controller_Cart.getListInstanceProductInCart(cart));
		request.setAttribute("TOTAL_MONEY", Controller_Cart.getTotalMoney(cart));
		request.setAttribute("CODE_ODER", codeOder);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/payment.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("CART");
		String codeOder = cart.getCodeOder().getCode();
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		String paymentMethod = request.getParameter("paymentMethod");

		request.setAttribute("LIST_INSTANCE_PRODUCT", Controller_Cart.getListInstanceProductInCart(cart));
		request.setAttribute("TOTAL_MONEY", Controller_Cart.getTotalMoney(cart));
		request.setAttribute("CODE_ODER", codeOder);
		request.setAttribute("message", "Chưa nhập hoặc sai mã captcha !");
		request.setAttribute("address", address);
		request.setAttribute("name", name);
		request.setAttribute("phoneNumber", phoneNumber);
		if (paymentMethod.equals("COD")) {
			request.setAttribute("CHECKED_COD", "checked");
		}
		request.setAttribute("CodeOrder", codeOder);

		if (session.getAttribute(Const.CUSTOMER_LOGINED) == null) {
			// Verify CAPTCHA.
			if (VerifyCaptcha.verify(gRecaptchaResponse) == false) {
				RequestDispatcher dispatcher = //
						request.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/payment.jsp");
				dispatcher.forward(request, response);
				return;
			}
		}

	


		// ADD ORDER AREA
		String customerID = null;
		Account acc = (Account) session.getAttribute(Const.CUSTOMER_LOGINED);
		if (acc != null) {
			customerID = acc.getId();
		}

		daoOder.addNewOrder(new Order(//
				codeOder, //
				name, //
				address, //
				phoneNumber, //
				Controller_Cart.getTotalMoney(cart), //
				LocalDate.now().toString(), //
				paymentMethod, //
				"Pending", //
				customerID));
		
		// ADD ORDER DETAIL AREA
		for (String productID : cart.getListProductID()) {
			for (String colorID : cart.getListProduct().get(productID).keySet()) {
				int quantity = cart.getListProduct().get(productID).get(colorID);
				daoOder.addOrderDetail(new OrderDetail(codeOder, productID, colorID, quantity));
			}
		}

		
	
		cart.setCodeOder(new CodeOrder());
		cart.getListProduct().clear();
		Controller_Cart.updateCart(cart, session);

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/bill.jsp");
		dispatcher.forward(request, response);
	}

}
