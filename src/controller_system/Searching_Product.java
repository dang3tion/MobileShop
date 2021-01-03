package controller_system;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/searchingProduct")
public class Searching_Product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String branchName = request.getParameter("thuonghieu");
		String range = request.getParameter("khoanggia");
		Integer startRange = null;
		Integer endRange = null;
		String aspect = request.getParameter("tinhtrang");

		if (range != null) {
			if (range.contains("tren")) {
				startRange = 15;
			} else if (range.contains("duoi")) {
				endRange = 1;
			} else {
				startRange = getListNumber(range)[0];
				endRange = getListNumber(range)[1];
			}
		}

		System.out.println("Branch ===>" + branchName);
		System.out.println("first  ===>" + startRange);
		System.out.println("last ===>" + endRange);
		System.out.println("moi/cu ====>" + aspect);
		System.out.println("________________________________________");
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/XXXXXXXXXXXXXXXX.jsp");
		dispatcher.forward(request, response);

	}

	private int[] getListNumber(String priceRange) {
		int[] arr = new int[2];
		int i = 0;
		Pattern p = Pattern.compile("\\d+");
		Matcher m = p.matcher(priceRange);
		while (m.find()) {
			arr[i] = Integer.parseInt(m.group());
			i++;
		}
		return arr;
	}
}
