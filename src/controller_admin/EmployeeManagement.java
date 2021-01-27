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

		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String role = request.getParameter("role");

		System.out.println("1 " + name);
		System.out.println("2 " + phoneNumber);
		System.out.println("3 " + address);
		System.out.println("4 " + password);
		System.out.println("5 " + username);
		System.out.println("6" + role);

		String email = (String) request.getParameter("email");

		if (email != null) {
			BO_Account.getBoAccount().on_off_account(email);
		}
		doGet(request, response);

	}

}
