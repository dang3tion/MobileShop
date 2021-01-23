package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Branch;

@WebServlet(urlPatterns = "/admin/warehouse/branch")
public class Controller_Branch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BO_Branch bo = new BO_Branch();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("listBranch", bo.getListBranch(1, 1000));
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-branch.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("searchBranch");
		String id = request.getParameter("id");
		String newBranch = request.getParameter("newBranch");
		if (search != null) {
			// hàm search
			request.setAttribute("listBranch", bo.getListSearch(search, 1, 1000));
		}
		if (id != null) {
			bo.updateState(id);
			request.setAttribute("messageblock", "Thay đổi của bạn đã được cập nhật.");
			request.setAttribute("listBranch", bo.getListBranch(1, 1000));
		}
		if (newBranch != null) {
			if (!bo.checkAdd(newBranch)) {
				bo.addBranch(newBranch);
				request.setAttribute("messageAdd", "Thương hiệu "+newBranch+" đã được thêm.");
				request.setAttribute("listBranch", bo.getListBranch(1, 1000));
			} else {
				request.setAttribute("messageAdd", "<span style='color: red;'>Thương hiệu "+newBranch+" đã tồn tại.</span>");
				request.setAttribute("listBranch", bo.getListBranch(1, 1000));
			}
		}

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-branch.jsp");
		dispatcher.forward(request, response);
	}

}
