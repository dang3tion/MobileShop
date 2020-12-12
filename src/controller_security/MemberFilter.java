package controller_security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model_beans.Account;
import model_utility.Const;

// trường hơp dùng filter này
// Đăng nhập để thanh toán
// login để bình luận 
// bảo vệ tất cả các trang có tiền tố member trước servlet path
@WebFilter(urlPatterns = "/member/*")
public class MemberFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		String servletPath = req.getServletPath();

		HttpSession session = ((HttpServletRequest) request).getSession();

		Account acc = (Account) session.getAttribute("KEY_Logined");

		if (acc == null) {
			// lưu url của trang hiện tại.
			// để sau khi đăng nhập thì tiếp tục vào trang này
			// VD : link thanh toán bị khóa ===> hệ thống chuyển qua trang login ===> login
			// đúng ==> quay lại trang thanh toán.
			session.setAttribute(Const.CURRENT_LINK, servletPath);

			// chuyển qua login kèm theo thông báo
			request.setAttribute("messenger", "Bạn cần đăng nhập để thanh toán");
			RequestDispatcher dispatcher //
					= request.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
		} else {
			// pass the request along the filter chain
			chain.doFilter(request, response);

		}

	}

	public MemberFilter() {
	}

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
