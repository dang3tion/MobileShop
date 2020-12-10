package model_beans;

import java.time.LocalDate;
import java.util.ArrayList;

import model_utility.Const;



public class Customer {

	private String id;
	private String email;
	private String password;
	private String status;
	// Output format : 2020-11-19
	private String timeCreate;
	private String name;
	private String phoneNumber;
	private String address;

	public Customer() {
	}

	/**
	 * @apiNote Trang register
	 */
	public Customer(String email, String password) {
		this.email = email;
		this.password = password;
		this.status = Const.ACCOUNT_ENABLE;
		this.timeCreate = LocalDate.now().toString();
		this.name = "";
		this.phoneNumber = "";
		this.address = "";
	}

	/**
	 * 
	 * @apiNote Trang Admin quản lý tài khoản
	 */
	public Customer(String id, String email, String status, String timeCreate, String name, String phoneNumber,
			String address) {
		this.id = id;
		this.email = email;
		this.status = status;
		this.timeCreate = timeCreate;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	/**
	 * @apiNote Trang Profile
	 */
	public Customer(String email, String timeCreate, String name, String phoneNumber, String address) {
		this.email = email;
		this.timeCreate = timeCreate;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	/**
	 * @apiNote Trang Login
	 */
	public Customer(String email, String password, String status) {
		this.email = email;
		this.password = password;
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getId() {
		return id;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTimeCreate() {
		return timeCreate;
	}

	public void setTimeCreate(String timeCreate) {
		this.timeCreate = timeCreate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFirstName() {
		String[] arr = this.name.split(" ");
		ArrayList<String> arrName = new ArrayList<String>();
		for (String n : arr) {
			if (n != null) {
				arrName.add(n);
			}
		}
		return arrName.get(arrName.size() - 1);
	}

	@Override
	public String toString() {
		return "Customer [email=" + email + ", password=" + password + ", status=" + status + ", timeCreate="
				+ timeCreate + ", name=" + name + ", phoneNumber=" + phoneNumber + ", address=" + address + "]\n";
	}

}
