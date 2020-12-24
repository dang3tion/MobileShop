package model_beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Attribute {
	private String name;
	private Map<String, List<String>> lstAtribute = new HashMap<String, List<String>>();

	public Attribute(String name, Map<String, List<String>> lstAtribute) {
		super();
		this.name = name;
		this.lstAtribute = lstAtribute;
	}

	public Attribute() {
		super();
	}

	public void addAttribute(String name, String value) {
		if (lstAtribute.containsKey(name)) {
			lstAtribute.get(name).add(value);

		} else {
			ArrayList<String> lst = new ArrayList<String>();
			lst.add(value);
			lstAtribute.put(name, lst);
		}

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Map<String, List<String>> getLstAtribute() {
		return lstAtribute;
	}

	public void setLstAtribute(Map<String, List<String>> lstAtribute) {
		this.lstAtribute = lstAtribute;
	}

}
