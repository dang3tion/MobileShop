package model_utility;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

public class VerifyCaptcha {

	public static final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

	public static boolean verify(String gRecaptchaResponse) {
		if (gRecaptchaResponse == null || gRecaptchaResponse.length() == 0) {
			return false;
		}

		try {
			URL verifyUrl = new URL(SITE_VERIFY_URL);

			// Má»Ÿ má»™t káº¿t ná»‘i (Connection) tá»›i URL trÃªn.
			HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();

			// ThÃªm cÃ¡c thÃ´ng tin Header vÃ o Request chuáº©n bá»‹ gá»­i tá»›i server.
			conn.setRequestMethod("POST");

			// Dá»¯ liá»‡u sáº½ gá»­i tá»›i Server.
			String postParams = "secret=" + Config.SECRET_KEY //
					+ "&response=" + gRecaptchaResponse;

			// Send Request
			conn.setDoOutput(true);

			// Láº¥y Output Stream (Luá»“ng Ä‘áº§u ra) cá»§a káº¿t ná»‘i tá»›i Server.
			// Ghi dá»¯ liá»‡u vÃ o Output Stream, cÃ³ nghÄ©a lÃ  gá»­i thÃ´ng tin Ä‘áº¿n Server.
			OutputStream outStream = conn.getOutputStream();
			outStream.write(postParams.getBytes());

			outStream.flush();
			outStream.close();

			// MÃ£ tráº£ lá»�i Ä‘Æ°á»£c tráº£ vá»� tá»« Server.
			int responseCode = conn.getResponseCode();

			// Láº¥y Input Stream (Luá»“ng Ä‘áº§u vÃ o) cá»§a Connection
			// Ä‘á»ƒ Ä‘á»�c dá»¯ liá»‡u gá»­i Ä‘áº¿n tá»« Server.
			InputStream is = conn.getInputStream();

			JsonReader jsonReader = Json.createReader(is);
			JsonObject jsonObject = jsonReader.readObject();
			jsonReader.close();

			boolean success = jsonObject.getBoolean("success");
			return success;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}