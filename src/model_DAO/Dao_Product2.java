package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import BeanProduct.Config;
import BeanProduct.Detail_Config;
import BeanProduct.Detail_Propertie;
import BeanProduct.Price;
import BeanProduct.Product;
import BeanProduct.Propertie;
import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Account;

public class Dao_Product2 extends ExecuteStatementUtility {
	private final String PRODUCT = "SANPHAM";
	// tên các cột của bảng ACCOUNT
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

	public void add(Product product) {
		try {
			String query = "INSERT INTO " + PRODUCT + " VALUES(?,?,?,?,?,?,?,?,?,?)";
			String[] parameters = { //
					product.getId(), //
					product.getName(), //
					product.getSpecie(), //
					product.getIdBrand(), //
					product.getCondition(), //
					product.getDataUpdate(), //
					product.getIntroduce(), //
					product.getAmount() + "", //
					product.getAmountSale() + "", //
					product.getConfig() + ""

			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Product getProduct(String id) {
		String query = "SELECT * FROM " + PRODUCT + " WHERE " + MASP + " = ? ";
		String[] para = { id };
		Product product = null;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Product pro = new Product( //
						rs.getString(MASP), //
						rs.getString(TENSP), //
						rs.getString(LOAI_SP), //
						rs.getString(MATH), //
						rs.getString(TINHTRANG), rs.getString(NGAYCAPNHAT), //
						rs.getString(GIOITHIEU), //
						Integer.parseInt(rs.getString(SOLUONG)), //
						Integer.parseInt(rs.getString(SL_DABAN)), //
						rs.getString(MACH)//
				);//
				product = pro;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	public Price getPrice(String id) {
		String query = "SELECT * FROM " + "GIA_SP" + " WHERE " + MASP + " = ? ";
		String[] para = { id };
		Price price = null;
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Price pri = new Price( //
						rs.getString(MASP), //
						rs.getString(NGAYCAPNHAT), //
						Double.parseDouble(rs.getString("GIA")), //
						Double.parseDouble(rs.getString("GIA_KM")) //

				);//
				price = pri;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return price;
	}

	private final String CONFIG = "CAUHINH";

	public Config getConfig(String id) {
		String query = "SELECT * FROM " + CONFIG + " WHERE " + MACH + " = ? ";
		String[] para = { getProduct(id).getConfig() };
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



	private final String PROPERTIES = "THUOCTINH";
	public ArrayList<Propertie> listProper(String idTT){
		ArrayList<Propertie> proper = new ArrayList<Propertie>();
		String query = "SELECT * FROM " + PROPERTIES + " WHERE " + "MATT" + " = ? ";
		String[] para = { idTT };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				proper.add(new Propertie(rs.getString("MATT"),
						rs.getString("LOAI_GIATRI"),
						rs.getString("NOIDUNG") //

				));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return proper;
	}
	
	
	private final String DETAIL_PRO = "CHITIET_THUOCTINH";
	public ArrayList<Detail_Propertie> listDetailPro(String idCT){
		ArrayList<Detail_Propertie> proper = new ArrayList<Detail_Propertie>();
		String query = "SELECT * FROM " + DETAIL_PRO + " WHERE " + "MACT" + " = ? ";
		String[] para = { idCT };
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				proper.add(new Detail_Propertie(rs.getString("MACT"),
						rs.getString("GIATRI"),
						rs.getString("NOIDUNG"), //
						rs.getString("MATT"),
						listProper(rs.getString("MATT"))
				));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return proper;
	}
	
	
	


}
