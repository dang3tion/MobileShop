package model_utility;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;

public class SendMail {

//	public static void send(String mail, int OTPcode) {
//
//		try {
//			Email email = new SimpleEmail();
//			email.setCharset("UTF-8");
//
//			// Cấu hình thông tin Email Server
//			email.setHostName("smtp.googlemail.com");
//			email.setSmtpPort(465);
//			email.setAuthenticator(new DefaultAuthenticator(Config.OWNER_EMAIL, Config.MAIL_PASSWORD));
//
//			// Với gmail cái này là bắt buộc.
//			email.setSSLOnConnect(true);
//
//			// Người gửi
//			email.setFrom(Config.OWNER_EMAIL);
//
//			// Tiêu đề
//			email.setSubject("Xác thực tài khoản mobile Shop");
//
//			// Nội dung email
//			email.setMsg("Mã OTP của bạn là : " + OTPcode +
//
//					"  .Vui lòng không cung cấp mã này cho người khác.");
//
//			// Người nhận
//			email.addTo(mail);
//			email.send();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	public static void send(String CustomerMail, int OTPcode) {

		// Mail chủ Shop
		String from = "lazadamimax3@gmail.com";

		// Assuming you are sending email from through gmails smtp
		String host = "smtp.gmail.com";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		// Get the Session object.// and pass username and password
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(Config.OWNER_EMAIL, Config.MAIL_PASSWORD);

			}

		});

//		// Used to debug SMTP issues
//		session.setDebug(true);

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(CustomerMail));

			// Tiêu Đề
			message.setSubject("Xác thực tài khoản mobile Shop","UTF-8");

			// Nội dung
			message.setText("Mã OTP của bạn là : " + OTPcode + "  .Mã có hiệu lực trong 2 phút.", "UTF-8");
			// Send message
			Transport.send(message);
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}	
	
}

//	
