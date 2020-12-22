package CREATE_DATA;

import java.sql.ResultSet;
import java.util.ArrayList;

import BeanProduct.Detail_Propertie;
import BeanProduct.Propertie;
import model_ConnectDB.ExecuteStatementUtility;

public class CreateDataPropertie5 extends ExecuteStatementUtility{
	public static int rdINT(int start, int end) {
		return (int) ((Math.random() * (end - start)) + start);
	}

	public static int rdItem(int arrSize) {
		return (int) ((Math.random() * arrSize));
	}

	public static String idPropertie() {
		ArrayList<String> id = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			id.add("TT" + i);
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
			id.add("Nội dung " + i);
		}
		return id.get(rdItem(id.size()));
	}
	
	public static Propertie proper() {
		return new Propertie(idPropertie(), value(), content());
	}
	
	private final String PRODUCT = "THUOCTINH";
	// tên các cột của bảng ACCOUNT
	private final String MATT = "MATT";
	private final String LOAI_GIATRI = "LOAI_GIATRI";
	private final String NOIDUNG = "NOIDUNG";
	
	
	
	public void add(Propertie proper) {
		try {
			String query = "INSERT INTO " + PRODUCT + " VALUES(?,?,?)";
			String[] parameters = { //
					proper.getId(),
					proper.getValue(),
					proper.getContent()
					
					
			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		CreateDataPropertie5 pro = new CreateDataPropertie5();
		for (int i = 0; i < 45; i++) {
			pro.add(proper());
		}
	}

	
}
