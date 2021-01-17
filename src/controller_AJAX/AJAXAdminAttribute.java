package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AJAXAdminAttribute")
public class AJAXAdminAttribute extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/VIEW/jsp/jsp-component/product-table-admin.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}da a

	private void updateCurrentPage(HttpServletRequest request, int page) {
		HttpSession session = request.getSession();

		session.setAttribute("current_page", page);
	}
}
