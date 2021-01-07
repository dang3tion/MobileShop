package CREATE_DATA;

import java.sql.ResultSet;
import java.util.ArrayList;

import BeanProduct.Detail_Config;
import BeanProduct.Detail_Propertie;
import BeanProduct.Product;
import model_ConnectDB.ExecuteCRUD;

public class CreateDataDetailPropertie4 extends ExecuteCRUD{
	public static int rdINT(int start, int end) {
		return (int) ((Math.random() * (end - start)) + start);
	}

	public static int rdItem(int arrSize) {
		return (int) ((Math.random() * arrSize));
	}

	public static String idPropertie() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("ct" + i);
		}
		return id.get(rdItem(id.size()));
	}
	public static String value() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("value" + i);
		}
		return id.get(rdItem(id.size()));
	}
	
	public static String content() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("Content " + i);
		}
		return id.get(rdItem(id.size()));
	}
	
	public static String idTT() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("TT" + i);
		}
		return id.get(rdItem(id.size()));
	}
	
	public static Detail_Propertie detail_Propertie() {
		return new Detail_Propertie(idPropertie(), value(), content(), idTT());
	}
	
	private final String PRODUCT = "CHITIET_THUOCTINH";
	// tên các cột của bảng ACCOUNT
	private final String MACT = "MACT";
	private final String GIATRI = "GIATRI";
	private final String NOIDUNG = "NOIDUNG";
	private final String MATT = "MATT";
	
	
	public void add(Detail_Propertie detail) {
		try {
			String query = "INSERT INTO " + PRODUCT + " VALUES(?,?,?,?)";
			String[] parameters = { //
					detail.getIdDetail(), //
					detail.getValue(), //
					detail.getContent(), //
					detail.getIdTT(), //
					
					
			};

			try (ResultSet rs = super.ExecuteQuery(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
//	public static void main(String[] args) {
		
//	}
	
	
	
}
