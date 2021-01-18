package controller_AJAX;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_beans.AttributeClass;
import model_beans.AttributeManager;

@WebServlet(urlPatterns = "/AJAXAdminAddProduct")
public class AJAXAdminAddProduct extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String IDAttribute = request.getParameter("IDAttribute");
		HttpSession session = request.getSession();
		Map<AttributeClass, ArrayList<ArrayList<AttributeManager>>> arrMap = null;
		if (session.getAttribute("arrMap") != null) {
			arrMap = (Map<AttributeClass, ArrayList<ArrayList<AttributeManager>>>) session.getAttribute("arrMap");
		}
		ArrayList<ArrayList<AttributeManager>> arr = null;
		for (AttributeClass a : arrMap.keySet()) {
			if (a.getId().equals(IDAttribute)) {
			 arr = arrMap.get(a);
				arr.add(arr.get(0));
				arrMap.put(a, arr);
			}
		}

		session.setAttribute("arrMap", arrMap);
		request.setAttribute("arr", arr.get(0));
		request.setAttribute("index", arr.size());
		request.setAttribute("idclass", IDAttribute);

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/attribute-table.jsp");
		dispatcher.forward(request, response);

	}
}
