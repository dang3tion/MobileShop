package controller_admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_Attribute;
import model_beans.AttributeClass;
import model_beans.AttributeManager;

@WebServlet(urlPatterns = "/admin/warehouse/attribute")
public class Attribute extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TRANSACTION

		ArrayList<AttributeClass> listClass = (ArrayList<AttributeClass>) DAO_Attribute.getInstance()
				.getAllClassAttributes();
		request.setAttribute("listClass", listClass);
		// Divide page
		int currentPage = 1;
		HttpSession session = request.getSession();
		if (session.getAttribute("current_page") != null) {
			currentPage = (int) session.getAttribute("current_page");
		} else {
			session.setAttribute("current_page", currentPage);
		}
		ArrayList<AttributeManager> listAttributes = (ArrayList<AttributeManager>) DAO_Attribute.getInstance()
				.getListAttributesMain((currentPage - 1) * 10 + 1, currentPage * 10);
//		

		request.setAttribute("STT", (currentPage - 1) * 10 + 1);
		request.setAttribute("totalPage", DAO_Attribute.getInstance().numberOfPage(10));
		request.setAttribute("listAttributes", listAttributes);

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-attribute.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String reString = null;
		if (request.getParameter("button-add-class") != null) {
			String name = request.getParameter("class-attribute");
			if (name.isBlank()) {
				reString = "Tên không hợp lệ";
			} else if (addClassAttribute(name)) {
				reString = "Thêm nhóm mới thành công";
			} else {
				reString = "Thêm nhóm mới không thành công tên nhóm bị trùng";
			}
		} else if (request.getParameter("add-attribute") != null) {
			String name = request.getParameter("name-attribute");
			String type = request.getParameter("type");
			String className = request.getParameter("class-attribute");
			if (name.isBlank()) {
				reString = "Tên không hợp lệ";
			} else if (addAttribute(name, type, className)) {
				reString = "Thêm thuộc tính mới thành công";
			} else {
				reString = "Thêm thuộc tính mới không thành công, nội dung thêm bị trùng";
			}
		}
		if (reString != null) {
			request.setAttribute("reString", reString);
		}
		doGet(request, response);
	}

	public boolean addClassAttribute(String name) {

		return DAO_Attribute.getInstance().addAttributeClass(name);
	}

	public boolean addAttribute(String name, String type, String className) {
		return DAO_Attribute.getInstance().addAttributesManager(name, type, className);
	}
}
