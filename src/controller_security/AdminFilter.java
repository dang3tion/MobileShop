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

@WebFilter(urlPatterns = { "/admin/*" })
public class AdminFilter implements Filter {

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
		String[] arr = servletPath.substring(1, servletPath.length()).split("/");
		String result;
		switch (currentRole) {
		case Const.ADMIN_ROLE:
			chain.doFilter(request, response);
			break;
		case Const.WAREHOUSE_ROLE:
			if (arr.length >= 2) {

				if (arr[1].equals("warehouse")) {
					chain.doFilter(request, response);
				} else {
					RequestDispatcher dispatcher //
							= request.getServletContext().getRequestDispatcher("/AccessDenied");
					dispatcher.forward(request, response);
					return;
				}
			}
			break;
		case Const.CSKH_ROLE:
			if (arr.length >= 2) {

				if (arr[1].equals("warehouse")) {
					chain.doFilter(request, response);
				} else {
					RequestDispatcher dispatcher //
							= request.getServletContext().getRequestDispatcher("/AccessDenied");
					dispatcher.forward(request, response);
					return;
				}
			}
			break;

		default:
			RequestDispatcher dispatcher //
					= request.getServletContext().getRequestDispatcher("/adminlogin");
			dispatcher.forward(request, response);
			break;
		}

	}

//
	public AdminFilter() {
	}

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public static void main(String[] args) {
		String s = "/admin/employee/admin";
		String[] arr = s.substring(1, s.length()).split("/");
		System.out.println(arr[1]);
	}
}
