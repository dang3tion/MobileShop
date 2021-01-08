package CREATE_DATA;

import java.sql.ResultSet;
import java.util.ArrayList;

import BeanProduct.Config;
import BeanProduct.Detail_Config;
import model_ConnectDB.ExecuteCRUD;

public class CreateDataDetailConfig3 extends ExecuteCRUD{
	
	public static int rdINT(int start, int end) {
		return (int) ((Math.random() * (end - start)) + start);
	}

	public static int rdItem(int arrSize) {
		return (int) ((Math.random() * arrSize));
	}

	public static String idConfig() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("ch" + i);
		}
		return id.get(rdItem(id.size()));
	}

	public static String propertie() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("ct" + i);
		}
		return id.get(rdItem(id.size()));
	}
	
	public static Detail_Config detailConfig() {
		return new Detail_Config(idConfig(),propertie());
	}
	
	private final String PRODUCT = "CH_CTTT";
	// tên các cột của bảng ACCOUNT
	private final String MACH = "MACH";
	private final String MACT = "MACT";

	
	public  void add(Detail_Config config) {
		try {
			String query = "INSERT INTO " + PRODUCT + " VALUES(?,?)";
			String[] parameters = { //
					config.getIdConfig(),//
					config.getIdPropertie(),//
			
					
			};

			try (ResultSet rs = super.ExecuteQuery(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		CreateDataDetailConfig3 detail = new CreateDataDetailConfig3();
		for (int i = 0; i < 45; i++) {
			detail.add(detailConfig());
		}
	}
	

}
