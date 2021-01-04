package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_DAO.DAO_AddProduct;

@WebServlet(urlPatterns = "/admin/product-add")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO_AddProduct dao = new DAO_AddProduct();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-product-add.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("nameProduct");
		String price = request.getParameter("price");
		String priceSale = request.getParameter("priceSale");
		String brand =  request.getParameter("brand");
		String quatity = request.getParameter("quatity");
		String type = request.getParameter("type");
		String state = request.getParameter("state");
		String topic = request.getParameter("topic");
		String countColor = request.getParameter("countColor");
		for (int i = 1; i <= Integer.parseInt(countColor); i++) {
			String id = dao.createIdColor();
			String code = request.getParameter("codeColor"+i);
			String nameColor = request.getParameter("color"+i);
			dao.addColor(id, code, nameColor);	
		}
		
		
		
//		System.out.println(name);
//		System.out.println(price);
//		System.out.println(priceSale);
//		System.out.println(brand);
//		System.out.println(quatity);
//		System.out.println(type);
//		System.out.println(state);
//		System.out.println(topic);
		doGet(request, response);
	}
}
