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
				price.setPriceSale(rs.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// set thuong hieu
		query = "SELECT TH.MATH,TH.TENTH,TH.SLDT FROM THUONGHIEU TH JOIN SANPHAM SP ON SP.MATH=TH.MATH WHERE SP.MASP= ? ";
		try (ResultSet rs = super.AccessDBstr(query, para)) {
			while (rs.next()) {
				branch.setMath(rs.getString(1));
				branch.setTenth(rs.getString(2));
				branch.setSldt(rs.getInt(3));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		// set thuoc tinh

		return null;
	}

	public static void main(String[] args) {
		System.out.println(getDao_Product_main().getProduct_main("SP01"));
	}
}
