package CREATE_DATA;

import java.sql.ResultSet;
import java.util.ArrayList;

import BeanProduct.Config;
import BeanProduct.Price;
import model_ConnectDB.ExecuteStatementUtility;

public class CreateDataConfig2 extends ExecuteStatementUtility{
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
	
	public static int numberConfig() {
		ArrayList<Integer> price = new ArrayList<Integer>();
		price.add(5);
		price.add(5);
		price.add(4);
		price.add(50);

		return price.get(rdItem(price.size()));
	}
	public static Config config() {
		return new Config(idConfig(), numberConfig());
	}
	
	private final String PRODUCT = "CAUHINH";
	// tên các cột của bảng ACCOUNT
	private final String MACH = "MACH";
	private final String SLTT = "SLTT";

	
	public  void add(Config config) {
		try {
			String query = "INSERT INTO " + PRODUCT + " VALUES(?,?)";
			String[] parameters = { //
					config.getId(),//
					config.getNumberConfig()+"",//
			
					
			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		CreateDataConfig2 con = new CreateDataConfig2();
		for (int i = 0; i < 45; i++) {
			con.add(config());
		}
	}
	
}
