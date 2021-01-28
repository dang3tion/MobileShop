package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Account;
import model_BO_service.BO_Order;

@WebServlet("/AJAXOderManagement")
public class AJAXOderManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = Integer.parseInt((String) request.getParameter("page"));

		BO_Order bo = new BO_Order(page, 10);
		request.setAttribute("LIST_ORDER", bo.getList());
		request.setAttribute("STTstart", bo.startRow());

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/order-table.jsp");
		dispatcher.forward(request, response);
		return;
	}

}
