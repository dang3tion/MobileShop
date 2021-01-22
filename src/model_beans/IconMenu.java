package model_beans;

import java.io.Serializable;

public class IconMenu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String icon;
	private String content;
	public IconMenu(String icon, String content) {
		super();
		this.icon = icon;
		this.content = content;
	}
	public IconMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "IconMenu [icon=" + icon + ", content=" + content + "]";
	}
	
	
	
}
