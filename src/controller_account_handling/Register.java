package controller_account_handling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Account;
import model_DAO.DAO_Account;
import model_beans.Account;
import model_utility.Const;
import model_utility.OTP;
import model_utility.SendMail;

@WebServlet(urlPatterns = "/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + "/VIEW/jsp/jsp-page/account/register.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		Account tmpAcc = new Account(email, password);
		if (BO_Account.getBoAccount().isExist(email)) {
			request.setAttribute("message", "Email này đã được đăng kí");
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/register.jsp");
			dispatcher.forward(request, response);
		} else {
			session.setAttribute("newUser_register", tmpAcc);
			request.setAttribute(Const.TOKEN_REGISTER_OTP, "register");
			
			OTP sysOtp = new OTP();
			session.setAttribute(Const.KEY_SYSTEM_OTP, sysOtp);
			

			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/otp");
			dispatcher.forward(request, response);

		}
	}

}
