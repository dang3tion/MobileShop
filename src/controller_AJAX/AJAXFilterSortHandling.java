package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AJAXFilterSortHandling")
public class AJAXFilterSortHandling extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String dataFilterSidebar = request.getParameter("dataFilterSidebar");
		
		String jsonDataSortNavigationbar = request.getParameter("jsonDataSortNavigationbar");
		
		System.out.println(dataFilterSidebar);
		
		System.out.println(jsonDataSortNavigationbar);
		
	
		
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/card-product-result.jsp");
		dispatcher.forward(request, response);

	}

}
