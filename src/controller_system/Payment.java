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
import model_utility.Const;
import model_utility.VerifyCaptcha;

@WebServlet(urlPatterns = "/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BO_Product bo = BO_Product.getBoProduct();

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
		request.setAttribute("CUSTOMER_LOGINED.address", address);
		request.setAttribute("CUSTOMER_LOGINED.name", name);
		request.setAttribute("CUSTOMER_LOGINED.phoneNumber", phoneNumber);
		System.out.println(paymentMethod + "___" + address);
		if (paymentMethod.equals("COD")) {
			request.setAttribute("CHECKED_COD", "checked");
		}

		if (session.getAttribute(Const.CUSTOMER_LOGINED) == null) {
			// Verify CAPTCHA.
			if (VerifyCaptcha.verify(gRecaptchaResponse) == false) {
				RequestDispatcher dispatcher = //
						request.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/payment.jsp");
				dispatcher.forward(request, response);
				return;
			}
		}

		/// INSERT VÀO DATABASE Ở ĐÂY
		/// INSERT VÀO DATABASE Ở ĐÂY
		/// INSERT VÀO DATABASE Ở ĐÂY
		/// INSERT VÀO DATABASE Ở ĐÂY
		/// INSERT VÀO DATABASE Ở ĐÂY
		/// INSERT VÀO DATABASE Ở ĐÂY
		/// INSERT VÀO DATABASE Ở ĐÂY
		/// INSERT VÀO DATABASE Ở ĐÂY

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/bill.jsp");
		dispatcher.forward(request, response);
	}

}
