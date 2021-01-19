package controller_utility;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CKFinderUpload")
public class CKFinderUpload extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String URLImage1 = request.getParameter("URLImage1");
		String URLImage2 = request.getParameter("URLImage2");
		String URLImage3 = request.getParameter("URLImage3");
		String URLImage4 = request.getParameter("URLImage4");
		
		
		System.out.println(URLImage1);
		System.out.println(URLImage2);
		System.out.println(URLImage3);
		
		
		
		request.setAttribute("URLImage1","http://localhost:8080"+URLImage1);
		request.setAttribute("URLImage2","http://localhost:8080"+URLImage2);
		request.setAttribute("URLImage3","http://localhost:8080"+URLImage3);
		request.setAttribute("URLImage4","http://localhost:8080"+URLImage4);
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/CKFinder.jsp");
		dispatcher.forward(request, response);
	}

}
