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

		// display Cart
		ArrayList<Product> listProduct = new ArrayList<Product>();
		for (String productID : cart.getListProductID()) {
			Product pro = bo.getProduct(productID);
			pro.setQuantityInCart(cart.getQuantityEveryProduct(productID));
			listProduct.add(pro);

			request.setAttribute("LIST_PRODUCT_IN_CART", listProduct);
			request.setAttribute("SUM_CART", cart.getQuantityOfProductInCart());
		}

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

		System.out.println("dia chi " + address);
		System.out.println("ho ten" + name);
		System.out.println("SDT " + phoneNumber);
		System.out.println("paymentMethod ? " + paymentMethod);

		// display Cart
		ArrayList<Product> listProduct = new ArrayList<Product>();
		for (String productID : cart.getListProductID()) {
			Product pro = bo.getProduct(productID);
			pro.setQuantityInCart(cart.getQuantityEveryProduct(productID));
			listProduct.add(pro);

			request.setAttribute("LIST_PRODUCT_IN_CART", listProduct);
			request.setAttribute("SUM_CART", cart.getQuantityOfProductInCart());
		}

		request.setAttribute("CODE_ODER", codeOder);

		if (session.getAttribute(Const.CUSTOMER_LOGINED) == null) {
			// Verify CAPTCHA.
			if (VerifyCaptcha.verify(gRecaptchaResponse) == false) {
				request.setAttribute("message", "Chưa nhập hoặc sai mã captcha !");
				request.setAttribute("address", address);
				request.setAttribute("name", name);
				request.setAttribute("phoneNumber", phoneNumber);

				if (paymentMethod.equals("tranfer")) {
					request.setAttribute("CHECKED_TRANFER", "checked='checked'");
				} else {
					request.setAttribute("CHECKED_COD", "checked='checked'");
				}

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
