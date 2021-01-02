package controller_system;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Product;
import model_DAO.DAO_ListProduct;
import model_DAO.DAO_Product_main;
import model_beans.Color_main;
import model_beans.Product_form;
import model_beans.Product_main;

@WebServlet(urlPatterns = "/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BO_Product bo = BO_Product.getBoProduct();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product_form> lst = null;

		try {
			DAO_ListProduct.getDao_ListProduct()
					.setQuery("\r\n" + "SELECT * FROM dbo.GET_PRODUCT_BRANCH(?)	order by GIA desc");
			lst = DAO_ListProduct.getDao_ListProduct().getListFollowBranch("TH03");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("lstProduct", lst);

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/index.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
