package model_beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Attribute implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private Map<AttributeManager, List<String>> lstAtribute = new HashMap<AttributeManager, List<String>>();

	public Attribute(String id, String name, Map<AttributeManager, List<String>> lstAtribute) {
		super();
		this.id = id;
		this.name = name;
		this.lstAtribute = lstAtribute;
	}

	public Attribute() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void addAttribute(AttributeManager key, String value) {
		int count = 0;
		for (AttributeManager a : lstAtribute.keySet()) {
			if (a.getId().trim().equals(key.getId().trim())) {
				count++;
				lstAtribute.get(a).add(value);
				break;
			}
		}
		if (count == 0) {
			ArrayList<String> lst = new ArrayList<String>();
			lst.add(value);
			lstAtribute.put(key, lst);
		}

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Map<AttributeManager, List<String>> getLstAtribute() {
		return lstAtribute;
	}

	public void setLstAtribute(Map<AttributeManager, List<String>> lstAtribute) {
		this.lstAtribute = lstAtribute;
	}

}
