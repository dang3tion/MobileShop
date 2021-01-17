package model_beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AttributeClass implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;

	public AttributeClass(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public AttributeClass() {
		super();
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

	@Override
	public String toString() {
		return "AttributeClass id=" + id + ", name=" + name + "";
	}

}
