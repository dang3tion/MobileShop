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
import model_DAO.DAO_Account;
import model_utility.Const;

@WebServlet(urlPatterns = "/employee/searchUser")
public class AdminSearchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String keyword = (String) request.getParameter("keyword");
		
		int currentPage = 1;
		if (session.getAttribute("CURRENT_PAGE_SEARCH_USER") == null) {
			session.setAttribute("CURRENT_PAGE_SEARCH_USER", 1);
		} else {
			currentPage = (Integer) session.getAttribute("CURRENT_PAGE_SEARCH_USER");
		}

		BO_Account bo = new BO_Account(currentPage, 20);

		request.setAttribute("STTstart", bo.startRow());
		request.setAttribute("totalAccount", bo.getTotalAccount());
		request.setAttribute("TongSoAccDangHoatDong", bo.getTotalStatusAccount(Const.ACCOUNT_ENABLE));
		request.setAttribute("TongSoAccBiKhoa", bo.getTotalStatusAccount(Const.ACCONT_DISABLE));

		request.setAttribute("totalSearch",DAO_Account.getDaoAccount().totalSearch(keyword) );
		request.setAttribute("keyword", keyword);
		request.setAttribute("listUser", bo.search(keyword, 1, 99999));
		request.setAttribute("totalAccountCreateToday", bo.getTotalAccountCreatedToday());
		request.setAttribute("totalPage", bo.totalPage());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/employee/admin-search-user.jsp");
		dispatcher.forward(request, response);
		return;
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = (String) request.getParameter("email");
		BO_Account.getBoAccount().on_off_account(email);

		response.sendRedirect(request.getContextPath() + "/employee/searchUser");
		return;

	}


}
