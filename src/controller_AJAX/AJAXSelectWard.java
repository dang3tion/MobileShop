package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller_utility.GetAddress;

@WebServlet("/AJAXSelectWard")
public class AJAXSelectWard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String districtID = request.getParameter("districtID");

		request.setAttribute("LIST_WARD", GetAddress.getListWard(districtID));
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/button-select-ward.jsp");
		dispatcher.forward(request, response);
	}

}
