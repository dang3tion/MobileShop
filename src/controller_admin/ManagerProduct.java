package controller_admin;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Product;

@WebServlet(urlPatterns = "/admin/manager-product")
public class ManagerProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BO_Product bo = new BO_Product();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("listProduct", bo.listProductAdmin(1, 1000));
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-product.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idEdit = request.getParameter("idEdit");
		if (idEdit!=null) {
			bo.updateStateProduct(idEdit);
			request.setAttribute("listProduct", bo.listProductAdmin(1, 1000));
			request.setAttribute("notice", "Trạng thái đã được thay đổi.");
		}
		RequestDispatcher dispatcher //
		= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-product.jsp");
dispatcher.forward(request, response);
	}

}
