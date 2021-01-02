package controller_AJAX;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Account;
import model_utility.Const;

@WebServlet(urlPatterns = "/AJAXswitchChedoXemAdminManageUser")
public class AJAXswitchChedoXemAdminManageUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BO_Account bo = BO_Account.getBoAccount();

		String accountStatus = request.getParameter("statusAccount");
		String status;

		if (accountStatus.equals("enable")) {
			status = Const.ACCOUNT_ENABLE;
		} else {
			status = Const.ACCONT_DISABLE;
		}

		response.setContentType("text/plain");
		response.getWriter().write(bo.getTotalStatusAccount(status)+"");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
