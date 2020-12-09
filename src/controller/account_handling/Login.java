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
import model.beans.Customer;
import model.utility.Const;
import model.utility.EncryptPassword;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession s = request.getSession();
		String str = (String) request.getAttribute("LANGUAGE");
		
		
		
		// không sendRedirect vì phải hứng thông báo lỗi từ filter
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/login.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String messageErr = null;

BO_Account bo = new BO_Account();
		switch (bo.checkLogin(email, password, Const.CUSTOMER_ROLE)) {
		case 2: {
			messageErr = "Tài khoản hoặc mật khẩu không đúng";
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
			Customer acc = (bo.getCustomerInfo(email));
			session.setAttribute(Const.CUSTOMER_LOGINED, acc);

			String path = (String) session.getAttribute(Const.CURRENT_LINK);

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

	}

}
