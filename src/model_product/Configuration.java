package model_product;

public class Configuration {
	private String idConfi;
	private String titleConfi;
	private String contentConfi;
	public Configuration(String idConfi, String titleConfi, String contentConfi) {
		super();
		this.idConfi = idConfi;
		this.titleConfi = titleConfi;
		this.contentConfi = contentConfi;
	}
	public Configuration() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getIdConfi() {
		return idConfi;
	}
	public void setIdConfi(String idConfi) {
		this.idConfi = idConfi;
	}
	public String getTitleConfi() {
		return titleConfi;
	}
	public void setTitleConfi(String titleConfi) {
		this.titleConfi = titleConfi;
	}
	public String getContentConfi() {
		return contentConfi;
	}
	public void setContentConfi(String contentConfi) {
		this.contentConfi = contentConfi;
	}
	@Override
	public String toString() {
		return "Configuration [idConfi=" + idConfi + ", titleConfi=" + titleConfi + ", contentConfi=" + contentConfi
				+ "]";
	}
	
	
	
}
