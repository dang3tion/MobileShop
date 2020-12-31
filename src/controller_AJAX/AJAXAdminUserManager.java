package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Account;

@WebServlet("/AJAXAdminUserManager")
public class AJAXAdminUserManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = (String) request.getParameter("page");
		
		
		
		BO_Account bo = new BO_Account(Integer.parseInt(page), 20);
		request.setAttribute("listUser", bo.getList());
		request.setAttribute("STTstart", bo.startRow());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/user-table.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = (String) request.getParameter("page");

		System.out.println("=====>" + page);

	}

}
