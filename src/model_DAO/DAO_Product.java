package model_DAO;

import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Product;

public class DAO_Product extends ExecuteStatementUtility {

	private ArrayList<Product> fakeDatabase = new ArrayList<Product>();

	public DAO_Product() {

	}

	public static int rdItem(int arrSize) {
		return (int) ((Math.random() * arrSize));
	}

	public static String name() {
		ArrayList<String> name = new ArrayList<String>();
		name.add("Iphone 8");
		name.add("Samsung galaxy S9");
		name.add("Nokia Limilted 8");
		name.add("Xiaomi mi max 3");
		name.add("One plus 8");
		name.add("Samsung galaxy note");
		name.add("Iphone 6S");
		return name.get(rdItem(name.size()));
	}

	public static String thumbnail() {
		ArrayList<String> i = new ArrayList<String>();
		i.add("https://cdn.tgdd.vn/Products/Images/42/229056/oppo-a93-trang-14-600x600.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/228453/vivo-v20-600-xanh-hong-2-600x600.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/227681/realme-c17-green-600x600-200x200.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/222596/oppo-reno4-xanh-600x600.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-new-600x600-600x600.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/230867/samsunggalaxynote20ultratrangnew-600x600-600x600.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/217936/samsung-galaxy-s20-plus-xanh-600x600-400x400.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/213031/TimerThumb/iphone-12-blue-600x600-thumb-hen-gio.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/213032/iphone-12-pro-260020-110014-200x200.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/228738/iphone-12-pro-256gb-190120-020118-200x200.jpg");

		return i.get(rdItem(i.size()));
	}

	public static int price() {
		ArrayList<Integer> i = new ArrayList<Integer>();
		i.add(15100000);
		i.add(16200000);
		i.add(8400000);
		i.add(7500000);
		i.add(9400000);
		i.add(34600000);
		i.add(23600000);
		i.add(4400000);

		return i.get(rdItem(i.size()));
	}

	public ArrayList<Product> getFakeDatabase() {

		for (int i = 0; i < 50; i++) {
			fakeDatabase.add(new Product("MSB_0"+i, thumbnail(), name(), price(), price() + 2000000));

		}

		return fakeDatabase;
	}

	public Product search(String id) {
		for (Product p : getFakeDatabase()) {
			if (p.getId().equals(id)) {
				return p;
			}
		}
		return null;
	}

	
}
