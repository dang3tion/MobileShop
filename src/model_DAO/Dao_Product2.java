package model_DAO;

import java.sql.ResultSet;

import BeanProduct.Product;
import model_ConnectDB.ExecuteStatementUtility;

public class Dao_Product2 extends ExecuteStatementUtility{
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
					product.getAmount()+"", //
					product.getAmountSale()+"",//
					product.getAmountSale()+""
					
			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
