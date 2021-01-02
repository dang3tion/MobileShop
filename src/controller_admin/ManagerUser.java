package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Account;
import model_utility.Const;

@WebServlet(urlPatterns = "/admin/user")
public class ManagerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BO_Account bo = new BO_Account(1, 20);

		request.setAttribute("STTstart", bo.startRow());
		request.setAttribute("totalAccount", bo.getTotalAccount());
		request.setAttribute("TongSoAccDangHoatDong", bo.getTotalStatusAccount(Const.ACCOUNT_ENABLE));
		request.setAttribute("TongSoAccBiKhoa", bo.getTotalStatusAccount(Const.ACCONT_DISABLE));

		request.setAttribute("listUser", bo.getList());
		request.setAttribute("totalAccountCreateToday", bo.getTotalAccountCreatedToday());
		request.setAttribute("DEFAUTL_TABLE", true);
		request.setAttribute("totalPage", bo.totalPage());
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-user.jsp");
		dispatcher.forward(request, response);
		return;
	}

}
