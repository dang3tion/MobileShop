package BeanProduct;

import java.util.ArrayList;

public class Color_Product {
    private String id;
    private String code;
    private String name;
	public Color_Product(String id, String code, String name) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Color_Product [id=" + id + ", code=" + code + ", name=" + name + "]";
	}
	
}
