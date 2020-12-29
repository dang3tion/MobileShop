package model_beans;


public class Bean_Contact {
	private String numericalOrder;
	private String id;
	private String name;
	private String email;
	private String numberPhone;
	private String date;
	private String content;
	private String state;
	public Bean_Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	


	public Bean_Contact(String numericalOrder, String id, String name, String email, String numberPhone, String date,
			String content, String state) {
		super();
		this.numericalOrder = numericalOrder;
		this.id = id;
		this.name = name;
		this.email = email;
		this.numberPhone = numberPhone;
		this.date = date;
		this.content = content;
		this.state = state;
	}




	public Bean_Contact(String name, String email, String numberPhone, String content) {
		super();
		this.name = name;
		this.email = email;
		this.numberPhone = numberPhone;
		this.content = content;
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






	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}







	public String getId() {
		return id;
	}







	public void setId(String id) {
		this.id = id;
	}







	public String getState() {
		return state;
	}







	public void setState(String state) {
		this.state = state;
	}


	public String getNumericalOrder() {
		return numericalOrder;
	}




	public void setNumericalOrder(String numericalOrder) {
		this.numericalOrder = numericalOrder;
	}




	@Override
	public String toString() {
		return "Bean_Contact [id=" + id + ", name=" + name + ", email=" + email + ", numberPhone=" + numberPhone
				+ ", date=" + date + ", content=" + content + ", state=" + state + "]";
	}


	
	
	
}
