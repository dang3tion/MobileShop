package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BO_Service.BO_Account;
import model.beans.Account;
import model.utility.Const;

@WebServlet(urlPatterns = "/admin/user")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		String nrow = request.getParameter("nrow");
		if (page == null) {
			page = "1";
		}

		if (nrow == null) {
			nrow = "10";
		}

		String keyword = request.getParameter("keyword");
		List<Account> listAcc = null;
		if (keyword != null) {
			int start = (Integer.parseInt(nrow) * Integer.parseInt(page)) - (Integer.parseInt(nrow) + 1);
			int end = Integer.parseInt(nrow) * Integer.parseInt(page);
			listAcc = (new BO_Account(page, nrow)).search(keyword, start, end);
			request.setAttribute("TongSoTrang", (new BO_Account(page, nrow)).totalPageSearch(keyword));
			request.setAttribute("totalSearch", (new BO_Account(page, nrow)).totalSearch(keyword));
		} else {
			listAcc = (new BO_Account(page, nrow)).get();
			request.setAttribute("TongSoTrang", (new BO_Account(page, nrow)).totalPage());
		}

		request.setAttribute("listAcc", listAcc);

//		request.setAttribute("TongSoTrang", BO_acc.totalPage());
		request.setAttribute("TongSoTaiKhoan", (new BO_Account(page, nrow)).getTotalAccount());
		request.setAttribute("TongSoAccDangHoatDong", (new BO_Account(page, nrow)).getTotalStatusAccount(Const.ACCOUNT_ENABLE));
		request.setAttribute("TongSoAccBiKhoa", (new BO_Account(page, nrow)).getTotalStatusAccount(Const.ACCONT_DISABLE));
		request.setAttribute("TrangHienTai", page);
		request.setAttribute("STTstart", (new BO_Account(page, nrow)).startRow());
		request.setAttribute("page", page);
		request.setAttribute("nrow", page);
		request.setAttribute("keywordHienTai", keyword);

		switch (nrow) {
		case "10":
			request.setAttribute("select10", "selected='selected'");
			break;
		case "20":
			request.setAttribute("select20", "selected='selected'");
			break;
		default:
			request.setAttribute("select50", "selected='selected'");
			break;
		}

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-user.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		(new BO_Account()).on_off_account(email);
		doGet(request, response);

	}

}
