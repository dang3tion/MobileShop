package controller_AJAX;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_Product_main;
import model_beans.Product_main;

@WebServlet("/AJAXAdminProductManager")
public class AJAXADminProductManager extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		if (page > DAO_Product_main.getDao_Product_main().getNumberOfPage(2)) {
			page = DAO_Product_main.getDao_Product_main().getNumberOfPage(2);
		} else if (page < 1) {
			page = 1;
		}
		System.out.println(page);
		ArrayList<Product_main> listProduct = (ArrayList<Product_main>) DAO_Product_main.getDao_Product_main()
				.getAllProduct((page - 1) * 2 + 1, page * 2);
		updateCurrentPage(request, page);
		doPost(request, response);
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("STT", (page - 1) * 2 + 1);
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/VIEW/jsp/jsp-component/product-table-admin.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void updateCurrentPage(HttpServletRequest request, int page) {
		HttpSession session = request.getSession();

		session.setAttribute("current_page", page);
	}
}
