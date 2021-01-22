package model_beans;

public class Color_product {
	private String idColor;
	private String typeColor;

	public Color_product(String idColor, String typeColor) {
		super();
		this.idColor = idColor;
		this.typeColor = typeColor;
	}

	public Color_product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getIdColor() {
		return idColor;
	}

	public void setIdColor(String idColor) {
		this.idColor = idColor;
	}

	public String getTypeColor() {
		return typeColor;
	}

	public void setTypeColor(String typeColor) {
		this.typeColor = typeColor;
	}

	@Override
	public String toString() {
		return "Color_product [idColor=" + idColor + ", typeColor=" + typeColor + "]";
	}

}
