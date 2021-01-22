package controller_system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionIdListener;

import model_DAO.DAO_Order;
import model_beans.Account;
import model_utility.Const;

@WebServlet(urlPatterns = "/member/receipted")
public class Recepted extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO_Order dao = DAO_Order.getDAO_Order();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		String customerID = ((Account) session.getAttribute(Const.CUSTOMER_LOGINED)).getId();
		
		request.setAttribute("LIST_ORDER", dao.getListCustomerOrder(customerID, 1, 999) );
		
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/profile-list-order.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
