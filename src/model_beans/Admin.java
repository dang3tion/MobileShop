package model_beans;


public class Admin {
	private String username;
	private String password;

	public Admin(String email, String password) {
		this.username = email;
		this.password = password;
	}

	public String getEmail() {
		return username;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [username=" + username + ", password=" + password + "]\n";
	}
}
