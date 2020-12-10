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
import model_beans.Admin;
import model_utility.Const;

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

//		String messageErr = "Sai email hoặc mật khẩu";
//
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		
//
//		BO_Account bo = new BO_Account();
//		if (bo.checkAdminLogin(username, password)) {
//			Admin admin = bo.getAdmin(username);
//			HttpSession session = request.getSession();
//			session.setAttribute("ADMIN_LOGINED", admin);
//
//			String path = (String) session.getAttribute(Const.CURRENT_LINK);
//
//			// TH1 : trang khác bị khóa và redirect sang trang login để mở khóa
//			// TH2 : người dùng tự truy cập vào link
//
//			if (path != null) {
//				// chuyển cứng trang đó
//				response.sendRedirect(request.getContextPath() + path);
//			} else {
//				// người dùng truy cập link ở footer
		response.sendRedirect(request.getContextPath() + "/admin/index");
//			}
//		} else {
//			request.setAttribute("message", messageErr);
//
//			RequestDispatcher dispatcher //
//					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/admin-login.jsp");
//			dispatcher.forward(request, response);
//			return;
//		}

	}

}
