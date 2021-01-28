package model_BO_service;

import java.util.List;
import model_DAO.DAO_Account;
import model_DAO.DAO_Order;
import model_beans.Account;
import model_beans.Order;

public class BO_Order {

	private static BO_Order boOrder = null;
	private int pageNumber;
	private int numRowPerPage;
	private DAO_Order dao = DAO_Order.getDAO_Order();

	private BO_Order() {
	}

	public static BO_Order getBO_Order() {
		if (boOrder == null) {
			boOrder = new BO_Order();
		}
		return boOrder;
	}

	public BO_Order(int pageNumber_str, int numRowPerPage_str) {
		this.pageNumber = pageNumber_str;
		this.numRowPerPage = numRowPerPage_str;
	}

	public List<Order> getList() {
		System.out.println(startRow());
		System.out.println(endRow());
		return dao.getListOrder(startRow(), endRow());

	}

	public int getTotalOrder() {
		int total;
		total = dao.totalOrder();
		return total;
	}

	public int totalPage() {
		int num = getTotalOrder() / 10;

		if (getTotalOrder() % 10 > 1) {
			num += 1;
		}

		return num;
	}

	public int startRow() {
		
		return (pageNumber-1)*10+1;
	}

	public int endRow() {
	
		return pageNumber*10;
	}

	public static void main(String[] args) {
		System.out.println(new BO_Order(1, 10).getList());
	}

}
