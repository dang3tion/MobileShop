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
import model.BO_service.OTP;
import model.DAO.DAO_Account;
import model.beans.Account;
import model.utility.Const;
import model.utility.SendMail;

@WebServlet(urlPatterns = "/otp")
public class CheckOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	OTP otp = new OTP();
	Account newUser = null;
	Object token = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TRANG NÀY CHỈ ĐƯỢC CHUYỂN QUA KHI SAI OTP
		// KHÔNG THỂ TRUY CẬP BẤT KỲ NƠI NÀO KHÁC
		token = request.getAttribute(Const.TOKEN_REGISTER_OTP);
		// bắt đầu điều hướng
		request.removeAttribute(Const.TOKEN_RESETPASS_OTP);
		if (token != null) {
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/views/accountHandling/check-otp.jsp");
			dispatcher.forward(request, response);
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "/index");
		}
		return;
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// // TRANG NÀY CHỈ ĐƯỢC CHUYỂN QUA TỪ TRANG REGISTER hoặc FORGOTPASS
		// lấy token
		token = request.getAttribute(Const.TOKEN_REGISTER_OTP);

		if (token != null) {
			token = (Boolean) request.getAttribute(Const.TOKEN_REGISTER_OTP);
			request.removeAttribute(Const.TOKEN_RESETPASS_OTP);
			newUser = (Account) request.getAttribute("newUser");
			String email = newUser.getEmail();
			SendMail.send(email, otp.getSysOTP());
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp.jsp");
			dispatcher.forward(request, response);
			return;

		} else {
			// xử lý dữ liệu khách hàng gửi OTP lên
			String userOTP = request.getParameter("OTP");
			if (otp.checkOTP(userOTP)) {
				// ĐÃ XÁC THỰC MAIL THÀNH CÔNG THÊM VÀO DATABASE
				(new BO_Account()).add(newUser);

				// Thêm user này vào session
				HttpSession session = request.getSession();
				session.setAttribute(Const.CUSTOMER_LOGINED, newUser);
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/index");
				dispatcher.forward(request, response);
				return;
			} else {
				request.setAttribute("messenger", "Sai mã OTP");
				response.sendRedirect(request.getContextPath() + "/otp");
			}
		}
	}
}
