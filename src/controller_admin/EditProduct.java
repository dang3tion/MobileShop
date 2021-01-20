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
import model_DAO.DAO_EditProduct;
import model_DAO.DAO_EditProduct.TABLE;
import model_DAO.DAO_Product_main;
import model_beans.AttributeClass;
import model_beans.AttributeManager;
import model_beans.Branch;
import model_beans.Color_product;
import model_beans.Product_main;

@WebServlet(urlPatterns = "/admin/product-edit")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Product_main p;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Color_product> listColor = DAO_Color.getInstance().getAllColor();
		ArrayList<Branch> listBranch = DAO_Branch.getDAO_Branch().getAllBranch();
		Map<AttributeClass, ArrayList<AttributeManager>> map = DAO_Attribute.getInstance().getAllAttributesClasses();
		Map<AttributeClass, ArrayList<ArrayList<AttributeManager>>> arrMap = new LinkedHashMap<AttributeClass, ArrayList<ArrayList<AttributeManager>>>();
//		for (AttributeClass a : map.keySet()) {
//			ArrayList<ArrayList<AttributeManager>> arrAtt = new ArrayList<ArrayList<AttributeManager>>();
//			arrAtt.add(map.get(a));
//			arrMap.put(a, arrAtt);
//		}
//		HttpSession session = request.getSession();
//		if (session.getAttribute("arrMap") == null) {
//			session.setAttribute("arrMap", arrMap);
//		}

		request.setAttribute("listColor", listColor);
		request.setAttribute("listBranch", listBranch);
		request.setAttribute("listAttribute", map);

		String id = request.getParameter("MASP");
		HttpSession session = request.getSession();
		if (id == null) {
			if (session.getAttribute("MASP-EDIT") != null) {
				id = (String) session.getAttribute("MASP-EDIT");
			}
		} else {
			session.setAttribute("MASP-EDIT", id);
		}
		p = DAO_Product_main.getDao_Product_main().getProduct_main(id);
		request.setAttribute("product", p);

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-product-edit.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reString = "";
		if (request.getParameter("confirm-add-product") != null) {

			String name = request.getParameter("name").trim();

			String idBranch = request.getParameter("branch").trim();
			String type = request.getParameter("type").trim();
			String status = request.getParameter("status").trim();
			String price = request.getParameter("price").trim();
			String priceSale = "0";

			if (name.isBlank()) {
				reString = "Tên không được bỏ trống";

			} else if (price.isBlank()) {
				reString = "Giá không được bỏ trống";
			} else {

				if (request.getParameter("priceSale") != null || !request.getParameter("priceSale").isBlank()) {
					priceSale = request.getParameter("priceSale").trim();
				}

				String[] colorId = request.getParameterValues("color-name");
				String[] colorRgb = request.getParameterValues("color-rgb");
				String[] imgMain = request.getParameterValues("color-imgmain");
				String[] attributeId = request.getParameterValues("att-id");
				String[] attributeValue = request.getParameterValues("att-value");
				String[] quantity = request.getParameterValues("quantity");
				String introduced = request.getParameter("introduce");

				for (int i = 0; i < p.getColors().size(); i++) {
					String[] imgSub = request.getParameterValues("color" + (i + 1));

					if (imgSub.length > p.getColors().get(i).getImgSubs().size()) {

						for (int j = p.getColors().get(i).getImgSubs().size(); j < imgSub.length; j++) {
							addPicture(p.getID(), colorId[i], imgSub[j].trim(), "PHU");
						}
					}
					if (colorId[i] != p.getColors().get(i).getId()) {

					}

				}
				if (colorId.length > p.getColors().size()) {
					for (int i = p.getColors().size(); i < colorId.length; i++) {
						addPicture(p.getID(), colorId[i], imgMain[i].trim(), "NEN");
						String[] imgSub = request.getParameterValues("color" + (i + 1));
						addQuantity(p.getID(), colorId[i], Integer.parseInt(quantity[i]));
						for (int j = 0; j < imgSub.length; j++) {
							addPicture(p.getID(), colorId[i], imgSub[j].trim(), "PHU");
						}
					}
				}

				Map<String, String> map = new LinkedHashMap<String, String>();

				for (int i = 0; i < attributeId.length; i++) {
					if (!attributeValue[i].isBlank()) {
						map.put(attributeId[i].trim(), attributeValue[i].trim());
					}
				}
				String idProduct = addProduct(map, name, idBranch, convertType(type), converStatus(status), introduced,
						price, priceSale);

				for (int i = 0; i < colorId.length; i++) {
					addPicture(idProduct, colorId[i], imgMain[i].trim(), "NEN");
					String[] imgSub = request.getParameterValues("color" + (i + 1));

					addQuantity(idProduct, colorId[i], Integer.parseInt(quantity[i]));
					for (int j = 0; j < imgSub.length; j++) {
						addPicture(idProduct, colorId[i], imgSub[j].trim(), "PHU");
					}
				}
				reString = "Thêm sản phẩm thành công";

//				System.out.printf("name %s branch %s type %s status %s price %s priceSale %s", name, idBranch, type,
//						status, price, priceSale);
//				System.out.println();
			}
		} else {
			reString = "Thêm sản phẩm không thành công";
		}
		request.setAttribute("reString", reString);

		doGet(request, response);
	}

	public String updateImg(String value, String colorId, String type) {
		if (DAO_EditProduct.getInstance().updateURLImage(TABLE.HINHANH, p.getID(), colorId, type, value)) {
			return "Cập nhật ảnh thành công";

		}

		return "Cập nhật ảnh thất bại";
	}

	public String updateQuantity(String value, String colorId) {
		if (DAO_EditProduct.getInstance().updateQuantityProduct(TABLE.SOLUONG_SP, p.getID(), colorId,
				Integer.parseInt(value))) {
			return "Cập nhật số lượng thành công";
		}
		return "Cập nhật số lượng thất bại";

	}

	public String updateImgMain(String colorId, String idColorCurrent) {
		if (DAO_EditProduct.getInstance().updateColorProduct(TABLE.HINHANH, p.getID(), colorId, idColorCurrent)
				&& DAO_EditProduct.getInstance().updateColorProduct(TABLE.SOLUONG_SP, p.getID(), colorId,
						idColorCurrent)) {
			return "Cập nhật ảnh nền thành công";
		}
		return "Cập nhật ảnh nền thất bại";
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
					System.out.println("ACTION");
				}
			}

			if (i != count) {
				System.out.println(i);

			}
		}
	}

}
