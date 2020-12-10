package model_beans;

public class ShopInfo {
	private String name;
	private String policy;
	private String URL_facebook;
	private String URL_youtube;
	private String Address;

	public ShopInfo(String name, String policy, String uRL_facebook, String uRL_youtube, String address) {
		this.name = name;
		this.policy = policy;
		URL_facebook = uRL_facebook;
		URL_youtube = uRL_youtube;
		Address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPolicy() {
		return policy;
	}

	public void setPolicy(String policy) {
		this.policy = policy;
	}

	public String getURL_facebook() {
		return URL_facebook;
	}

	public void setURL_facebook(String uRL_facebook) {
		URL_facebook = uRL_facebook;
	}

	public String getURL_youtube() {
		return URL_youtube;
	}

	public void setURL_youtube(String uRL_youtube) {
		URL_youtube = uRL_youtube;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	@Override
	public String toString() {
		return "ShopInfo [name=" + name + ", policy=" + policy + ", URL_facebook=" + URL_facebook + ", URL_youtube="
				+ URL_youtube + ", Address=" + Address + "]";
	}

}
