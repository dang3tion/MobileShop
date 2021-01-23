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
@WebFilter(urlPatterns = { "/employee/*" })
public class EmployeeFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		String servletPath = req.getServletPath();

		HttpSession session = ((HttpServletRequest) request).getSession();

		Account acc = (Account) session.getAttribute(Const.ADMIN_LOGINED);

		String currentRole = "empty";
		if (acc != null) {
			currentRole = acc.getRole();
			System.out.println(currentRole);
		}

		boolean accessPermeission = false;

		switch (currentRole) {
		case Const.ADMIN_ROLE:
			accessPermeission = true;
			break;
		case Const.EMPLOYEE_ROLE:
			accessPermeission = true;
			break;

		default:
			break;
		}

		if (accessPermeission) {

			chain.doFilter(request, response);
		} else {
			session.setAttribute(Const.CURRENT_LINK, servletPath);
			RequestDispatcher dispatcher //
					= request.getServletContext().getRequestDispatcher("/adminlogin");
			dispatcher.forward(request, response);
		}

	}

	public EmployeeFilter() {
	}

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
