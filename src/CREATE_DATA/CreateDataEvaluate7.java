package CREATE_DATA;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import BeanProduct.Product;
import model_ConnectDB.ExecuteStatementUtility;
import model_DAO.Dao_Product2;

public class CreateDataEvaluate7 extends ExecuteStatementUtility{
	public static int rdINT(int start, int end) {
		return (int) ((Math.random() * (end - start)) + start);
	}

	public static int rdItem(int arrSize) {
		return (int) ((Math.random() * arrSize));
	}

	public static String idProduct() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("sp" + i);
		}
		return id.get(rdItem(id.size()));
	}
	public static String idUser() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("sp" + i);
		}
		return id.get(rdItem(id.size()));
	}
	public static String dateUp() {
		ArrayList<String> date = new ArrayList<String>();
		date.add("12/12/2018");
		date.add("12/2/2010");
		date.add("31/2/2018");

		return date.get(rdItem(date.size()));
	}
	
	public static String mucDanhgia() {
		ArrayList<String> date = new ArrayList<String>();
		Random rd = new Random();
		for (int i = 1; i <=5; i++) {
			date.add(i+"");
		}
		return date.get(rdItem(date.size()));
	}
	public static String Content() {
		ArrayList<String> date = new ArrayList<String>();
		Random rd = new Random();
		for (int i = 0; i < 45; i++) {
			date.add("content:" + i);
		}
		return date.get(rdItem(date.size()));
	}
	
	public void add() {
		try {
			String query = "INSERT INTO " + "DANHGIA" + " VALUES(?,?,?,?,?)";
			String[] parameters = { //
					idProduct(),
					idUser(),
					mucDanhgia(),
					Content(),
					dateUp(),
					

			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		CreateDataEvaluate7 creta= new CreateDataEvaluate7();

		for (int i = 0; i < 45; i++) {
			creta.add();
		}
	}
	
}
