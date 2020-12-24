package BeanProduct;

import java.util.ArrayList;

public class Color_Product {
    private String id;
    private String name;
    private ArrayList<Image_Product> listImg = new ArrayList<Image_Product>();
	public Color_Product(String id, String name, ArrayList<Image_Product> listImg) {
		super();
		this.id = id;
		this.name = name;
		this.listImg = listImg;
	}
	public Color_Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Image_Product> getListImg() {
		return listImg;
	}
	public void setListImg(ArrayList<Image_Product> listImg) {
		this.listImg = listImg;
	}
	@Override
	public String toString() {
		return "Color_Product [id=" + id + ", name=" + name + ", listImg=" + listImg + "]";
	}
    
    
	


}
