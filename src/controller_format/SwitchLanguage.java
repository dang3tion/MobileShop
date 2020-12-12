package controller_format;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/switch-language")
public class SwitchLanguage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String referrer = request.getHeader("referer");
		String setLanguage = request.getParameter("lang");
		switch (setLanguage) {
		case "vi_VN":
			setLanguage = "vi_VN";
			break;
		case "en_US":
			setLanguage = "en_US";
			break;
		case "cn_CN":
			setLanguage = "cn_CN";
			break;

		default:
			break;
		}

		session.setAttribute("LANGUAGE", setLanguage);

		response.sendRedirect(referrer);

	}

}
