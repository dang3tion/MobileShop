package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Account;
import model_utility.Const;

@WebServlet(urlPatterns = "/admin/cskh/user")
public class ManagerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		int currentPage = 1;
		if (session.getAttribute("CURRENT_PAGE_MANAGEMENT_USER") == null) {
			session.setAttribute("CURRENT_PAGE_MANAGEMENT_USER", 1);
		} else {
			currentPage = (Integer) session.getAttribute("CURRENT_PAGE_MANAGEMENT_USER");
		}

		BO_Account bo = new BO_Account(currentPage, 15);

		request.setAttribute("STTstart", bo.startRow());
		request.setAttribute("totalAccount", bo.getTotalAccount());
		request.setAttribute("TongSoAccDangHoatDong", bo.getTotalStatusAccount(Const.ACCOUNT_ENABLE));
		request.setAttribute("TongSoAccBiKhoa", bo.getTotalStatusAccount(Const.ACCONT_DISABLE));

		request.setAttribute("listUser", bo.getList());
		request.setAttribute("totalAccountCreateToday", bo.getTotalAccountCreatedToday());
		request.setAttribute("totalPage", bo.totalPage());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-user.jsp");
		dispatcher.forward(request, response);
		return;
	}
	
	
	

}
