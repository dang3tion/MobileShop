package controller.accountHandling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.DAO_Account;
import model.beans.Account;
import model.beans.GooglePojo;
import model.utility.*;

@WebServlet(urlPatterns = "/login-google")
public class LoginGoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginGoogle() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		} else {
			String accessToken = GoogleUtils.getToken(code);
			GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);

			// lấy ID từ google
			String id = googlePojo.getId();
			// lấy email từ google
			String email = googlePojo.getEmail();

			// KIỂM TRA MAIL CÓ TRONG DATABASE CHƯA
			Account acc = null;
			if (!(new DAO_Account().isExist(email))) {
				// NẾU CHƯA CÓ TẠO MỚI.
				acc = new Account(email, EncryptPassword.md5("FAKE_PASSWORD"), getNameFromEmail(email), " ", " ");
				(new DAO_Account()).add(acc);
			} else {
				// Mail đã tồn tại thì load từ database
				acc = (new DAO_Account()).get(email);
			}

			if (acc.getStatus().equals(Const.ACCONT_DISABLE)) {
				String messageErr = "Tài khoản của bạn đã bị khóa";
				request.setAttribute("message", messageErr);
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/views/accountHandling/login.jsp");
				dispatcher.forward(request, response);
				return;
			}

			// Thêm user này vào session
			HttpSession session = request.getSession();
			session.setAttribute(Const.ACCOUNT_LOGINED, acc);

			String path = (String) session.getAttribute("KEY_CurrentURL");

			// Tại đây có 2 trường hợp để redirect

			// TH1 : trang khác bị khóa và redirect sang trang login để mở khóa
			// TH2 : người dùng tự truy cập vào link

			if (path != null) {
				// chuyển cứng trang đó
				response.sendRedirect(request.getContextPath() + path);
			} else {
				response.sendRedirect(request.getContextPath() + "/index");
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public static String getNameFromEmail(String email) {
		String arr[] = email.split("@");
		return arr[0];
	}

}
