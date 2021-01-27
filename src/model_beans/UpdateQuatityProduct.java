package model_beans;

public class UpdateQuatityProduct {
	private String id;
	private int quatity;
	public UpdateQuatityProduct(String id, int quatity) {
		super();
		this.id = id;
		this.quatity = quatity;
	}
	public UpdateQuatityProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQuatity() {
		return quatity;
	}
	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}
	@Override
	public String toString() {
		return "UpdateQuatityProduct [id=" + id + ", quatity=" + quatity + "]";
	}
	
	
}
