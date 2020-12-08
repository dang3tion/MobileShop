package temporary_dropdata;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({"/test"})
public class Contronler_Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("list", BO_Product.getFakeDatabase());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/TEST/test.jsp");

		dispatcher.forward(request, response);
	}



}
