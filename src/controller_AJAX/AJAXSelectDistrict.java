package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller_utility.GetAddress;

@WebServlet("/AJAXSelectDistrict")
public class AJAXSelectDistrict extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String provinceID = request.getParameter("provinceID");
		
		request.setAttribute("LIST_DISTRICT", GetAddress.getListDistrict(provinceID));
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/button-select-district.jsp");
		dispatcher.forward(request, response);
	}

}
