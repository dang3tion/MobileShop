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
import model_DAO.DAO_Log;
import model_DAO.DAO_EditProduct.EDIHT;
import model_DAO.DAO_EditProduct.TABLE;
import model_DAO.DAO_Product_main;
import model_beans.Account;
import model_beans.AttributeClass;
import model_beans.AttributeManager;
import model_beans.Branch;
import model_beans.Color_product;
import model_beans.Product_main;
import model_utility.Const;

@WebServlet(urlPatterns = "/admin/warehouse/product-edit")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Product_main p;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Color_product> listColor = DAO_Color.getInstance().getAllColor();
		ArrayList<Branch> listBranch = DAO_Branch.getDAO_Branch().getAllBranch();
		Map<AttributeClass, ArrayList<AttributeManager>> map = DAO_Attribute.getInstance().getAllAttributesClasses();
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
		boolean isConfirm = false;
		if (request.getParameter("confirm-edit-product") != null) {
			boolean result = true;
			String name = request.getParameter("name").trim();
			String idBranch = request.getParameter("branch").trim();
			String type = request.getParameter("type").trim();
			String status = request.getParameter("status").trim();
			String price = converNumber(request.getParameter("price").trim());
			String priceSale = "0";
			String[] colorId = request.getParameterValues("color-name");
			String[] colorRgb = request.getParameterValues("color-rgb");
			String[] imgMain = request.getParameterValues("color-imgmain");
			String[] attributeId = request.getParameterValues("att-id");
			String[] attributeValue = request.getParameterValues("att-value");
			String[] quantity = request.getParameterValues("quantity");
			String introduced = request.getParameter("introduce");
			if (request.getParameter("priceSale") != null || !request.getParameter("priceSale").isBlank()) {
				priceSale = converNumber(request.getParameter("priceSale").trim());
			}
			for (int i = 0; i < colorId.length; i++) {
				if (!result) {
					break;
				}
				for (int j = i + 1; j < colorId.length; j++) {
					if (colorId[i].equals(colorId[j])) {
						reString = "Trường màu sắc bị trùng";
						result = false;
						break;
					}
				}
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

				// UPDATE IMAGE ON AND ADD NEW SUB IMG IF HAVE IT
				if (result != false) {
					for (int i = 0; i < p.getColors().size(); i++) {
						String[] imgSub = request.getParameterValues("color" + (i + 1));
						// ADD NEW SUB IMAGE
						if (imgSub.length > p.getColors().get(i).getImgSubs().size()) {

							for (int j = p.getColors().get(i).getImgSubs().size(); j < imgSub.length; j++) {
								if (!imgSub[j].isBlank()) {
									addPicture(p.getID(), colorId[i], imgSub[j].trim(), "PHU");

								}
							}
						}
						// UPDATE COLOR
						if (!colorId[i].equals(p.getColors().get(i).getId())) {
							updateColor(colorId[i], p.getColors().get(i).getId());
						}
						// UPADTE MAIN IMG
						if (!imgMain[i].equals(p.getColors().get(i).getImgMain())) {
							updateImg(imgMain[i], colorId[i], "NEN", p.getColors().get(i).getImgMain());
						} // UPDATE QUANTITY
						if (!quantity[i].equals(p.getQuantity() + "")) {
							updateQuantity(quantity[i], colorId[i]);
						}
						// UPDATE SUB IMG

						for (int j = 0; j < p.getColors().get(i).getImgSubs().size(); j++) {
							if (imgSub[j].isBlank()) {
								DAO_EditProduct.getInstance().deleteImg(p.getID(), colorId[i], "PHU",
										p.getColors().get(i).getImgSubs().get(j));
							}
							if (!imgSub[j].trim().equals(p.getColors().get(i).getImgSubs().get(j).trim())) {
								updateImg(imgSub[j].trim(), colorId[i], "PHU",
										p.getColors().get(i).getImgSubs().get(j));
							}
						}

					}
					// ADD NEW COLOR
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

					// UPDATE FORM PROPERTY
					if (!name.trim().equals(p.getName())) {
						updateProperty(name, EDIHT.TENSP);
					}
					if (!idBranch.equals(p.getID())) {
						updateProperty(idBranch, EDIHT.MATH);
					}
					if (!convertType(type).equals(p.getType())) {
						updateProperty(convertType(type), EDIHT.LOAI_SP);
					}
					if (!converStatus(status).equals(p.getStatus())) {
						updateProperty(converStatus(status), EDIHT.TINHTRANG);
					}
					if (!introduced.equals(p.getPosts())) {
						updateProperty(introduced, EDIHT.GIOITHIEU);
					}

					if (!price.trim().equals(p.getPrices().getPrice() + "")
							&& !priceSale.trim().equals(p.getPrices().getPriceSales() + "")) {
						updatePrice(price, priceSale);
					} else if (!price.trim().equals(p.getPrices().getPrice() + "")) {
						updatePrice(price.trim(), p.getPrices().getPriceSales() + "");

					} else if (!priceSale.trim().equals(p.getPrices().getPriceSales() + "")) {
						updatePrice(p.getPrices().getPrice() + "", priceSale.trim());
					}

					Map<String, String> map = new LinkedHashMap<String, String>();

					for (int i = 0; i < attributeId.length; i++) {
						if (!attributeValue[i].isBlank()) {
							map.put(attributeId[i].trim(), attributeValue[i].trim());
						}
					}
					updateAttributes(map);

					reString = "Thêm sản phẩm thành công";
				}
			}
			HttpSession session = request.getSession();

			Account acount = (Account) session.getAttribute(Const.ADMIN_LOGINED);

			String idStaff = acount.getId();
			new DAO_Log().update(idStaff, "Chỉnh sửa sản phẩm",
					"Chỉnh sửa sản phẩm  với mã sản phẩm: "+session.getAttribute("MASP-EDIT") + " và tên:"+name);
			isConfirm = true;
			request.setAttribute("reString", reString);
			request.setAttribute("result", result);
		}
		request.setAttribute("confirm", isConfirm);

		doGet(request, response);
	}

	public String updatePrice(String price, String priceSale) {
		if (DAO_EditProduct.getInstance().updatePrice(Integer.parseInt(price), Integer.parseInt(priceSale),
				p.getID())) {
			return "Cập nhật giá thành công";

		}
		return "Cập nhật giá thất bại";
	}

	public String updateProperty(String value, EDIHT column) {
		if (DAO_EditProduct.getInstance().updateColumnProduct(TABLE.SANPHAM, column, p.getID(), value)) {
			return "Cập nhật thuộc tính thành công";

		}
		return "Cập nhật thuộc tính thất bại";

	}

	public String updateImg(String value, String colorId, String type, String currentValue) {
		if (DAO_EditProduct.getInstance().updateURLImage(TABLE.HINHANH, p.getID(), colorId, type, value,
				currentValue)) {
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

	public String updateColor(String colorId, String idColorCurrent) {
		if (DAO_EditProduct.getInstance().updateColorProduct(TABLE.HINHANH, p.getID(), colorId, idColorCurrent)
				&& DAO_EditProduct.getInstance().updateColorProduct(TABLE.SOLUONG_SP, p.getID(), colorId,
						idColorCurrent)) {
			return "Cập nhật màu sắc thành công";
		}
		return "Cập nhật màu sắc thất bại";
	}

	public String mergerConfiguration(ArrayList<String> arr) {
		String id = p.getIdCongfig();
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

	public String updateAttributes(Map<String, String> map) {
		DAO_EditProduct.getInstance().deleteConfig(p.getIdCongfig());
		String id = mergerConfiguration(addDetaiAttribute(map));
		return "Mã cấu hình đã cập nhật " + id;
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

	public String converNumber(String number) {
		return number.replaceAll("\\.", "");
	}

	public static void main(String[] args) {
	}

}
