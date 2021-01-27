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
import javax.servlet.http.HttpSession;

import model_DAO.DAO_ListProduct;
import model_DAO.DAO_ListProduct.LISTP;
import model_DAO.DAO_ListProduct.ORDER;
import model_DAO.DAO_ListProduct.SELECT;
import model_beans.ListProduct;
import model_beans.Product_form;

@WebServlet(urlPatterns = "/searchingProduct")
public class Searching_Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "searchingProduct";

		String typeList = request.getParameter("dssanpham");
		ListProduct listMain = new ListProduct();
		String branchName = request.getParameter("thuonghieu");
		String range = request.getParameter("khoanggia");
		Integer startRange = null;
		Integer endRange = null;
		String aspect = request.getParameter("tinhtrang");
		int page = 1;
		if (request.getParameter("p") != null) {
			page = Integer.parseInt(request.getParameter("p"));
		}
		try {
			if (typeList != null) {

				switch (typeList) {
				case "sanphamnoibat": {
					// số 100 là số lượng lấy ra, vì câu lệnh sql bắt buộc phải nhập số lượng mới
					// cho lấy ra list sản phẩm
					listMain = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.SPECIAL, 100);
					url = "searchingProduct?dssanpham=sanphamnoibat";
					break;
				}
				case "sanphammoi": {
					// số 100 là số lượng lấy ra, vì câu lệnh sql bắt buộc phải nhập số lượng mới
					// cho lấy ra list sản phẩm
					listMain = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.NEW, 100);
					url = "searchingProduct?dssanpham=sanphammoi";
					break;
				}
				case "sanphamgiacao": {
					// số 100 là số lượng lấy ra, vì câu lệnh sql bắt buộc phải nhập số lượng mới
					// cho lấy ra list sản phẩm
					listMain = DAO_ListProduct.getDao_ListProduct().getListProMenu(LISTP.HIGHESTPRICE, 100);
					url = "searchingProduct?dssanpham=sanphamgiacao";
					break;
				}
				default:
					break;
				}

			} else if (branchName != null) {
				listMain = DAO_ListProduct.getDao_ListProduct().getListFollowBranch(branchName);
				url = "searchingProduct?thuonghieu=" + branchName;
			} else if (range != null) {
				// xử lí
				if (range.contains("tren")) {
					startRange = 15000000;
					listMain = DAO_ListProduct.getDao_ListProduct().getListFollowPricesBigger(startRange);
					url = "searchingProduct?khoanggia=tren-15-trieu";
				} else if (range.contains("duoi")) {
					endRange = 1000000;
					listMain = DAO_ListProduct.getDao_ListProduct().getListFollowPricesSmaller(endRange);
					url = "searchingProduct?khoanggia=duoi-1-trieu";
				} else {
					startRange = getListNumber(range)[0] * 1000000;
					endRange = getListNumber(range)[1] * 1000000;
					listMain = DAO_ListProduct.getDao_ListProduct().getListFollowPrices(startRange, endRange);
					url = "searchingProduct?khoanggia=tu-" + getListNumber(range)[0] + "-den-" + getListNumber(range)[1]
							+ "-trieu";
				}

			} else if (aspect != null) {

				listMain = DAO_ListProduct.getDao_ListProduct().getListFollowtType(convertType(aspect));
				url = "searchingProduct?tinhtrang=" + aspect;

			} else {
				// trar ve trang ko tìm thấy
				response.sendRedirect(request.getContextPath() + "/KhongTimThaySanPham");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String priceUrl = "";
		String orderUrl = "";
		String price = "";
		String order = "";
		if (request.getParameter("gia") != null) {
			price = request.getParameter("gia");
			priceUrl = "&gia=" + price;
		}

		if (request.getParameter("sapxep") != null) {
			order = request.getParameter("sapxep");
			orderUrl = "&sapxep=" + order;
		}
		ArrayList<Product_form> listProduct = new ArrayList<Product_form>();
		try {
			listProduct = orderList(listMain, price, order, (page - 1) * 10 + 1, page * 9);

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(url);
		System.out.println(orderUrl);
		System.out.println(priceUrl);
		System.out.println("-----------");
		request.setAttribute("current_page", page);
		try {
			request.setAttribute("totalPage",
					getTotalPage(DAO_ListProduct.getDao_ListProduct().getTotalList(listMain), 9));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		listMain.setLstProduct(listProduct);
		HttpSession session = request.getSession();
		session.setAttribute("listMain", listMain);
		request.setAttribute("urlOrder", orderUrl);
		request.setAttribute("urlPrice", priceUrl);
		request.setAttribute("urlSearch", url);
		request.setAttribute("lstProduct", listProduct);

		RequestDispatcher dispatcher // dẫn link dùm t set cái link jsp
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/result-searching.jsp");
		dispatcher.forward(request, response);

	}

	public int getTotalPage(int totalCard, int cardPage) {
		int result = totalCard / cardPage;
		if (totalCard % cardPage >= 1) {
			result += 1;
		}

		return result;
	}

	public ArrayList<Product_form> orderList(ListProduct list, String price, String order, int start, int end)
			throws NumberFormatException, SQLException {
		if (!price.isBlank()) {
			list.addOrderLIst(convertSelect("gia"), convertOder(price));
		}
		if (!order.isBlank()) {
			list.addOrderLIst(convertSelect(order), convertOder(order));
		}
		return DAO_ListProduct.getDao_ListProduct().orderListProduct(list, list.getQueryOrder(start, end));
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

	public ORDER convertOder(String s) {
		switch (s.trim()) {
		case "cao-thap": {
			return ORDER.DESC;
		}
		case "thap-cao": {
			return ORDER.ASC;
		}
		case "moicapnhat": {
			return ORDER.DESC;
		}
		case "sp-moi-cu": {
			return ORDER.ASC;
		}
		case "sp-cu-moi": {
			return ORDER.DESC;
		}
		case "ten-a-z": {
			return ORDER.ASC;
		}
		case "ten-z-a": {
			return ORDER.DESC;
		}
		case "luotxemnhieu": {
			return ORDER.DESC;
		}
		case "danhgiacao": {
			return ORDER.DESC;
		}
		default:
			return null;
		}
	}

	public SELECT convertSelect(String s) {
		switch (s.trim()) {
		case "gia": {
			return SELECT.PRICE;
		}
		case "moicapnhat": {
			return SELECT.DATE;
		}
		case "sp-moi-cu": {
			return SELECT.TYPE;
		}
		case "sp-cu-moi": {
			return SELECT.TYPE;
		}
		case "ten-a-z": {
			return SELECT.NAME;
		}
		case "ten-z-a": {
			return SELECT.NAME;
		}
		case "luotxemnhieu": {
			return SELECT.VIEW;
		}
		case "danhgiacao": {
			return SELECT.EVALUATE;
		}
		default:
			return null;
		}
	}

	public String convertType(String type) {
		if (type.toUpperCase().equals("MOI")) {
			return "Mới";
		}
		return "Cũ";
	}
}
