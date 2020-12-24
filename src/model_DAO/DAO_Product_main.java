package model_DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model_ConnectDB.ExecuteStatementUtility;
import model_beans.Attribute;
import model_beans.Branch;
import model_beans.Color_main;
import model_beans.Price_product_main;
import model_beans.Product_main;

public class DAO_Product_main extends ExecuteStatementUtility {
	private final String PRODUCT = "SANPHAM";
	private final String ID = "MASP";
	private final String PRICE = "GIA_SP";
	private final String PRICE_DATE = "NGAYCAPNHAT";
	private static DAO_Product_main dao_product_main = null;

	private DAO_Product_main() {

	}

	public static DAO_Product_main getDao_Product_main() {
		if (dao_product_main == null) {
			dao_product_main = new DAO_Product_main();
		}
		return dao_product_main;
	}

	public Product_main getProduct_main(String id) {
		String[] para = { id };
		Branch branch = new Branch();
		Price_product_main price = new Price_product_main();
		ArrayList<Attribute> lstAtt = new ArrayList<Attribute>();
		ArrayList<Color_main> lstColor = new ArrayList<Color_main>();
		// set gia
		String query = "SELECT TOP 1 *  FROM " + PRICE + " WHERE " + ID + " = ? ORDER BY " + PRICE_DATE + " DESC";

		System.out.println(query);

		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				price.setPrice(rs.getInt(3));
				price.setPriceSales(rs.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// set thuong hieu
		query = "SELECT TH.MATH,TH.TENTH,TH.SLDT FROM THUONGHIEU TH JOIN SANPHAM SP ON SP.MATH=TH.MATH WHERE SP.MASP= ? ";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				branch.setId(rs.getString(1));
				branch.setName(rs.getString(2));
				branch.setQuantity_product(rs.getInt(3));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		query = "  SELECT SP.MASP, LTT.MALOP,LTT.NOIDUNG FROM SANPHAM SP JOIN CAUHINH CH ON CH.MACH=SP.MACH JOIN CH_CTTT CT ON CT.MACH=CH.MACH JOIN CHITIET_THUOCTINH CTT ON CTT.MACT=CT.MACT JOIN THUOCTINH TT ON TT.MATT=CTT.MATT JOIN LOP_THUOCTINH LTT ON LTT.MALOP=TT.MALOP WHERE SP.MASP= ? GROUP BY SP.MASP, LTT.MALOP,LTT.NOIDUNG";
		// set thuoc tinh
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Attribute att = new Attribute();
				att.setName(rs.getString(3));
				String idAtt = rs.getString(2);
				String query2 = "\r\n"
						+ "SELECT SP.MASP, LTT.MALOP,tt.MATT,tt.NOIDUNG,ctt.NOIDUNG,ctt.MACT FROM SANPHAM SP JOIN CAUHINH CH ON CH.MACH=SP.MACH JOIN CH_CTTT CT ON CT.MACH=CH.MACH JOIN CHITIET_THUOCTINH CTT ON CTT.MACT=CT.MACT\r\n"
						+ "JOIN THUOCTINH TT ON TT.MATT=CTT.MATT JOIN LOP_THUOCTINH LTT ON LTT.MALOP=TT.MALOP WHERE SP.MASP=? AND LTT.MALOP=? \r\n"
						+ "GROUP BY SP.MASP, LTT.MALOP,tt.MATT,tt.NOIDUNG,ctt.NOIDUNG,ctt.MACT ORDER BY TT.MATT ASC";
				String[] para2 = { id, idAtt };
				try (ResultSet rs2 = super.AccessDBstr(query2, para2)) {
					att.addAttribute(rs2.getString(4), rs2.getString(5));
				} catch (Exception e) {
					// TODO: handle exception
				}
				lstAtt.add(att);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		// set mau
		query = "SELECT HA.MASP,HA.MAMAU,MS.TENMAU FROM HINHANH HA JOIN MAUSAC MS ON MS.MAMAU=HA.MAMAU WHERE HA.MASP=? GROUP BY HA.MASP,HA.MAMAU,MS.TENMAU";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				Color_main cl = new Color_main();
				cl.setId(rs.getString(1));
				cl.setName(rs.getString(3));
				String idColor = rs.getString(2);
				String query2 = "SELECT * FROM HINHANH HA JOIN MAUSAC MS ON MS.MAMAU=HA.MAMAU WHERE HA.MASP=? AND HA.MAMAU=? ";
				String[] para2 = { id, idColor };
				try (ResultSet rs2 = super.AccessDBstr(query2, para2)) {
					String type = rs2.getString(4);
					if (type.equals("NEN")) {
						cl.setImgMain(rs2.getString(3));
					} else {
						cl.addImgSubs(rs2.getString(3));
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				lstColor.add(cl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query = "SELECT * FROM SANPHAM WHERE MASP=?";
		Product_main product = new Product_main();
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				product.setID(rs.getString(1));
				product.setName(rs.getString(2));
				product.setType(rs.getString(3));
				product.setStatus(rs.getString(5));
				product.setUpdate_date(rs.getString(6));
				product.setPosts(rs.getString(7));
				product.setQuantity(rs.getInt(8));
				product.setSale_quantity(rs.getInt(9));
				product.setView(rs.getInt(10));

			}
			product.setAttributes(lstAtt);
			product.setColors(lstColor);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return product;
	}

	public static void main(String[] args) {
		System.out.println(getDao_Product_main().getProduct_main("SP01"));
	}
}
