package controller_AJAX;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_ListProduct;
import model_DAO.DAO_ListProduct.LISTP;
import model_beans.ListProduct;
import model_beans.Product_form;

@WebServlet("/AJAXResultSearching")
public class AJAXResultSearching extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ListProduct listMain = new ListProduct();
		System.out.println("aaaxxxx");
		if (session.getAttribute("listMain") != null) {
			listMain = (ListProduct) session.getAttribute("listMain");
		} else {
			try {
				System.out.println("aaaaaa");
				listMain = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.HIGHESTPRICE, 100);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int page = Integer.parseInt(request.getParameter("page"));
		int totalPage = 1;
		try {
			totalPage = getTotalPage(DAO_ListProduct.getDao_ListProduct().getTotalList(listMain), 9);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (page > totalPage) {
			page = totalPage;
		} else if (page < 1) {
			page = 1;
		}

		ArrayList<Product_form> lstPorduct = getListOther(listMain, (page - 1) * 9 + 1, page * 9);
		System.out.println("AJAXXXXXXXXXXXXXXX");
		System.out.println(lstPorduct);
		updateCurrentPage(request, page);
		doPost(request, response);
		request.setAttribute("lstProduct", lstPorduct);
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/VIEW/jsp/jsp-component/searching-table.jsp");
		dispatcher.forward(request, response);
	}

	public int getTotalPage(int totalCard, int cardPage) {
		int result = totalCard / cardPage;
		if (totalCard % cardPage >= 1) {
			result += 1;
		}

		return result;
	}

	public ArrayList<Product_form> getListOther(ListProduct list, int start, int end) {
		try {
			return DAO_ListProduct.getDao_ListProduct().orderListProduct(list, list.getQueryOrder(start, end));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void updateCurrentPage(HttpServletRequest request, int page) {
		HttpSession session = request.getSession();

		session.setAttribute("current_page", page);
	}
}
