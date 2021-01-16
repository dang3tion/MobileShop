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
import model_DAO.DAO_ListProduct.LISTP;
import model_DAO.DAO_Product_main;
import model_beans.Color_main;
import model_beans.ListProduct;
import model_beans.Product_form;
import model_beans.Product_main;

@WebServlet(urlPatterns = "/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ListProduct listSpecial = null, listNew = null, listHighesPrice = null;
		try {
			listSpecial = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.SPECIAL, 8);
			listNew = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.NEW, 8);
			listHighesPrice = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.HIGHESTPRICE, 100);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("lstPrice", listHighesPrice.getLstProduct());
		System.out.println(listHighesPrice.getLstProduct());
		request.setAttribute("lstNew", listNew.getLstProduct());
		request.setAttribute("lstSpecial", listSpecial.getLstProduct());

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/index.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
