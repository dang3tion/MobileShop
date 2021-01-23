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

		String role = "EMPTY";

		Account acc = bo.getAdmin(email);

		if (acc != null) {
			role = acc.getRole();
			HttpSession session = request.getSession();
			session.setAttribute(Const.ADMIN_LOGINED, acc);
			switch (role) {
			case Const.ADMIN_ROLE:
				if (bo.checkLogin(email, password, Const.ADMIN_ROLE) == 1) {
					response.sendRedirect(request.getContextPath() + "/admin/index");
				}
				break;
			case Const.WAREHOUSE_ROLE:
				if (bo.checkLogin(email, password, Const.WAREHOUSE_ROLE) == 1) {
					response.sendRedirect(request.getContextPath() + "/admin/warehouse/manager-product");
				}
				break;
			case Const.CSKH_ROLE:
				if (bo.checkLogin(email, password, Const.CSKH_ROLE) == 1) {
					response.sendRedirect(request.getContextPath() + "/admin/index");
				}
				break;
			default:
				request.setAttribute("message", messageErr);
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/admin-login.jsp");
				dispatcher.forward(request, response);
				break;
			}
		}

	}

}
