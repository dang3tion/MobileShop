package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import model.utility.Const;

@WebServlet(urlPatterns = "/member/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		// chỉ vào được trang payment từ trang giỏ hàng
//		HttpSession session = request.getSession();
//
//		String token = "empty";
//		if (session.getAttribute(Const.TOKEN_CART_TO_PAY) != null) {
//			token = (String) session.getAttribute(Const.TOKEN_CART_TO_PAY);
//		}
//
//		if (token.equals("TOKEN")) {
//			session.removeAttribute(Const.TOKEN_CART_TO_PAY);
//			token = "empty";
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/payment.jsp");
		dispatcher.forward(request, response);
//		} else {
//			RequestDispatcher dispatcher //
//					= this.getServletContext().getRequestDispatcher("/home");
//			dispatcher.forward(request, response);
//		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/bill.jsp");
		dispatcher.forward(request, response);
	}

}
