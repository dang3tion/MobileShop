package controller_utility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class GetAddress {
	public static HashMap<String, String> getListProvince() {
		HashMap<String, String> provinces = new HashMap<String, String>();
		try {

			URL url = new URL("https://thongtindoanhnghiep.co/api/city/");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String jsonString;
			jsonString = br.readLine();

			Gson gson = new Gson();
			JsonObject p = gson.fromJson(jsonString, JsonObject.class);

			JsonArray arr = p.get("LtsItem").getAsJsonArray();

			for (JsonElement jsonElement : arr) {

				String provinceID = ((JsonObject) jsonElement).get("Title").toString();
				String provinceName = ((JsonObject) jsonElement).get("ID").toString();

				provinces.put(provinceID, provinceName);
			}
			conn.disconnect();

		} catch (MalformedURLException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		}
		return provinces;
	}

	public static HashMap<String, String> getListDistrict(String provinceID) {
		HashMap<String, String> districts = new HashMap<String, String>();
		try {

			URL url = new URL("https://thongtindoanhnghiep.co/api/city/" + provinceID + "/district");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String jsonString;
			jsonString = br.readLine();

			Gson g = new Gson();
			JsonArray p = g.fromJson(jsonString, JsonArray.class);

			for (JsonElement jsonElement : p) {

				String districtID = ((JsonObject) jsonElement).get("Title").toString();
				String districtName = ((JsonObject) jsonElement).get("ID").toString();

				districts.put(districtID, districtName);
			}
			conn.disconnect();

		} catch (MalformedURLException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		}
		return districts;
	}
	public static HashMap<String, String> getListWard(String districtID) {
		HashMap<String, String> districts = new HashMap<String, String>();
		try {
			URL url = new URL("https://thongtindoanhnghiep.co/api/district/"+districtID+"/ward");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}
			
			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			
			String jsonString;
			jsonString = br.readLine();
			
			Gson g = new Gson();
			JsonArray p = g.fromJson(jsonString, JsonArray.class);
			
			for (JsonElement jsonElement : p) {
				
				String wardID = ((JsonObject) jsonElement).get("Title").toString();
				String wardName = ((JsonObject) jsonElement).get("ID").toString();
				
				districts.put(wardID, wardName);
			}
			conn.disconnect();
			
		} catch (MalformedURLException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		return districts;
	}

	public static void main(String[] args) {
		System.out.println(getListProvince());
		System.out.println(getListDistrict("13"));
		System.out.println(getListWard("202"));
	}
}
