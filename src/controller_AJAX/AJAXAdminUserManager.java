package controller_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_BO_service.BO_Account;
import model_DAO.DAO_Log;
import model_beans.Account;
import model_utility.Const;

@WebServlet("/AJAXAdminUserManager")
public class AJAXAdminUserManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/// Người dùng chọn nút xem danh sách tài khoản đang hoạt động
		String chedoXem = (String) request.getParameter("cheDoXem");

		RequestDispatcher dispatcher;
		if (chedoXem != null) {

			if (chedoXem.equals("disable")) {
				BO_Account bo = new BO_Account(1, 20);
				request.setAttribute("listUser", bo.getListAccountStatus(Const.ACCONT_DISABLE));
				request.setAttribute("STTstart", bo.startRow());
			} else {
				BO_Account bo2 = new BO_Account(1, 20);
				request.setAttribute("listUser", bo2.getListAccountStatus(Const.ACCOUNT_ENABLE));
				request.setAttribute("STTstart", bo2.startRow());
			}

			dispatcher //
					= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/user-table.jsp");
			dispatcher.forward(request, response);
			return;
		}
		int page = Integer.parseInt((String) request.getParameter("page"));
		updateCurrentPage(request, page);
		BO_Account bo = new BO_Account(page, 20);
		request.setAttribute("listUser", bo.getList());
		request.setAttribute("STTstart", bo.startRow());
		dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/user-table.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = Integer.parseInt((String) request.getParameter("page"));
		String email = (String) request.getParameter("email");
		
		HttpSession session = request.getSession();
		
		Account acount = (Account) session.getAttribute(Const.ADMIN_LOGINED);
		
		String idStaff = acount.getId();
		
		updateCurrentPage(request, page);
		BO_Account.getBoAccount().on_off_account(email);

		BO_Account bo = new BO_Account(page, 20);
		String stateLog = bo.stateLog(email);
				new DAO_Log().update(idStaff, "Thay đổi trạng thái tài khoản", "Chuyển tài khoản ("+ email+") thành trạng thái "+stateLog);
				
		request.setAttribute("listUser", bo.getList());
		request.setAttribute("STTstart", bo.startRow());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-component/user-table.jsp");
		dispatcher.forward(request, response);

	}

	private void updateCurrentPage(HttpServletRequest request, int page) {
		HttpSession session = request.getSession();

		session.setAttribute("CURRENT_PAGE_MANAGEMENT_USER", page);
	}

}
