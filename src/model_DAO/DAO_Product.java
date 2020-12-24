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



	public DAO_Product() {

	}



	public String thumbnail(String id) {
		String query = "SELECT ANH FROM HINHANH WHERE MASP = '?' AND LOAIANH = 'NEN'";
		String link = "";
		String[] para = {id};
		System.out.println(query);
		try (ResultSet rs = super.AccessDBstr(query,para)) {
			while (rs.next()) {
				link = rs.getString("ANH");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return link;
	}

	public ArrayList<Product> getList(int start,int end) {
	 ArrayList<Product> fakeDatabase = new ArrayList<Product>();
		String[] para = { start+"",end+"" };
		String query = "WITH X AS (select ROW_NUMBER() OVER (ORDER BY SANPHAM.MASP DESC) AS STT,SANPHAM.MASP, SANPHAM.TENSP,SANPHAM.GIOITHIEU,GIA,GIA_KM,MACH FROM  SANPHAM\r\n"
				+ "				inner join GIA_SP on SANPHAM.MASP = GIA_SP.MASP) SELECT * FROM X WHERE STT BETWEEN ? AND ?";
		Product product = null;
		try (ResultSet rs = super.AccessDBstr(query,para)) {
			while (rs.next()) {
				fakeDatabase.add(new Product(rs.getString("MASP").trim(), thumbnail(rs.getString("MASP").trim()), rs.getString("TENSP"), rs.getString("GIOITHIEU"), rs.getInt("GIA"),
						rs.getInt("GIA_KM"), rs.getString("MACH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

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
				Product pro = new Product(id, thumbnail(id), rs.getString(1), rs.getString(2), rs.getInt(3),
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
	public static void main(String[] args) {
		DAO_Product dao = new DAO_Product();
		dao.thumbnail("sp01");
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
