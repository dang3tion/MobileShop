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

@WebServlet(urlPatterns = "/otp")
public class CheckOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String token = (String) request.getAttribute(Const.TOKEN_REGISTER_OTP);
		// bắt đầu điều hướng
		request.removeAttribute(Const.TOKEN_RESETPASS_OTP);
		if (token != null) {
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp.jsp");
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

		HttpSession session = request.getSession();
		Account newUser = (Account) session.getAttribute("newUser_register");
		String email = newUser.getEmail();

		OTP otp = (OTP) session.getAttribute(Const.KEY_SYSTEM_OTP);

		// // TRANG NÀY CHỈ ĐƯỢC CHUYỂN QUA TỪ TRANG REGISTER
		// lấy token
		String token = (String) request.getAttribute(Const.TOKEN_REGISTER_OTP);

		String tokenClient = (String) request.getParameter("TOKENKEY");

		System.out.println("0----------- " + tokenClient);

		if (token != null | tokenClient != null) {
			
			if(tokenClient != null ) {
				session.setAttribute(Const.KEY_SYSTEM_OTP, new OTP());
				 otp = (OTP) session.getAttribute(Const.KEY_SYSTEM_OTP);
			}
			
			token = (String) request.getAttribute(Const.TOKEN_REGISTER_OTP);
			request.removeAttribute(Const.TOKEN_REGISTER_OTP);
			SendMail.send(email, otp.getSysOTP());
			request.setAttribute("COUNTDOWN", Math.abs(
					Config.OTP_LIVE_SECOND +3 - ChronoUnit.SECONDS.between(otp.getTimeCreate(), LocalDateTime.now())));
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp.jsp");
			dispatcher.forward(request, response);
			return;

			// xử lý dữ liệu khách hàng gửi OTP lên
		} else {

			String userOTP = request.getParameter("OTP");

			if (!otp.checkOTP(userOTP) && Validation.isNumeric(userOTP) && (userOTP.length()< 10)) {
				request.setAttribute("message", "Mã OTP không đúng");
				request.setAttribute("COUNTDOWN", Math.abs(
						Config.OTP_LIVE_SECOND - ChronoUnit.SECONDS.between(otp.getTimeCreate(), LocalDateTime.now())));
				RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/account/check-otp.jsp");
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
			

			// ĐÃ XÁC THỰC MAIL THÀNH CÔNG THÊM VÀO DATABASE
			BO_Account.getBoAccount().add(newUser);
//
//			// Thêm user này vào session
			session.setAttribute(Const.CUSTOMER_LOGINED, newUser);
			session.removeAttribute(Const.KEY_SYSTEM_OTP);

			request.setAttribute("messageSuccess", "Đăng kí tài khoản thành công");
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/index");
			dispatcher.forward(request, response);
			return;
		}
	}
	
	
	
}
