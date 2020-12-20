package controller_user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Product;

@WebServlet(urlPatterns = "/product-detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BO_Product bo = new BO_Product();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = (String) request.getParameter("id");
		request.setAttribute("PRODUCT", bo.getProduct(id));
		request.setAttribute("config", bo.config(id));
		request.setAttribute("star", bo.star(id));
		String message = (String) request.getAttribute("message");
		request.setAttribute("message", message);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/detail-product.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
