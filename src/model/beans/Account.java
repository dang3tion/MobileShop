package model.beans;

import java.time.LocalDate;
import java.util.ArrayList;

import model.utility.Const;

public class Account {

	private String email;
	private String password;
	private String role;
	private String status;
	// Output format : 2020-11-19
	private String timeCreate;

	private String name;
	private String phoneNumber;
	private String address;

	// Dành cho JSTL
	public Account() {
	}

	// Dành cho lúc insert User mới
	public Account(String email, String password, String name, String phoneNumber, String address) {
		this.email = email;
		this.password = password;
		this.role = Const.CUSTOMER_ROLE;
		this.status = Const.ACCOUNT_ENABLE;
		this.timeCreate = LocalDate.now().toString();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	// Dành để load User từ database lên
	public Account(String email, String password, String role, String status, String timeCreate, String name,
			String phoneNumber, String address) {
		this.email = email;
		this.password = password;
		this.role = role;
		this.status = status;
		this.timeCreate = timeCreate;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	// Dành để load User thành danh sách
	public Account(String email, String status, String timeCreate, String name, String phoneNumber, String address) {
		this.email = email;
		this.status = status;
		this.timeCreate = timeCreate;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
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
		return "Account [email=" + email + ", password=" + password + ", role=" + role + ", status=" + status
				+ ", timeCreate=" + timeCreate + ", name=" + name + ", phoneNumber=" + phoneNumber + ", address="
				+ address + "]\n";
	}

}
