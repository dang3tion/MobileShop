package temporary_dropdata;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Detail")
public class Controller_Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;



	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = (String) request.getParameter("id");
		
		
		Beans_Product pro = (new BO_Product()).search(id);
		
		request.setAttribute("pro", pro);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/TEST/detail.jsp");
		dispatcher.forward(request, response);
	}



}
