package model.utility;

public class Config {
	// for SQL Server
	public static final String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	public static final String SERVER_NAME = "jdbc:sqlserver://localhost:1433";
	public static final String DATABASE_NAME = "Demo2";
	public static final String USERNAME_DB = "sa";
	public static final String PASSWORD_DB = "sa";

	// for Send Mail
	public static final String OWNER_EMAIL = "lazadamimax3@gmail.com";
	public static final String MAIL_PASSWORD = "Admin123@#";

	// Login bằng google
	public static final String GOOGLE_CLIENT_ID = "513013153147-13nhsbm8a1gtp4i1vq2l9j228f1q8691.apps.googleusercontent.com";
	public static final String GOOGLE_CLIENT_SECRET = "TxX1vWUkUE-YCZRCqBcqhqiG";
	public static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/MobileShop/login-google";
	public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	public static final String GOOGLE_GRANT_TYPE = "authorization_code";

	public static final String GOOGLE_URL_HREF_JSP = "https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri="
			+ GOOGLE_REDIRECT_URI + "&response_type=code&client_id=" + GOOGLE_CLIENT_ID + "&approval_prompt=force";

}
