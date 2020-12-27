package CREATE_DATA;

import java.util.ArrayList;
import java.util.Random;

import model_DAO.Dao_Contact;
import model_beans.Bean_Contact;

public class CreateDataContact {
	public static int rdINT(int start, int end) {
		return (int) ((Math.random() * (end - start)) + start);
	}

	public static int rdItem(int arrSize) {
		return (int) ((Math.random() * arrSize));
	}
	public static String email() {
		ArrayList<String> ho = new ArrayList<String>();
		ho.add("pexot55396@ailiking.com");
		ho.add("romocar691@kakekbet.com");
		ho.add("fokov88217@nowdigit.com");
		ho.add("yasiro4984@nowdigit.com");
		ho.add("dolice3097@mmgaklan.com");
		ho.add("vaxal81727@nenekbet.com");
		return ho.get(rdItem(ho.size()));
	}
	public static String danhgia() {
		ArrayList<String> tenDem = new ArrayList<String>();
		tenDem.add("Chất lượng sản phẩm tương đối tốt");
		tenDem.add("Chất lượng dịch vụ tốt");
		tenDem.add("Khi nào mới có điện thoại iphone 12");
		tenDem.add("Cửa hàng mở cửa khi nào");
		tenDem.add("Cửa hàng có mua lại điện thoại cũ không");
		tenDem.add("Giá của samsung note20 là bao nhiêu");
		tenDem.add("Sản phẩm bảo hành như thế nào");
		return tenDem.get(rdItem(tenDem.size()));
	}
	public static String sdt() {
		Random rd = new Random();
		String sdt = "0";
		for (int i = 0; i < 9; i++) {
			sdt += rd.nextInt(10);
		}
		return sdt;
	}
	public static String ten() {
		ArrayList<String> ho = new ArrayList<String>();
		
		ho.add("Trần");
		ho.add("Lê");
		ho.add("Trịnh");
		ho.add("Nguyễn");
		ho.add("Châu");
		ho.add("Bùi");
		ho.add("Lâm");
		ho.add("Phan");
		ho.add("Phạm");
		ho.add("Vũ");
		ho.add("Võ");
		ho.add("Dương");
		ho.add("Đỗ");
		ho.add("Ngô");
		ho.add("Hồ");
		ho.add("Đặng");
		ho.add("Huỳnh");
		ho.add("Thạch");
		ho.add("Trương");
		ho.add("Lý");
		return ho.get(rdItem(ho.size()));
	}
	public static String sDt() {
		ArrayList<String> sdt = new ArrayList<String>();
		for (int i = 0; i < 20; i++) {
			sdt.add(sdt());
		}
		return sdt.get(rdItem(sdt.size()));
	}
	
	public static Bean_Contact bean() {
		return new Bean_Contact(ten(), email(), sDt(), danhgia());
	}
	public static void main(String[] args) {
		Dao_Contact dao = new Dao_Contact();
		for (int i = 0; i <45; i++) {
			dao.addContact(bean());
		}
	}

}
