package controller_admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_DAO.DAO_Attribute;
import model_DAO.DAO_Branch;
import model_DAO.DAO_Color;
import model_beans.AttributeClass;
import model_beans.AttributeManager;
import model_beans.Branch;
import model_beans.Color_product;

@WebServlet(urlPatterns = "/admin/product-add")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Color_product> listColor = DAO_Color.getInstance().getAllColor();
		ArrayList<Branch> listBranch = DAO_Branch.getDAO_Branch().getAllBranch();
		Map<AttributeClass, ArrayList<AttributeManager>> map = DAO_Attribute.getInstance().getAllAttributesClasses();
		request.setAttribute("listColor", listColor);
		request.setAttribute("listBranch", listBranch);
		request.setAttribute("listAttribute", map);
		int count = 1;
		for (AttributeClass a : map.keySet()) {
			request.setAttribute("att" + count, map.get(a));
			count++;
		}
		ArrayList<String> arr = new ArrayList<String>();
		arr.add("VANA");
		arr.add("VANB");

		request.setAttribute("arr", arr);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-product-add.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
