package controller_admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_AddProduct;
import model_DAO.DAO_Attribute;
import model_DAO.DAO_Branch;
import model_DAO.DAO_Color;
import model_beans.AttributeClass;
import model_beans.AttributeManager;
import model_beans.Branch;
import model_beans.Color_product;

@WebServlet(urlPatterns = "/admin/warehouse/product-add")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Color_product> listColor = DAO_Color.getInstance().getAllColor();
		ArrayList<Branch> listBranch = DAO_Branch.getDAO_Branch().getAllBranch();
		Map<AttributeClass, ArrayList<AttributeManager>> map = DAO_Attribute.getInstance().getAllAttributesClasses();
		Map<AttributeClass, ArrayList<ArrayList<AttributeManager>>> arrMap = new LinkedHashMap<AttributeClass, ArrayList<ArrayList<AttributeManager>>>();
		for (AttributeClass a : map.keySet()) {
			ArrayList<ArrayList<AttributeManager>> arrAtt = new ArrayList<ArrayList<AttributeManager>>();
			arrAtt.add(map.get(a));
			arrMap.put(a, arrAtt);
		}
		HttpSession session = request.getSession();
		session.setAttribute("arrMap", arrMap);

		request.setAttribute("listColor", listColor);
		request.setAttribute("listBranch", listBranch);
		request.setAttribute("listAttribute", map);

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-product-add.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isConfirm = false;
		if (request.getParameter("confirm-add-product") != null) {
			String reString = "";
			boolean result = true;
			String name = request.getParameter("name").trim();
			String idBranch = request.getParameter("branch").trim();
			String type = request.getParameter("type").trim();
			String status = request.getParameter("status").trim();
			String price = request.getParameter("price").trim();
			String priceSale = "0";
			String[] colorId = request.getParameterValues("color-name");
			String[] colorRgb = request.getParameterValues("color-rgb");
			String[] imgMain = request.getParameterValues("color-imgmain");
			String[] attributeId = request.getParameterValues("att-id");
			String[] attributeValue = request.getParameterValues("att-value");
			String[] quantity = request.getParameterValues("quantity");
			String introduced = request.getParameter("introduce");

			Map<String, String> map = new LinkedHashMap<String, String>();
			if (request.getParameter("priceSale") != null || !request.getParameter("priceSale").isBlank()) {
				priceSale = request.getParameter("priceSale").trim();
			}
			for (int i = 0; i < imgMain.length; i++) {
				if (imgMain[i].isBlank()) {
					reString = "Trường ảnh nền bị trống";
					result = false;
				}

			}
			if (name.isBlank()) {
				reString = "Tên không được bỏ trống";
				result = false;

			} else if (price.isBlank()) {
				reString = "Giá không được bỏ trống";
				result = false;
			} else {

				if (result != false) {
					for (int i = 0; i < attributeId.length; i++) {
						if (!attributeValue[i].isBlank()) {
							map.put(attributeId[i].trim(), attributeValue[i].trim());
						}
					}
					String idProduct = addProduct(map, name, idBranch, convertType(type), converStatus(status),
							introduced, price, priceSale);

					for (int i = 0; i < colorId.length; i++) {

						addPicture(idProduct, colorId[i], imgMain[i].trim(), "NEN");
						String[] imgSub = request.getParameterValues("color" + (i + 1));

						addQuantity(idProduct, colorId[i], Integer.parseInt(quantity[i]));
						for (int j = 0; j < imgSub.length; j++) {
							addPicture(idProduct, colorId[i], imgSub[j].trim(), "PHU");
						}
					}

				}

			}
			isConfirm = true;
			request.setAttribute("result", result);
			request.setAttribute("reString", reString);
			request.setAttribute("name", name);
			request.setAttribute("price", price);
			request.setAttribute("priceSale", priceSale);
			request.setAttribute("ims", imgMain);
			request.setAttribute("introduce", introduced);
		}

		request.setAttribute("confirm", isConfirm);
		doGet(request, response);

	}

	public String mergerConfiguration(ArrayList<String> arr) {
		String id = DAO_AddProduct.getInstance().createIdConfig();
		id = DAO_AddProduct.getInstance().addConfig(id, arr.size());
		for (String s : arr) {
			DAO_Attribute.getInstance().addConfiguration(id, s);
		}
		return id;
	}

	public ArrayList<String> addDetaiAttribute(Map<String, String> map) {
		ArrayList<String> arr = new ArrayList<String>();
		for (String s : map.keySet()) {
			arr.add(DAO_Attribute.getInstance().getIdDetail(map.get(s), s));
		}
		return arr;
	}

	public String addProduct(Map<String, String> map, String name, String idBranch, String type, String status,
			String introduce, String price, String priceSale) {
		String idConfig = mergerConfiguration(addDetaiAttribute(map));
		String id = DAO_AddProduct.getInstance().addProduct(name, type, idBranch, status, introduce, idConfig);
		addPrice(id, Integer.parseInt(price), Integer.parseInt(priceSale));
		return id;
	}

	public boolean addPrice(String id, int price, int priceSale) {
		return DAO_AddProduct.getInstance().addPrice(id, price, priceSale);
	}

	public boolean addPicture(String id, String idColor, String url, String type) {
		return DAO_AddProduct.getInstance().addImg(id, idColor, url, type);
	}

	public boolean addQuantity(String id, String idColor, int quantity) {
		return DAO_AddProduct.getInstance().addQuantity(id, idColor, quantity);
	}

	public String convertType(String type) {
		if (type.toUpperCase().equals("MOI")) {
			return "Mới";
		}
		return "Cũ";
	}

	public String converStatus(String status) {
		if (status.toUpperCase().equals("DANG BAN")) {
			return "Đang bán";
		}
		if (status.toUpperCase().equals("NGUNG KINH DOANH")) {
			return "Ngưng kinh doanh";
		}
		return "Hết hàng";
	}

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			int count = 0;
			for (int j = 0; j < 9; j++) {
				if (i == j) {
					count = j;
				}
			}

			if (i != count) {

			}
		}
	}
}
