package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_DAO.DAO_IconMenu;

@WebServlet("/admin/config")
public class ConfigGUI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO_IconMenu dao = new DAO_IconMenu();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("list", dao.listIconMenu());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/addmin-config-web.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String icon1 = request.getParameter("icon1");
		String content1 = request.getParameter("content1");
		String icon2 = request.getParameter("icon2");
		String content2 = request.getParameter("content2");
		String icon3 = request.getParameter("icon3");
		String content3 = request.getParameter("content3");
		String icon4 = request.getParameter("icon4");
		String content4 = request.getParameter("content4");
		dao.updateIcon(icon1, content1, icon2, content2, icon3, content3, icon4, content4);
		request.setAttribute("messageEdit", "Đã cập nhật thay đổi.");
		doGet(request, response);
	}

}
