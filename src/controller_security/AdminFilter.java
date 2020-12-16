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

/**
 * @BẢO_VỆ_CÁC_TRANG_CÓ_TIỀN_TỐ_/ADMIN/*
 */
@WebFilter(urlPatterns = { "/admin/*" })
public class AdminFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		String servletPath = req.getServletPath();

		HttpSession session = ((HttpServletRequest) request).getSession();

		Account acc = (Account) session.getAttribute(Const.ADMIN_LOGINED);

		// lấy quyền hạn của acc nếu đã đăng nhập
		String currentRole = "empty";
		if (acc != null) {
			currentRole = acc.getRole();
		}

		if (acc == null || !currentRole.equals(Const.ADMIN_ROLE)) {

			// lưu url của trang hiện tại.
			// để sau khi đăng nhập thì tiếp tục vào trang này
			// Dùng trong trường hợp user truy cập vào các mục
			// được bảo vệ bằng URL không thông qua giao diện
			// VD : gõ URL : abc.com/admin/quanliSanPham/
			session.setAttribute(Const.CURRENT_LINK, servletPath);
//
//			 chuyển qua login kèm theo thông báo
			RequestDispatcher dispatcher //
					= request.getServletContext().getRequestDispatcher("/adminlogin");
			dispatcher.forward(request, response);
		} else {
			// pass the request along the filter chain
			chain.doFilter(request, response);

		}

	}

	public AdminFilter() {
	}

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
