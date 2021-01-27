package controller_system;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_beans.Account;
import model_beans.Cart;
import model_utility.Const;
import model_utility.SendMail;

@WebServlet(urlPatterns = "/ordersuccessfull")
public class Bill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("CART");

		String codeOder = (String) request.getAttribute("CODE_ODER");

		Account acc = (Account) session.getAttribute(Const.CUSTOMER_LOGINED);
		String content = "Đơn hàng " + codeOder
				+ " đã được đặt thành công, vui lòng try cập https://mobileshop.tk/check-receipt để kiểm tra đơn hàng";
		SendMail.sendOrderSuccessful(acc.getEmail(), content);

		System.out.println("mail " + acc.getEmail());
		System.out.println(" code " + codeOder);

		request.setAttribute("TOTAL_MONEY", Controller_Cart.getTotalMoney(cart));
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/system/bill.jsp");
		dispatcher.forward(request, response);
	}

}
