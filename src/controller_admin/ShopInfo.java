package controller_admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_ShopInfo;

@WebServlet("/admin/information")
public class ShopInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-informatioin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String policy = request.getParameter("policy");
		String realAddress = request.getParameter("realAddress");
		String youtubeURL = request.getParameter("youtubeURL");
		String facebookURL = request.getParameter("facebookURL");

		
		model_beans.ShopInfo newInfo = new model_beans.ShopInfo(name, policy, facebookURL , youtubeURL , realAddress );

		DAO_ShopInfo.getDaoShopInfo().setInfo(newInfo);

		HttpSession session = request.getSession();
		session.setAttribute("SHOPINFO", newInfo);

		doGet(request, response);
	}

}
