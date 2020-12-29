package controller_admin;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Branch;

@WebServlet(urlPatterns = "/admin/branch")
public class Branch extends HttpServlet {
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
		String search = request.getParameter("searchContact");
		String id = request.getParameter("id");
		if (search != null) {
			System.out.println(search);
			System.out.println("sdafsdf");
			//hàm search
			
		}
		if (id != null) {
			request.setAttribute("messageblock", id);
			request.setAttribute("colorblock", "background-color: green");
		}
		
		doGet(request, response);
	}

}
