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

@WebServlet(urlPatterns = "/admin/account")
public class AccountManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		String nrow = request.getParameter("nrow");
		String blockAcc = request.getParameter("blockaccount");
		if (page == null) {
			page = "1";
		}

		if (nrow == null) {
			nrow = "10";
		}

		BO_Account bo = new BO_Account(page, nrow);
		String keyword = request.getParameter("keyword");
		List<Account> listAcc = null;
		if (keyword != null) {
			int start = (Integer.parseInt(nrow) * Integer.parseInt(page)) - (Integer.parseInt(nrow) + 1);
			int end = Integer.parseInt(nrow) * Integer.parseInt(page);
			listAcc = bo.search(keyword, start, end);
			request.setAttribute("TongSoTrang", bo.totalPageSearch(keyword));
			request.setAttribute("totalSearch", bo.totalSearch(keyword));
		} else if (blockAcc != null) {
			listAcc = (new BO_Account()).getListDisableAccount();
			request.setAttribute("TongSoTrang", "1");
			request.setAttribute("displayButtonXemTaiKhoanBiKhoa", true);
		} else {
			listAcc = bo.get();
			request.setAttribute("TongSoTrang", bo.totalPage());
		}

		request.setAttribute("listAcc", listAcc);

		request.setAttribute("TongSoTaiKhoan", bo.getTotalAccount());
		request.setAttribute("TongSoAccDangHoatDong", bo.getTotalStatusAccount(Const.ACCOUNT_ENABLE));
		request.setAttribute("TongSoAccBiKhoa", bo.getTotalStatusAccount(Const.ACCONT_DISABLE));
		request.setAttribute("TrangHienTai", page);
		request.setAttribute("STTstart", bo.startRow());
		request.setAttribute("page", page);
		request.setAttribute("nrow", page);
		request.setAttribute("keywordHienTai", keyword);

		switch (nrow)

		{
		case "10":
			request.setAttribute("select10", "selected");
			break;
		case "20":
			request.setAttribute("select20", "selected");
			break;
		default:
			request.setAttribute("select50", "selected");
			break;
		}

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/views/admin/accountManagement.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		(new BO_Account()).on_off_account(email);
		doGet(request, response);

	}

}
