package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Account;
import model_DAO.DAO_Account;

@WebServlet(urlPatterns = "/admin/employeeaccount")
public class EmployeeManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO_Account dao = DAO_Account.getDaoAccount();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("listUser", dao.getEmployee(1, 99));

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-employee-account.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = (String) request.getParameter("email");
		BO_Account.getBoAccount().on_off_account(email);
		doGet(request, response);
	}

}
