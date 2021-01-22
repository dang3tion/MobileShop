package controller_admin;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_DAO.DAO_HOME_ADMIN;

@WebServlet(urlPatterns = "/employee/index")
public class AdminIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO_HOME_ADMIN dao = new DAO_HOME_ADMIN();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//số page
		int page = 0;
		
		request.setAttribute("total", dao.totalMoney());
		request.setAttribute("avg", dao.avgTotalMoney());
		request.setAttribute("sale", dao.productSaled());
		request.setAttribute("access", dao.sumAccess());
		
		//chỉnh sửa page chỗ này
		request.setAttribute("list", dao.listSta(1, 200));
		
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/employee/admin-index.jsp");

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
