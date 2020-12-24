package model_beans;

import java.util.ArrayList;

public class Color_main {
	private String id;
	private String name;
	private String imgMain;
	private ArrayList<String> imgSubs = new ArrayList<String>();

	public Color_main(String id, String name, String imgMain, ArrayList<String> imgSubs) {
		super();
		this.id = id;
		this.name = name;
		this.imgMain = imgMain;
		this.imgSubs = imgSubs;
	}

	public Color_main() {
		super();
	}

	public void addImgSubs(String img) {
		imgSubs.add(img);
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

	public String getImgMain() {
		return imgMain;
	}

	public void setImgMain(String imgMain) {
		this.imgMain = imgMain;
	}

	public ArrayList<String> getImgSubs() {
		return imgSubs;
	}

	public void setImgSubs(ArrayList<String> imgSubs) {
		this.imgSubs = imgSubs;
	}

}
