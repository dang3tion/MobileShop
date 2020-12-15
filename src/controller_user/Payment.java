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
import model_utility.CodeOrder;

@WebServlet(urlPatterns = "/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String codeOder = new CodeOrder().getCodeOder();
	HashMap<String, Integer> cart;
	BO_Product bo = new BO_Product();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		cart = (HashMap<String, Integer>) session.getAttribute("CART");

		ArrayList<Product> listProduct = new ArrayList<Product>();

		// display Cart
		if (cart != null) {
			int sumCart = 0;
			for (String ProductID : cart.keySet()) {
				Product pro = bo.getProduct(ProductID);
				pro.setQuantityInCart(cart.get(ProductID));
				listProduct.add(pro);
				sumCart += pro.getPrice() * cart.get(ProductID);
			}

			request.setAttribute("LIST_PRODUCT_IN_CART", listProduct);
			request.setAttribute("SUM_CART", sumCart);
		}

		request.setAttribute("CODE_ODER", codeOder);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/payment.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/bill.jsp");
		dispatcher.forward(request, response);
	}

}
