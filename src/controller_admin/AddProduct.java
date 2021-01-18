package controller_admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model_DAO.DAO_Attribute;
import model_DAO.DAO_Branch;
import model_DAO.DAO_Color;
import model_beans.AttributeClass;
import model_beans.AttributeManager;
import model_beans.Branch;
import model_beans.Color_product;
import sun.tools.attach.AttachProviderImpl;

@WebServlet(urlPatterns = "/admin/product-add")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Color_product> listColor = DAO_Color.getInstance().getAllColor();
		ArrayList<Branch> listBranch = DAO_Branch.getDAO_Branch().getAllBranch();
		Map<AttributeClass, ArrayList<AttributeManager>> map = DAO_Attribute.getInstance().getAllAttributesClasses();
		Map<AttributeClass, ArrayList<ArrayList<AttributeManager>>> arrMap = new LinkedHashMap<AttributeClass, ArrayList<ArrayList<AttributeManager>>>();
		for (AttributeClass a : map.keySet()) {
			ArrayList<ArrayList<AttributeManager>> arrAtt = new ArrayList<ArrayList<AttributeManager>>();
			arrAtt.add(map.get(a));
			arrMap.put(a, arrAtt);
		}
		HttpSession session = request.getSession();
		if (session.getAttribute("arrMap") == null) {
			session.setAttribute("arrMap", arrMap);
		}

		request.setAttribute("listColor", listColor);
		request.setAttribute("listBranch", listBranch);
		request.setAttribute("listAttribute", map);
//		int count = 1;
//		for (AttributeClass a : map.keySet()) {
//			request.setAttribute("att" + count, map.get(a));
//			count++;
//		}

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-product-add.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
