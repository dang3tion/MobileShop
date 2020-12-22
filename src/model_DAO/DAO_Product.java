package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import BeanProduct.Config;
import BeanProduct.Detail_Config;
import BeanProduct.Detail_Propertie;
import BeanProduct.Propertie;
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

		fakeDatabase.add(new Product("sp1", thumbnail(1), name(1), "sản phẩm 1", 9000000, 2000000));
		fakeDatabase.add(new Product("sp" + 6, thumbnail(6), name(6), "sản phẩm 1", 4000000, 2000000));
		fakeDatabase.add(new Product("sp" + 0, thumbnail(2), name(2), "sản phẩm 2", 8000000, 2000000));

		fakeDatabase.add(new Product("sp" + 5, thumbnail(3), name(3), "sản phẩm 1", 7000000, 2000000));
		fakeDatabase.add(new Product("sp" + 13, thumbnail(4), name(4), "sản phẩm 1", 6000000, 2000000));
		fakeDatabase.add(new Product("sp" + 16, thumbnail(5), name(5), "sản phẩm 1", 5000000, 2000000));
		
		fakeDatabase.add(new Product("sp" + 7, thumbnail(7), name(7), "sản phẩm 1", 3000000, 2000000));
		fakeDatabase.add(new Product("sp" + 8, thumbnail(8), name(8), "sản phẩm 1", 2000000, 2000000));
		fakeDatabase.add(new Product("sp" + 9, thumbnail(9), name(9), "sản phẩm 1", 1000000, 2000000));
		fakeDatabase.add(new Product("sp" + 10, thumbnail(10), name(10), "sản phẩm 1", 9000000, 2000000));

		return fakeDatabase;
	}

	private final String PRODUCT = "SANPHAM";
	// tên các cột của bảng ACCOUNT
	private final String MASP1 = "SANPHAM.MASP";
	private final String MASP = "MASP";
	private final String TENSP = "TENSP";
	private final String LOAI_SP = "LOAI_SP";
	private final String MATH = "MATH";
	private final String TINHTRANG = "TINHTRANG";
	private final String NGAYCAPNHAT = "NGAYCAPNHAT";
	private final String GIOITHIEU = "GIOITHIEU";
	private final String SOLUONG = "SOLUONG";
	private final String SL_DABAN = "SL_DABAN";
	private final String MACH = "MACH";

	public Product getProduct(String id) {
		String query = "select SANPHAM.TENSP,SANPHAM.GIOITHIEU,GIA,GIA_KM,MACH FROM " + PRODUCT
				+ " inner join GIA_SP on SANPHAM.MASP = GIA_SP.MASP WHERE " + MASP1 + " = ? ";
		String[] para = { id };
		Product product = null;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Product pro = new Product(id, thumbnail(2), rs.getString(1), rs.getString(2), rs.getInt(3),
						rs.getInt(4), rs.getString(5));
				product = pro;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	private final String CONFIG = "CAUHINH";

	public Config getConfig(String id) {
		String query = "SELECT * FROM " + CONFIG + " WHERE " + MACH + " = ? ";
		String[] para = { getProduct(id).getIdConfig() };
		Config conf = null;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				conf = new Config( //
						rs.getString(MACH), //
						Integer.parseInt(rs.getString("SLTT")) //

				);//
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conf;
	}

	private final String DETAIL_CONFIG = "CH_CTTT";

	public ArrayList<Detail_Config> getDetailConfig(String id) {
		ArrayList<Detail_Config> detail = new ArrayList<Detail_Config>();
		String query = "SELECT * FROM " + DETAIL_CONFIG + " WHERE " + MACH + " = ? ";
		String[] para = { getConfig(id).getId() };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				detail.add(new Detail_Config( //
						rs.getString(MACH), //
						rs.getString("MACT"), //
						listDetailPro(rs.getString("MACT"))));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return detail;
	}

	private final String PROPERTIES = "THUOCTINH";

	public ArrayList<Propertie> listProper(String idTT) {
		ArrayList<Propertie> proper = new ArrayList<Propertie>();
		String query = "SELECT * FROM " + PROPERTIES + " WHERE " + "MATT" + " = ? ";
		String[] para = { idTT };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				proper.add(new Propertie(rs.getString("MATT"), rs.getString("LOAI_GIATRI"), rs.getString("NOIDUNG") //

				));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return proper;
	}

	private final String DETAIL_PRO = "CHITIET_THUOCTINH";

	public Detail_Propertie listDetailPro(String idCT) {
		Detail_Propertie proper = null;
		String query = "SELECT * FROM " + DETAIL_PRO + " WHERE " + "MACT" + " = ? ";
		String[] para = { idCT };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				proper = (new Detail_Propertie(rs.getString("MACT"), rs.getString("GIATRI"), rs.getString("NOIDUNG"), //
						rs.getString("MATT"), listProper(rs.getString("MATT"))));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return proper;
	}

	private final String DANHGIA = "DANHGIA";

	public int countStar(String numberStar, String id) {
		String query = "SELECT  COUNT(MUCDANHGIA) FROM " + DANHGIA + " WHERE " + "MASP" + " = ? AND " + "MUCDANHGIA =?";
		String[] para = { id, numberStar };
		int star = 0;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				star = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return star;
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
