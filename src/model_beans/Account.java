package model_beans;

import java.time.LocalDate;
import java.util.ArrayList;

import model_utility.Const;
import model_utility.EncryptPassword;

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

	// Dành cho lúc đăng kí
	public Account(String email, String passwordPlaintext) {
		this.email = email;
		this.password = EncryptPassword.md5(passwordPlaintext);
		this.status = Const.ACCOUNT_ENABLE;
		this.timeCreate = LocalDate.now().toString();
		this.role = Const.CUSTOMER_ROLE;
		this.name = "";
		this.phoneNumber = "";
		this.address = "";

	}
	
	
//	CREATE TABLE TAIKHOAN
//	(
//	    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
//	    MAKH AS 'KH0' + RIGHT(CAST(ID AS VARCHAR(3)), 3) PERSISTED,
//	    EMAIL NVARCHAR(200) NOT NULL,
//	    MATKHAU NVARCHAR(200) NOT NULL,
//	    TRANGTHAI NVARCHAR(20) NOT NULL,
//	    THOIGIANTAO NVARCHAR(30) NOT NULL,
//	    QUYENHAN NVARCHAR(12) NOT NULL,
//	    TEN NVARCHAR(100),
//	    SDT NVARCHAR(12),
//	    DIACHI NVARCHAR(400)
//	)
	
	

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
