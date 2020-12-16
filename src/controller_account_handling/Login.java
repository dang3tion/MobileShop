package controller_account_handling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller_user.Cart;
import model_BO_service.BO_Account;
import model_DAO.DAO_Account;
import model_beans.Account;
import model_utility.Const;
import model_utility.Encrypt;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String enterPaymentPageFlag = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		enterPaymentPageFlag = request.getParameter("payment");
		
		

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/login.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("remember-me");

		String messageErr = null;

		switch ((new BO_Account()).checkLogin(email, password, Const.CUSTOMER_ROLE)) {

		case 2: {

			messageErr = "Tài khoản hoặc mật khẩu không đúng";
			request.setAttribute("messEmail", email);
			request.setAttribute("message", messageErr);
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/login.jsp");
			dispatcher.forward(request, response);
			break;
		}
		case 3: {
			messageErr = "Tài khoản của bạn đã bị khóa";
			request.setAttribute("message", messageErr);
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/login.jsp");
			dispatcher.forward(request, response);
			break;
		}
		default: {
			// mở khóa link
			//
			// Thêm user này vào session
			HttpSession session = request.getSession();
			Account acc = (new BO_Account()).get(email);
			session.setAttribute(Const.CUSTOMER_LOGINED, acc);
			// Thêm token ghi nhớ đăng nhập
			if (rememberMe != null) {
				Cookie newCookie = new Cookie(Const.NAME_TOKEN_REMEMBER_LOGIN, acc.getTokenLogin());
				newCookie.setMaxAge(Const.MAX_TIME_REMEMBER_LOGIN);
				response.addCookie(newCookie);
			}
			String path = (String) session.getAttribute(Const.CURRENT_LINK);

			// Tại đây có 3 trường hợp để redirect

			if( enterPaymentPageFlag != null) {
				// TH1 : đăng nhập trước khi thanh toán
				response.sendRedirect(request.getContextPath() + "/payment");
				return;
			}
			
			if (path != null) {
				// TH2 : trang khác bị khóa và redirect sang trang login để mở khóa
				response.sendRedirect(request.getContextPath() + path);
				return;
			}
			// TH2 : người dùng tự truy cập vào link
			response.sendRedirect(request.getContextPath() + "/index");
			return;

		}
		}

	}

}
