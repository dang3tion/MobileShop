package model_product;

public class Picture_product {
	private String idProduct;
	private String idColor;
	private String picture1;
	private String picture2;
	private String picture3;
	private String picture4;
	private String pictureDiffrent;

	public Picture_product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Picture_product(String idProduct, String idColor, String picture1, String picture2, String picture3,
			String picture4, String pictureDiffrent) {
		super();
		this.idProduct = idProduct;
		this.idColor = idColor;
		this.picture1 = picture1;
		this.picture2 = picture2;
		this.picture3 = picture3;
		this.picture4 = picture4;
		this.pictureDiffrent = pictureDiffrent;
	}

	public String getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}

	public String getIdColor() {
		return idColor;
	}

	public void setIdColor(String idColor) {
		this.idColor = idColor;
	}

	public String getPicture1() {
		return picture1;
	}

	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}

	public String getPicture2() {
		return picture2;
	}

	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}

	public String getPicture3() {
		return picture3;
	}

	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}

	public String getPicture4() {
		return picture4;
	}

	public void setPicture4(String picture4) {
		this.picture4 = picture4;
	}

	public String getPictureDiffrent() {
		return pictureDiffrent;
	}

	public void setPictureDiffrent(String pictureDiffrent) {
		this.pictureDiffrent = pictureDiffrent;
	}

	@Override
	public String toString() {
		return "Color_product [idProduct=" + idProduct + ", idColor=" + idColor + ", picture1=" + picture1
				+ ", picture2=" + picture2 + ", picture3=" + picture3 + ", picture4=" + picture4 + ", pictureDiffrent="
				+ pictureDiffrent + "]";
	}

}
