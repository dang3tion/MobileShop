package temporary_dropdata;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Serv", urlPatterns = "/Serv")
public class Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Collection<Product> values = Data.data.values();
		Collection<Product> values2 = Data.data2.values();
		request.setAttribute("list", values);
		request.setAttribute("list2", values2);
		request.getRequestDispatcher("/VIEW/jsp/jsp-page/system/index.jsp").forward(request, response);
		;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		

	}
	

}
