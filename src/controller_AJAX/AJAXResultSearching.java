package controller_AJAX;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_Attribute;
import model_beans.AttributeManager;

public class AJAXResultSearching extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = Integer.parseInt(request.getParameter("page"));
		if (page > DAO_Attribute.getInstance().numberOfPage(10)) {
			page = DAO_Attribute.getInstance().numberOfPage(10);
		} else if (page < 1) {
			page = 1;
		}
		ArrayList<AttributeManager> listAttributes = (ArrayList<AttributeManager>) DAO_Attribute.getInstance()
				.getListAttributesMain((page - 1) * 10 + 1, page * 10);
		updateCurrentPage(request, page);
		doPost(request, response);
		request.setAttribute("listAttributes", listAttributes);
		request.setAttribute("STT", (page - 1) * 10 + 1);
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/VIEW/jsp/jsp-component/attributes-admin.jsp");
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
