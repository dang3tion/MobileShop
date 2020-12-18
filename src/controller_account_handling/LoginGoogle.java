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

import model_BO_service.BO_Account;
import model_DAO.DAO_Account;
import model_beans.Account;
import model_utility.Const;
import model_utility.Encrypt;
import model_utility.GoogleUtils;

@WebServlet("/login-google")
public class LoginGoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		HttpSession session = request.getSession();

		if (code == null || code.isEmpty()) {
			request.setAttribute("message", "Lỗi đăng nhập bằng google");
			RequestDispatcher dis = request.getRequestDispatcher("/VIEW/jsp/jsp-page/account/login.jsp");
			dis.forward(request, response);
		} else {
			String accessToken = GoogleUtils.getToken(code);
			Account Googleaccount = GoogleUtils.getUserInfo(accessToken);
			String email =  Googleaccount.getEmail();
			Account account = new Account(email, Encrypt.MD5(Encrypt.rdText(99)));


			// KIỂM TRA MAIL CÓ TRONG DATABASE CHƯA
			if (!BO_Account.getBoAccount().isExist(email)) {
				// NẾU CHƯA CÓ TẠO MỚI.
				account.setName(getNameFromEmail(email));			
				BO_Account.getBoAccount().add(account);
			} else {
				// Mail đã tồn tại thì load từ database
				account = BO_Account.getBoAccount().get(email);
			}

			
			if (account.getStatus().equals(Const.ACCONT_DISABLE)) {
				String messageErr = "Tài khoản của bạn đã bị khóa";
				request.setAttribute("message", messageErr);
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/login.jsp");
				dispatcher.forward(request, response);
				return;
			}

			// Thêm user này vào session
			
			session.setAttribute(Const.CUSTOMER_LOGINED, account);

			String path = (String) session.getAttribute(Const.CURRENT_LINK);

			// Tại đây có 3 trường hợp để redirect

			// TH1 : trang khác bị khóa và redirect sang trang login để mở khóa
			// TH2 : người dùng tự truy cập vào link

//			if (rememberMe != null) {
//				Cookie newCookie = new Cookie(Const.NAME_TOKEN_REMEMBER_LOGIN, acc.getTokenLogin());
//				newCookie.setMaxAge(9999);
//				response.addCookie(newCookie);
//			}
			
			
			if (path != null) {
				// chuyển cứng trang đó
				response.sendRedirect(request.getContextPath() + path);
			} else {
				response.sendRedirect(request.getContextPath() + "/index");
			}

		}

	}

	public static String getNameFromEmail(String email) {
		String arr[] = email.split("@");
		return arr[0];
	}

}
