package controller_system;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_Branch;
import model_DAO.DAO_Product_main;
import model_beans.Branch;
import model_beans.Product_main;

@WebServlet(urlPatterns = "/chitiet")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		// t cần gửi cái id bằng link qua bên trang này
//		 cập nhật lượt xem
		updateProductView(id, request);

		Product_main pm = DAO_Product_main.getDao_Product_main().getProduct_main(id);
		request.setAttribute("product", pm);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/detail-product.jsp");
		dispatcher.forward(request, response);

	}

	public void updateProductView(String id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		HashMap<String, Boolean> listProductsViewed = (HashMap<String, Boolean>) session
				.getAttribute("COUNT_VIEWERS_PRODUCT");

		if (!listProductsViewed.containsKey(id)) {
			listProductsViewed.put(id, true);
			DAO_Product_main.getDao_Product_main().updateViewProduct(id);
			session.setAttribute("ACOUNT_VIEWERS_PRODUCT", listProductsViewed);
		}
	}

}
