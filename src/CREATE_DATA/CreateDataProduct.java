package CREATE_DATA;

import java.util.ArrayList;

import BeanProduct.Product;
import model_DAO.DAO_Account;
import model_DAO.DAO_Product;
import model_DAO.Dao_Product2;
import model_beans.Account;

public class CreateDataProduct {
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

	public static String name() {

		ArrayList<String> name = new ArrayList<String>();
		name.add("Trần");
		name.add("Lê");
		name.add("Trịnh");
		name.add("Nguyễn");
		name.add("Châu");
		name.add("Bùi");
		name.add("Lâm");
		name.add("Phan");
		name.add("Phạm");
		name.add("Vũ");
		name.add("Võ");
		name.add("Dương");
		name.add("Đỗ");
		name.add("Ngô");
		name.add("Hồ");
		name.add("Đặng");
		name.add("Huỳnh");
		name.add("Thạch");
		name.add("Trương");
		name.add("Lý");
		return name.get(rdItem(name.size()));

	}

	public static String piece() {
		ArrayList<String> piece = new ArrayList<String>();
		piece.add("Iphone 15");
		piece.add("Samsung A7");
		piece.add("Samsung s20");
		piece.add("Samsung 7");
		piece.add("Iphone 8");
		piece.add("Iphone 12");
		piece.add("Nokia");
		piece.add("Xiaomi");

		return piece.get(rdItem(piece.size()));
	}

	public static String brand() {
		ArrayList<String> brand = new ArrayList<String>();
		brand.add("Apple");
		brand.add("Samsung");
		brand.add("Nokia");
		brand.add("Xiaomi");

		return brand.get(rdItem(brand.size()));
	}

	public static String state() {
		ArrayList<String> state = new ArrayList<String>();
		state.add("Còn");
		state.add("Hết");

		return state.get(rdItem(state.size()));
	}

	public static String dateUp() {
		ArrayList<String> date = new ArrayList<String>();
		date.add("12/12/2018");
		date.add("12/2/2010");
		date.add("31/2/2018");

		return date.get(rdItem(date.size()));
	}

	public static String introduce() {
		ArrayList<String> intro = new ArrayList<String>();
		intro.add("Đặc điểm nổi bật của iPhone 12 Pro Max 512GB\r\n" + "\r\n"
				+ "iPhone 12 Pro Max 512GB - đẳng cấp từ tên gọi đến từng chi tiết. Ngay từ khi chỉ là tin đồn thì chiếc smartphone này đã làm đứng ngồi không yên bao “fan cứng” nhà Apple, với những nâng cấp vô cùng nổi bật hứa hẹn sẽ mang đến những trải nghiệm tốt nhất về mọi mặt mà chưa một chiếc iPhone tiền nhiệm nào có được.");
		intro.add("Thiết kế cải tiến hướng đến sự hoàn thiện\r\n"
				+ "Samsung Galaxy Z Fold 2 vẫn giữ nguyên cơ chế màn hình gập ở thế hệ tiền nhiệm. Như một quyển sách, chiếc điện thoại mở ra để hiển thị màn hình lớn bên trong. Bên ngoài là một màn hình phụ tràn viền với thiết kế đục lỗ");
		intro.add(
				"Những chất liệu cao cấp nhất đã được Samsung ưu ái trang bị lên Galaxy Z Fold 2, khung máy được làm từ nhôm, vuông vức hơn, giúp cho siêu phẩm màn hình gập mới của Samsung có một diện mạo nam tính và sang trọng hơn.");

		return intro.get(rdItem(intro.size()));
	}

	public static int amount() {
		ArrayList<Integer> amount = new ArrayList<Integer>();
		amount.add(5);
		amount.add(50);
		amount.add(4);
		amount.add(50);

		return amount.get(rdItem(amount.size()));
	}

	public static int amount_Sale() {
		ArrayList<Integer> amount = new ArrayList<Integer>();
		amount.add(2);
		amount.add(1);
		amount.add(3);
		amount.add(0);

		return amount.get(rdItem(amount.size()));
	}

	public static String config() {
		ArrayList<String> config = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			config.add("ch" + i);
		}

		return config.get(rdItem(config.size()));
	}

	public static Product product() {
		return new Product(idProduct(), name(), piece(), brand(), state(), dateUp(), introduce(), amount(),
				amount_Sale(), config());
	}

	public static void main(String[] args) {
		Dao_Product2 dao = new Dao_Product2();
		System.out.println(product().toString());
		for (int i = 0; i < 45; i++) {
			dao.add(product());
		}
	}

}
