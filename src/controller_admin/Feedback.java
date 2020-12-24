package controller_admin;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model_BO_service.BO_Contact;
import model_utility.SendMail;

@WebServlet(urlPatterns = "/admin/feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BO_Contact bo = new BO_Contact();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("listContact", bo.listContact(1, 1000));
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/VIEW/jsp/jsp-page/admin/admin-feedback.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email  = request.getParameter("emailFeedback");
		String content = request.getParameter("content");
		
		SendMail.sendFeekBack(email, content);
		
		doGet(request, response);
		
	}

}
