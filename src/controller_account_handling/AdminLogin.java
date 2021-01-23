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

		String role = null;

		Account acc = bo.getAdmin(email);

		boolean isLoginSuccess = false;

		if (acc != null) {
			role = acc.getRole();
			switch (role) {
			case Const.ADMIN_ROLE:
				isLoginSuccess = bo.checkLogin(email, password, Const.ADMIN_ROLE) == 1;
				break;
			case Const.WAREHOUSE_ROLE:
				isLoginSuccess = bo.checkLogin(email, password, Const.WAREHOUSE_ROLE) == 1;
				break;
			case Const.CSKH_ROLE:
				isLoginSuccess = bo.checkLogin(email, password, Const.CSKH_ROLE) == 1;
				break;

			default:
				break;
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute(Const.ADMIN_LOGINED, acc);

		if (isLoginSuccess) {
			switch (role) {
			case Const.ADMIN_ROLE:
				response.sendRedirect(request.getContextPath() + "/admin/index");
				return;
			case Const.WAREHOUSE_ROLE:
				response.sendRedirect(request.getContextPath() + "/admin/warehouse/manager-product");
				return;
			case Const.CSKH_ROLE:
				response.sendRedirect(request.getContextPath() + "/admin/cskh/user");
				return;

			default:
				break;
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
