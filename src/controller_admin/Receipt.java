package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Account;
import model_BO_service.BO_Order;
import model_DAO.DAO_Order;

@WebServlet("/admin/cskh/receipt")
public class Receipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO_Order dao = DAO_Order.getDAO_Order();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int currentPage = 1;
		if (session.getAttribute("CURRENT_PAGE_ORDER_MANAGEMENT") == null) {
			session.setAttribute("CURRENT_PAGE_ORDER_MANAGEMENT", 1);
		} else {
			currentPage = (Integer) session.getAttribute("CURRENT_PAGE_ORDER_MANAGEMENT");
		}

		BO_Order bo = new BO_Order(currentPage, 5);

		request.setAttribute("totalPage", bo.totalPage());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-receipt.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = (String) request.getParameter("id");

		System.out.println("==========> " + id);

		doGet(request, response);
	}

}
