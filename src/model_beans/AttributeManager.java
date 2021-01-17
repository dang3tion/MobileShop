package model_beans;

import java.io.Serializable;

public class AttributeManager implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String type;
	private String title;

	private AttributeClass classAttribute;

	public AttributeManager(String id, String type, String title, AttributeClass classAttribute) {
		super();
		this.id = id;
		this.type = type;
		this.title = title;
		this.classAttribute = classAttribute;
	}

	public AttributeClass getClassAttribute() {
		return classAttribute;
	}

	public void setClassAttribute(AttributeClass classAttribute) {
		this.classAttribute = classAttribute;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public AttributeManager() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "AttributeManager [id=" + id + ", type=" + type + ", title=" + title + ", classAttribute="
				+ classAttribute + "]";
	}

}
