package controller_system;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_DAO.DAO_ListProduct;
import model_DAO.DAO_ListProduct.LISTP;
import model_beans.Product_form;

@WebServlet(urlPatterns = "/searchingProduct")
public class Searching_Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String typeList = request.getParameter("dssanpham");
		ArrayList<Product_form> listProduct = new ArrayList<Product_form>();
		String branchName = request.getParameter("thuonghieu");
		String range = request.getParameter("khoanggia");

		Integer startRange = null;
		Integer endRange = null;
		String aspect = request.getParameter("tinhtrang");
		try {
			if (typeList != null) {

				switch (typeList) {
				case "sanphamnoibat": {
					// số 100 là số lượng lấy ra, vì câu lệnh sql bắt buộc phải nhập số lượng mới
					// cho lấy ra list sản phẩm
					listProduct = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.SPECIAL, 100)
							.getLstProduct();
					break;
				}
				case "sanphammoi": {
					// số 100 là số lượng lấy ra, vì câu lệnh sql bắt buộc phải nhập số lượng mới
					// cho lấy ra list sản phẩm
					listProduct = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.NEW, 100).getLstProduct();
					break;
				}
				case "sanphamgiacao": {
					// số 100 là số lượng lấy ra, vì câu lệnh sql bắt buộc phải nhập số lượng mới
					// cho lấy ra list sản phẩm
					listProduct = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.HIGHESTPRICE, 100)
							.getLstProduct();
					break;
				}
				default:
					break;
				}

			} else if (branchName != null) {
				listProduct = DAO_ListProduct.getDao_ListProduct().getListFollowBranch(branchName).getLstProduct();
			} else if (range != null) {
				// xử lí
				if (range.contains("tren")) {
					startRange = 15000000;
					listProduct = DAO_ListProduct.getDao_ListProduct().getListFollowPricesBigger(startRange)
							.getLstProduct();

				} else if (range.contains("duoi")) {
					endRange = 1000000;
					listProduct = DAO_ListProduct.getDao_ListProduct().getListFollowPricesSmaller(endRange)
							.getLstProduct();
				} else {
					startRange = getListNumber(range)[0] * 1000000;
					endRange = getListNumber(range)[1] * 1000000;
					listProduct = DAO_ListProduct.getDao_ListProduct().getListFollowPrices(startRange, endRange)
							.getLstProduct();

				}

			} else if (aspect != null) {
				listProduct = DAO_ListProduct.getDao_ListProduct().getListFollowtType(aspect).getLstProduct();
			} else {
				// trar ve trang ko tìm thấy
				response.sendRedirect(request.getContextPath() + "/KhongTimThaySanPham");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(listProduct.size());
		System.out.println("Branch ===>" + branchName);
		System.out.println("first  ===>" + startRange);
		System.out.println("last ===>" + endRange);
		System.out.println("moi/cu ====>" + aspect);
		System.out.println("________________________________________");
		request.setAttribute("lstPrices", listProduct);
		RequestDispatcher dispatcher // dẫn link dùm t set cái link jsp
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/result-searching.jsp");
		dispatcher.forward(request, response);

	}

	private int[] getListNumber(String priceRange) {
		int[] arr = new int[2];
		int i = 0;
		Pattern p = Pattern.compile("\\d+");
		Matcher m = p.matcher(priceRange);
		while (m.find()) {
			arr[i] = Integer.parseInt(m.group());
			i++;
		}
		return arr;
	}
}
