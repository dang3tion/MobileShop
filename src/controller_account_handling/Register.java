package controller_account_handling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Account;
import model_BO_service.OTP;
import model_DAO.DAO_Account;
import model_beans.Customer;
import model_utility.Const;
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
		

		Customer tmpAcc = new Customer(email, password);
		if ((new BO_Account()).isExsit(email)) {
			request.setAttribute("message", "Email này đã được đăng kí");
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/register.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("newUser", tmpAcc);
			request.setAttribute(Const.TOKEN_REGISTER_OTP, true);

			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/otp");
			dispatcher.forward(request, response);

		}
	}

}
