package model.utility;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;

public class SendMail {

	public static void send(String mail, int OTPcode) {

		try {
			Email email = new SimpleEmail();
			email.setCharset("utf-8");

			// Cấu hình thông tin Email Server
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator(Config.OWNER_EMAIL, Config.MAIL_PASSWORD));

			// Với gmail cái này là bắt buộc.
			email.setSSLOnConnect(true);

			// Người gửi
			email.setFrom(Config.OWNER_EMAIL);

			// Tiêu đề
			email.setSubject("Xác thực tài khoản mobile Shop");

			// Nội dung email
			email.setMsg("Mã OTP của bạn là : " + OTPcode +

					"  .Vui lòng không cung cấp mã này cho người khác.");

			// Người nhận
			email.addTo(mail);
			email.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

//	
