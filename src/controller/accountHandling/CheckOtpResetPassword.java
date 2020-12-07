package controller.accountHandling;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BO_Service.BO_Account;
import model.BO_Service.OTP;
import model.beans.Account;
import model.utility.Const;
import model.utility.SendMail;

/**
 * @author XỬ LÝ GỬI MÃ OTP XÁC NHẬN RESET PASS
 *
 */
@WebServlet(urlPatterns = "/otpresetpass")
public class CheckOtpResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	OTP otp = new OTP();
	Account acc = null;
	Object token = null;
	String email = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TRANG NÀY CHỈ ĐƯỢC CHUYỂN QUA TỪ TRANG RESET PASSWORD
		// KHÔNG THỂ TRUY CẬP BẤT KỲ NƠI NÀO KHÁC
		token = request.getAttribute(Const.TOKEN_RESETPASS_OTP);
		if (token != null) {
			request.removeAttribute(Const.TOKEN_RESETPASS_OTP);
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp-forgot-pass.jsp");
			dispatcher.forward(request, response);
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "/index");
		}
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		token = request.getAttribute(Const.TOKEN_RESETPASS_OTP);
		if (token != null) {
			// xử lý trang NHẬP MAIL QMK chuyển qua 
			request.removeAttribute(Const.TOKEN_RESETPASS_OTP);

			email = (String) session.getAttribute(Const.EMAIL_FORGOT_PASS);
			SendMail.send(email, otp.getSysOTP());

			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp-forgot-pass.jsp");
			dispatcher.forward(request, response);
			return;

		} else {
			// xử lý dữ liệu khách hàng gửi OTP lên
			String userOTP = (String) request.getParameter("OTP");
			if (otp.checkOTP(userOTP)) {
				// nếu đúng mã OTP thì chuyển qua cho servlet retypepassword xử lý tiếp
				// có kèm theo token
				request.setAttribute(Const.TOKEN_OTP_RETYPE_PASS, true);
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/retype");
				dispatcher.forward(request, response);
				return;

			} else {
				request.setAttribute("message", "Sai mã OTP");
				RequestDispatcher dispatcher //
						= this.getServletContext()
								.getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp-forgot-pass.jsp");
				dispatcher.forward(request, response);
			}
		}

	}

}
