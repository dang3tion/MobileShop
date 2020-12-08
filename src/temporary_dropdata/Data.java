package temporary_dropdata;

import java.util.HashMap;
import java.util.Map;

public class Data {
	public static Map<Long, Product> data = new HashMap<Long, Product>();
	static {
		data.put((long) 1, new Product(1, "iPhone 12 64 GB", "22.990.000", "24.990.000", "1.jpg"));
		data.put((long) 2, new Product(2, "Samsung Galaxy Note 10 Lite", "10.990.000", "11.490.000", "ss.png"));
		data.put((long) 3, new Product(3, "Samsung Galaxy S20+", "15.990.000", "23.990.000", "samsung.png"));
		data.put((long) 4, new Product(4, "iPhone 11 64 GB", "17.990.000", "19.990.000", "3.jpg"));

	}
	public static Map<Long, Product> data2 = new HashMap<Long, Product>();
	static {
		data2.put((long) 5, new Product(5, "OPPO A92", "6.190.000", "6.490.000", "oppo.png"));
		data2.put((long) 6, new Product(6, "Vsmart Joy 3 2GB-32GB", "2.290.000", "3.490.000", "5.jpg"));
		data2.put((long) 7, new Product(7, "Samsung Galaxy A71", "8.990.000", "10.990.000", "4.jpg"));
		data2.put((long) 8, new Product(8, "Samsung Galaxy A11", "3.690.000", "4.990.000", "ss2.png"));
	}
}
