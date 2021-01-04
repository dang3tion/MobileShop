package BeanProduct;

import java.util.ArrayList;

public class Image_Product {
	private String idProduct;
	private String idColor;
	private String imgImage;
	private String type;
	public Image_Product(String idProduct, String idColor, String imgImage, String type) {
		super();
		this.idProduct = idProduct;
		this.idColor = idColor;
		this.imgImage = imgImage;
		this.type = type;
	}
	public Image_Product() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getImgImage() {
		return imgImage;
	}
	public void setImgImage(String imgImage) {
		this.imgImage = imgImage;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Image_Product [idProduct=" + idProduct + ", idColor=" + idColor + ", imgImage=" + imgImage + ", type="
				+ type + "]";
	}
	
	
	
}
