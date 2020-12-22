package CREATE_DATA;

import java.sql.ResultSet;
import java.util.ArrayList;

import BeanProduct.Price;
import BeanProduct.Product;
import model_ConnectDB.ExecuteStatementUtility;

public class CreatePriceProduct6 extends ExecuteStatementUtility{
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
	
	public static String dateUp() {
		ArrayList<String> date = new ArrayList<String>();
		date.add("12/12/2018");
		date.add("12/2/2010");
		date.add("31/2/2018");

		return date.get(rdItem(date.size()));
	}
	
	public static int price() {
		ArrayList<Integer> price = new ArrayList<Integer>();
		price.add(5);
		price.add(50);
		price.add(4);
		price.add(50);

		return price.get(rdItem(price.size()));
	}

	public static int price_Sale() {
		ArrayList<Integer> priceSale = new ArrayList<Integer>();
		priceSale.add(2);
		priceSale.add(1);
		priceSale.add(3);
		priceSale.add(0);

		return priceSale.get(rdItem(priceSale.size()));
	}
	
	private final String PRODUCT = "GIA_SP";
	// tên các cột của bảng ACCOUNT
	private final String MASP = "MASP";
	private final String NGAYCAPNHAT = "NGAYCAPNHAT";
	private final String GIA = "GIA";
	private final String GIA_KM = "GIA_KM";
	
	public  void add(Price price) {
		try {
			String query = "INSERT INTO " + PRODUCT + " VALUES(?,?,?,?)";
			String[] parameters = { //
					price.getIdProduct(),//
					price.getDateUpdate(),//
					price.getPrice()+"",
					price.getPriceSale()+""
					
			};

			try (ResultSet rs = super.AccessDBstr(query, parameters)) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public static Price priceUp() {
		return new Price(idProduct(), dateUp(), price(), price_Sale());
	}
	
	public static void main(String[] args) {
		CreatePriceProduct6 price = new CreatePriceProduct6();
		for (int i = 0; i < 45; i++) {
			price.add(priceUp());
		}
	}
	
}
