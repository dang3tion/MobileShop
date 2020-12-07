package controller.accountHandling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO_Service.BO_Account;
import model.DAO.DAO_Account;
import model.beans.Account;
import model.utility.Const;

@WebServlet(urlPatterns = "/forgot")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/forgotPass.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String messengeErr = null;
		BO_Account BOacc = new BO_Account();
		if (BOacc.isExsit(email)) {
			HttpSession session = request.getSession();
			session.setAttribute(Const.EMAIL_FORGOT_PASS, email);
			request.setAttribute(Const.TOKEN_RESETPASS_OTP, true);

			if (BOacc.isDisable(email)) {
				messengeErr = "Tài khoản này đã bị khóa";
				request.setAttribute("message", messengeErr);
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/forgotPass.jsp");
				dispatcher.forward(request, response);
				return;
			}

			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/otpresetpass");
			dispatcher.forward(request, response);
			return;

		} else {
			messengeErr = "Email không tồn tại";
			request.setAttribute("message", messengeErr);
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/forgotPass.jsp");
			dispatcher.forward(request, response);
			return;
		}

	}

}
