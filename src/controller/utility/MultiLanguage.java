package controller.utility;

import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

public class MultiLanguage implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		session.setAttribute("LANGUAGE", "VI");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
