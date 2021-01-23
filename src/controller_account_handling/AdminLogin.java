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

@WebServlet(urlPatterns = "/adminlogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BO_Account bo = BO_Account.getBoAccount();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/admin-login.jsp");

		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String messageErr = "Sai tên tài khoản hoặc mật khẩu";
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Account acc = bo.getAdmin(email);

		boolean isLoginSuccess = false;

		if (acc != null) {
			String role = acc.getRole();
			switch (role) {
			case Const.ADMIN_ROLE:
				isLoginSuccess = bo.checkLogin(email, password, Const.ADMIN_ROLE) == 1;
				break;
			case Const.EMPLOYEE_ROLE:
				isLoginSuccess = bo.checkLogin(email, password, Const.EMPLOYEE_ROLE) == 1;
				break;

			default:
				break;
			}
		}

		if (isLoginSuccess) {

			HttpSession session = request.getSession();
			session.setAttribute(Const.ADMIN_LOGINED, acc);

			String path = (String) session.getAttribute(Const.CURRENT_LINK);

			if (path != null) {
				response.sendRedirect(request.getContextPath() + path);
			} else {
				response.sendRedirect(request.getContextPath() + "/employee/index");
			}
		} else {
			request.setAttribute("message", messageErr);

			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/admin-login.jsp");
			dispatcher.forward(request, response);
			return;
		}

	}

}
