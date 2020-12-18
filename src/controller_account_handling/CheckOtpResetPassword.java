package controller_account_handling;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Account;
import model_beans.Account;
import model_utility.Config;
import model_utility.Const;
import model_utility.OTP;
import model_utility.SendMail;
import model_utility.Validation;

/**
 * @author XỬ LÝ GỬI MÃ OTP XÁC NHẬN RESET PASS
 *
 */
@WebServlet(urlPatterns = "/otpresetpass")
public class CheckOtpResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TRANG NÀY CHỈ ĐƯỢC CHUYỂN QUA TỪ TRANG RESET PASSWORD
		// KHÔNG THỂ TRUY CẬP BẤT KỲ NƠI NÀO KHÁC
		String token = (String) request.getAttribute(Const.TOKEN_RESETPASS_OTP);
		if (token != null) {
			request.removeAttribute(Const.TOKEN_RESETPASS_OTP);
			RequestDispatcher dispatcher //
					= this.getServletContext()
							.getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp-forgot-pass.jsp");
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

		// xử lý có phải trang RESET chuyển qua đây hay người dùng submit form
		String token = (String) request.getAttribute(Const.TOKEN_RESETPASS_OTP);
		
		OTP otp = (OTP) session.getAttribute(Const.KEY_SYSTEM_OTP_FORGOT);

		String tokenClient = (String) request.getParameter("TOKENKEY");
		if (token != null | tokenClient != null) {
			request.removeAttribute(Const.TOKEN_RESETPASS_OTP);

			if(tokenClient != null ) {
				session.setAttribute(Const.KEY_SYSTEM_OTP_FORGOT, new OTP());
				 otp = (OTP) session.getAttribute(Const.KEY_SYSTEM_OTP_FORGOT);
			}
			
			String email = (String) session.getAttribute(Const.EMAIL_FORGOT_PASS);


			SendMail.send(email, otp.getSysOTP());

			request.setAttribute("COUNTDOWN", Config.OTP_LIVE_SECOND + 3
					- Math.abs(ChronoUnit.SECONDS.between(otp.getTimeCreate(), LocalDateTime.now())));
			RequestDispatcher dispatcher //
					= this.getServletContext()
							.getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp-forgot-pass.jsp");
			dispatcher.forward(request, response);
			return;

			// xử lý dữ liệu khách hàng gửi OTP lên
		} else {

			String userOTP = (String) request.getParameter("OTP");

			 otp = (OTP) session.getAttribute(Const.KEY_SYSTEM_OTP_FORGOT);


			if (!Validation.isNumeric(userOTP) || (userOTP.length() > 10) || !otp.checkOTP(userOTP)) {
				request.setAttribute("message", "Mã OTP không đúng");
				request.setAttribute("COUNTDOWN",
						Math.abs(Config.OTP_LIVE_SECOND  - ChronoUnit.SECONDS.between(otp.getTimeCreate(), LocalDateTime.now())));
				RequestDispatcher dispatcher //
						= this.getServletContext()
								.getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp-forgot-pass.jsp");
				dispatcher.forward(request, response);
				return;
			}
			
			
			if (!otp.checkLiveOTP(LocalDateTime.now())) {
				request.setAttribute("message", "Mã OTP đã hết hiệu lực");
				request.setAttribute("COUNTDOWN", 0);
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp.jsp");
				dispatcher.forward(request, response);
				return;
			}

			// nếu đúng mã OTP thì chuyển qua cho servlet retypepassword xử lý tiếp
			// có kèm theo token

			session.removeAttribute(Const.KEY_SYSTEM_OTP);

			String userEmail = (String) session.getAttribute(Const.EMAIL_FORGOT_PASS);
			BO_Account bo = BO_Account.getBoAccount();
			if (bo.isExist(userEmail)) {
				request.setAttribute(Const.TOKEN_OTP_RETYPE_PASS, "TOKEN_KEY_HIHI");
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/retype");
				dispatcher.forward(request, response);
				return;
			}

			request.setAttribute("message", "Mail Không tồn tại vui lòng đăng kí tài khoản mới");
			RequestDispatcher dispatcher //
					= this.getServletContext()
							.getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp-forgot-pass.jsp");
			dispatcher.forward(request, response);
			return;

		}

	}

}
