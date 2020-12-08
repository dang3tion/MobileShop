

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO_service.BO_Product;

@WebServlet("/ls")
public class DEMOPRODUCT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		request.setAttribute("list", (new BO_Product().demoListProduct()));
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/list.jsp");
		dispatcher.forward(request, response);

	}

}
