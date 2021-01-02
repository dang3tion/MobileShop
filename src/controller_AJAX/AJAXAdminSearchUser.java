package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Account;
import model_utility.Const;

@WebServlet("/AJAXAdminUserManager")
public class AJAXAdminSearchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher;
		BO_Account bo = BO_Account.getBoAccount();
		request.setAttribute("listUser", bo.getList());
		request.setAttribute("STTstart", bo.startRow());
		dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/user-table.jsp");
		dispatcher.forward(request, response);
	}

}
