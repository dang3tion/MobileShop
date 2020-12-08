package controller.account_handling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO_service.BO_Account;
import model.DAO.DAO_Account;
import model.beans.Account;
import model.utility.Const;
import model.utility.EncryptPassword;

@WebServlet(urlPatterns = "/adminlogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/admin-login.jsp");

		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String messageErr = "Sai email hoặc mật khẩu";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Account acc = (new DAO_Account()).get(email);
		if ((new BO_Account()).checkLogin(email, password, Const.ADMIN_ROLE) == 1) {
			// mở khóa link
			// Thêm user này vào session
			HttpSession session = request.getSession();
			session.setAttribute("KEY_Logined", acc);

			String path = (String) session.getAttribute(Const.CURRENT_LINK);

			// Tại đây có 2 trường hợp để redirect

			// TH1 : trang khác bị khóa và redirect sang trang login để mở khóa
			// TH2 : người dùng tự truy cập vào link

			if (path != null) {
				// chuyển cứng trang đó
				response.sendRedirect(request.getContextPath() + path);
			} else {
				// người dùng truy cập link ở footer
				response.sendRedirect(request.getContextPath() + "/admin/index");
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
