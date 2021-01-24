package model_BO_service;

import java.util.ArrayList;

import BeanProduct.Config;
import BeanProduct.Detail_Config;
import BeanProduct.StarEvaluate;
import model_DAO.DAO_Product;
import model_beans.Product;
import model_beans.ProductAdmin;

public class BO_Product {
//	Dao_Product2 dao2 = new Dao_Product2();
	DAO_Product dao = new DAO_Product();
	
	private static BO_Product boProduct = null;
	
	public static BO_Product getBoProduct() {
		if (boProduct == null) {
			boProduct = new BO_Product();
		}
		return boProduct;
	}

	public BO_Product() {
	}
	

	public Product getProduct(String id) {
		return dao.getProduct(id);
	}

	public ArrayList<Product> getList(int start, int end) {
		return dao.getList(start,end);
	}

	public ArrayList<Detail_Config> config(String id) {
		return dao.getDetailConfig(id);
	}

	public StarEvaluate star(String id) {
		return new StarEvaluate(id, dao.countStar("1", id), dao.countStar("2", id), dao.countStar("3", id),
				dao.countStar("4", id), dao.countStar("5", id));
	}
	
	public ArrayList<ProductAdmin> listProductAdmin(int start,int end){
		return dao.listProductAdmin(start, end);
	}
	public void updateStateProduct(String id) {
		dao.updateState(id);
	}
	public static void main(String[] args) {
		BO_Product bo = new BO_Product();
		System.out.println(bo.star("SP08").getStar1());
	}
	
}
