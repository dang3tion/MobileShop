package model_beans;


public class GooglePojo {

	private String id;
	private String email;
	private boolean verified_email;
	private String name;
	private String given_name;
	private String family_name;
	private String link;
	private String picture;

	public String getId() {
		return this.id;
	}

	

	public String getEmail() {
		return this.email;
	}

	

	public boolean isVerified_email() {
		return this.verified_email;
	}


	public String getName() {
		return this.name;
	}

	

	public String getGiven_name() {
		return this.given_name;
	}

	

	public String getFamily_name() {
		return this.family_name;
	}

	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}

	public String getLink() {
		return link;
	}


	public String getPicture() {
		return picture;
	}

	
	public String toString() {
		return

		"GooglePojo [id=" + this.id + ", email=" + this.email + ", verified_email=" + this.verified_email + ", name="
				+ this.name + ", given_name=" + this.given_name + ", family_name=" + this.family_name + "]";
	}
}
