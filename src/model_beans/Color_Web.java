package model_beans;

public class Color_Web {
	private String colorMenu;
	private String colorFilter;
	private String colorBody;
	private String colorText;
	public Color_Web(String colorMenu, String colorFilter, String colorBody, String colorText) {
		super();
		this.colorMenu = colorMenu;
		this.colorFilter = colorFilter;
		this.colorBody = colorBody;
		this.colorText = colorText;
	}
	public Color_Web() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getColorMenu() {
		return colorMenu;
	}
	public void setColorMenu(String colorMenu) {
		this.colorMenu = colorMenu;
	}
	public String getColorFilter() {
		return colorFilter;
	}
	public void setColorFilter(String colorFilter) {
		this.colorFilter = colorFilter;
	}
	public String getColorBody() {
		return colorBody;
	}
	public void setColorBody(String colorBody) {
		this.colorBody = colorBody;
	}
	public String getColorText() {
		return colorText;
	}
	public void setColorText(String colorText) {
		this.colorText = colorText;
	}
	@Override
	public String toString() {
		return "Color_Web [colorMenu=" + colorMenu + ", colorFilter=" + colorFilter + ", colorBody=" + colorBody
				+ ", colorText=" + colorText + "]";
	}
	
	
}
