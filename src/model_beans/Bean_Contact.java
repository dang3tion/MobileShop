package model_beans;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Bean_Contact {
	private String name;
	private String email;
	private String numberPhone;
	private LocalDate date;
	private String content;
	
	public Bean_Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Bean_Contact(String name, String email, String numberPhone, LocalDate date, String content) {
		super();
		this.name = name;
		this.email = email;
		this.numberPhone = numberPhone;
		this.date = date;
		this.content = content;
	}



	public Bean_Contact(String name, String email, String numberPhone, String content) {
		super();
		this.name = name;
		this.email = email;
		this.numberPhone = numberPhone;
		this.content = content;
		this.date = LocalDate.now();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumberPhone() {
		return numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}



	public LocalDate getDate() {
		return date;
	}



	public void setDate(LocalDate date) {
		this.date = date;
	}



	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Contact [name=" + name + ", email=" + email + ", numberPhone=" + numberPhone + ", date=" + date
				+ ", content=" + content + "]";
	}
	
	
	
}
