package model.utility;

public class Config {

//	   _____    ____    _           ____            _   _                
//	   / ____|  / __ \  | |         / __ \          | | (_)               
//	  | (___   | |  | | | |        | |  | |  _ __   | |  _   _ __     ___ 
//	   \___ \  | |  | | | |        | |  | | | '_ \  | | | | | '_ \   / _ \
//	   ____) | | |__| | | |____    | |__| | | | | | | | | | | | | | |  __/
//	  |_____/   \___\_\ |______|    \____/  |_| |_| |_| |_| |_| |_|  \___|
//	___________________________________________________________________________________________  ______________________________________________________ ______________________________________________________ ___________________________________________________________________________________________________________________________________________________                                                                  
//	public static final String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	public static final String SERVER_NAME = "jdbc:sqlserver://mobileshop.civgzrydcxzm.ap-southeast-1.rds.amazonaws.com:1433";
//	public static final String DATABASE_NAME = "MOBILESHOP";
//	public static final String USERNAME_DB = "bao";
//	public static final String PASSWORD_DB = "12345678";
//	____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
//	#####public static final String STRING_CONNECTION = "jdbc:sqlserver://localhost:1433;DATABASE_NAME=Demo;user=sa;password=sa";

	// for Send Mail
	// OTP_________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
	public static final String OWNER_EMAIL = "lazadamimax3@gmail.com";
	public static final String MAIL_PASSWORD = "Admin123@#";
//	___________________________________________________________________________________________________________________________________________________________________________________________________
	// Login bằng google
	private static final String LINK_WEB = "localhost:8080/MobileShop";

	public static final String GOOGLE_CLIENT_ID = "513013153147-13nhsbm8a1gtp4i1vq2l9j228f1q8691.apps.googleusercontent.com";
	public static final String GOOGLE_CLIENT_SECRET = "TxX1vWUkUE-YCZRCqBcqhqiG";
	public static final String GOOGLE_REDIRECT_URI = "http://" + LINK_WEB + "/login-google";
	public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	public static final String GOOGLE_GRANT_TYPE = "authorization_code";

	public static final String GOOGLE_URL_HREF_JSP = "https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri="
			+ GOOGLE_REDIRECT_URI + "&response_type=code&client_id=" + GOOGLE_CLIENT_ID + "&approval_prompt=force";
//	__________________________________________________________________________________________________________________________________________________________________________________________________________________
//	  _____    ____    _              _                          _   _                     _   
//	  / ____|  / __ \  | |            | |                        | | | |                   | |  
//	 | (___   | |  | | | |            | |   ___     ___    __ _  | | | |__     ___    ___  | |_ 
//	  \___ \  | |  | | | |            | |  / _ \   / __|  / _` | | | | '_ \   / _ \  / __| | __|
//	  ____) | | |__| | | |____        | | | (_) | | (__  | (_| | | | | | | | | (_) | \__ \ | |_ 
//	 |_____/   \___\_\ |______|       |_|  \___/   \___|  \__,_| |_| |_| |_|  \___/  |___/  \__|
//	___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
	public static final String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	public static final String SERVER_NAME = "jdbc:sqlserver://localhost:1433";
	public static final String DATABASE_NAME = "Demo2";
	public static final String USERNAME_DB = "sa";
	public static final String PASSWORD_DB = "sa";
//	_______________________________________________________________________________________________________________________________________________________________________
}
