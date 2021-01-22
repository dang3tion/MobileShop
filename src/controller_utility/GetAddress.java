package controller_utility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.LinkedHashMap;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class GetAddress implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static HashMap<String, String> getListProvince() {
		LinkedHashMap<String, String> provinces = new LinkedHashMap<String, String>();
		Gson gson = new Gson();
		String jsonString = getJSONString("https://thongtindoanhnghiep.co/api/city/");
		JsonObject ls = gson.fromJson(jsonString, JsonObject.class);
		JsonArray arr = ls.get("LtsItem").getAsJsonArray();
		for (JsonElement jsonElement : arr) {
			String provinceID = ((JsonObject) jsonElement).get("ID").toString();
			String provinceName = ((JsonObject) jsonElement).get("Title").toString();
			provinceName = provinceName.substring(1, provinceName.length() - 1);

			provinces.put(provinceID, provinceName);
		}
		return provinces;
	}

	public static HashMap<String, String> getListDistrict(String provinceID) {
		LinkedHashMap<String, String> districts = new LinkedHashMap<String, String>();
		Gson gson = new Gson();
		String jsonString = getJSONString("https://thongtindoanhnghiep.co/api/city/" + provinceID + "/district");
		JsonArray ls = gson.fromJson(jsonString, JsonArray.class);
		for (JsonElement jsonElement : ls) {
			String districtID = ((JsonObject) jsonElement).get("ID").toString();
			String districtName = ((JsonObject) jsonElement).get("Title").toString();
			districtName = districtName.substring(1, districtName.length() - 1);
			districts.put(districtID, districtName);
		}
		return districts;
	}

	public static HashMap<String, String> getListWard(String districtID) {
		LinkedHashMap<String, String> districts = new LinkedHashMap<String, String>();
		Gson gson = new Gson();
		String jsonString = getJSONString("https://thongtindoanhnghiep.co/api/district/" + districtID + "/ward");
		JsonArray ls = gson.fromJson(jsonString, JsonArray.class);
		for (JsonElement jsonElement : ls) {
			String wardID = ((JsonObject) jsonElement).get("ID").toString();
			String wardName = ((JsonObject) jsonElement).get("Title").toString();
			wardName = wardName.substring(1, wardName.length() - 1);
			districts.put(wardID, wardName);
		}
		return districts;
	}

	private static String getJSONString(String URL) {
		String JSONString = null;
		try {
			URL url = new URL(URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			JSONString = br.readLine();

			conn.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return JSONString;
	}

	public static void main(String[] args) {
		System.out.println(getListProvince());
		System.out.println(getListDistrict("13"));
		System.out.println(getListWard("202"));
	}
}
