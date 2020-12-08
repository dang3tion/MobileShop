package temporary_dropdata;

import java.util.ArrayList;

public class BO_Product {
	public static ArrayList<Beans_Product> fakeDatabase = new ArrayList<Beans_Product>();

	public static ArrayList<Beans_Product> getFakeDatabase() {
		fakeDatabase.add(new Beans_Product("MBS_001", "Oppo", 888));
		fakeDatabase.add(new Beans_Product("MBS_002", "Apple", 555));
		fakeDatabase.add(new Beans_Product("MBS_003", "Samsung", 222));
		fakeDatabase.add(new Beans_Product("MBS_004", "Xiaomi", 111));
		fakeDatabase.add(new Beans_Product("MBS_005", "Vefsdrtu", 555));
		fakeDatabase.add(new Beans_Product("MBS_006", "Oppsdfo", 8567));
		fakeDatabase.add(new Beans_Product("MBS_007", "Opdfpo", 3123));
		fakeDatabase.add(new Beans_Product("MBS_008", "Opdfspo", 5345));
		fakeDatabase.add(new Beans_Product("MBS_009", "Oppdfsdo", 45345));
		fakeDatabase.add(new Beans_Product("MBS_010", "Odsfo", 8545));
		fakeDatabase.add(new Beans_Product("MBS_011", "Osfsdf", 435435));
		fakeDatabase.add(new Beans_Product("MBS_012", "fdf", 8454));
		return fakeDatabase;
	}

	public Beans_Product search(String id) {
		for (Beans_Product p : getFakeDatabase()) {
			if (p.getId().equals(id)) {
				return p;
			}
		}
		return null;
	}
	
	
}
