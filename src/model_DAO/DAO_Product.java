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

	public static String name(int index) {
		ArrayList<String> name = new ArrayList<String>();
		name.add("Iphone 8");
		name.add("Samsung galaxy S9");
		name.add("Nokia Limilted 8");
		name.add("Xiaomi mi max 3");
		name.add("One plus 8");
		name.add("Samsung galaxy note");
		name.add("Iphone 6S");
		name.add("Iphone 7S");
		name.add("Iphone 8S");
		name.add("Iphone 9S");
		name.add("Iphone 10S");
		name.add("Iphone 11S");
		name.add("Iphone 12S");
		name.add("Iphone 13S");
		return name.get(index);
	}

	public static String thumbnail(int index) {
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
		i.add("https://cdn.tgdd.vn/Products/Images/42/228738/iphone-12-pro-256gb-190120-020118-200x200.jpg");
		i.add("https://cdn.tgdd.vn/Products/Images/42/228738/iphone-12-pro-256gb-190120-020118-200x200.jpg");

		return i.get(index);
	}

	public ArrayList<Product> getList(int start, int end) {

		fakeDatabase.add(new Product("MSB_0" + 1, thumbnail(1), name(1), 9000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 2, thumbnail(2), name(2), 8000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 3, thumbnail(3), name(3), 7000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 4, thumbnail(4), name(4), 6000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 5, thumbnail(5), name(5), 5000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 6, thumbnail(6), name(6), 4000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 7, thumbnail(7), name(7), 3000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 8, thumbnail(8), name(8), 2000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 9, thumbnail(9), name(9), 1000000, 2000000));
		fakeDatabase.add(new Product("MSB_0" + 10, thumbnail(10), name(10), 9000000, 2000000));

		return fakeDatabase;
	}

	public Product getProduct(String id) {
		for (Product p : getList(1, 10)) {
			if (p.getId().equals(id)) {
				return p;
			}
		}
		return null;
	}

}

// _   _                               _       _                     _                     
//| | | |                             (_)     | |                   | |                    
//| |_| |__   __ _ _   _   _ __   ___  _    __| |_   _ _ __   __ _  | |__   __ _ _ __ ___  
//| __| '_ \ / _` | | | | | '_ \ / _ \| |  / _` | | | | '_ \ / _` | | '_ \ / _` | '_ ` _ \ 
//| |_| | | | (_| | |_| | | | | | (_) | | | (_| | |_| | | | | (_| | | | | | (_| | | | | | |
// \__|_| |_|\__,_|\__, | |_| |_|\___/|_|  \__,_|\__,_|_| |_|\__, | |_| |_|\__,_|_| |_| |_|
//                 __/ |                                     __/ |                        
//                |___/                                     |___/   

//
//     _                     _   _                       _       _   _               _                     
//    | |                   | | | |                     | |     (_) | |             | |                    
//  __| |_   _ _ __   __ _  | |_| |__   __ _ _   _    __| | ___  _  | |_ ___ _ __   | |__   __ _ _ __ ___  
// / _` | | | | '_ \ / _` | | __| '_ \ / _` | | | |  / _` |/ _ \| | | __/ _ \ '_ \  | '_ \ / _` | '_ ` _ \ 
//| (_| | |_| | | | | (_| | | |_| | | | (_| | |_| | | (_| | (_) | | | ||  __/ | | | | | | | (_| | | | | | |
// \__,_|\__,_|_| |_|\__, |  \__|_| |_|\__,_|\__, |  \__,_|\___/|_|  \__\___|_| |_| |_| |_|\__,_|_| |_| |_|
//               __/ |                   __/ |                                                        
//              |___/                   |___/                                         
