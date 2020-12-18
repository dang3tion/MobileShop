package controller_security;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Account;
import model_beans.Account;
import model_utility.Const;

@WebFilter(urlPatterns = "/*")
public class RememberLogin implements Filter {
	String token = "EMPTY";

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		Cookie[] arrCookie = req.getCookies();

		if (session.getAttribute(Const.CUSTOMER_LOGINED) == null) {
			if (arrCookie != null) {
				for (Cookie c : arrCookie) {
					String name = c.getName();
					if (name.equals(Const.NAME_TOKEN_REMEMBER_LOGIN)) {
						token = c.getValue();
					}
				}
				Account tempAcc = BO_Account.getBoAccount().getAccountByToken(token);

				if (tempAcc != null) {
					session.setAttribute(Const.CUSTOMER_LOGINED, tempAcc);
				}
			}
		}

		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public RememberLogin() {
	}

	public void destroy() {
	}
}
