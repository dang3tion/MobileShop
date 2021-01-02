package model_beans;

import java.util.HashMap;
import java.util.Map;

public class StarEvaluate {
	private String nameCus;
	private String dateEval;
	private String contentEval;
	private Map<Integer, Integer> stars = new HashMap<Integer, Integer>();
	private double avgStars;

	public StarEvaluate(String nameCus, String dateEval, String contentEval, Map<Integer, Integer> stars,
			double avgStars) {
		super();
		this.nameCus = nameCus;
		this.dateEval = dateEval;
		this.contentEval = contentEval;
		this.stars = stars;
		this.avgStars = avgStars;
	}

	public StarEvaluate() {
		super();
	}

	public String getNameCus() {
		return nameCus;
	}

	public void setNameCus(String nameCus) {
		this.nameCus = nameCus;
	}

	public String getDateEval() {
		return dateEval;
	}

	public void setDateEval(String dateEval) {
		this.dateEval = dateEval;
	}

	public String getContentEval() {
		return contentEval;
	}

	public void setContentEval(String contentEval) {
		this.contentEval = contentEval;
	}

	public Map<Integer, Integer> getStars() {
		return stars;
	}

	public void setStars(Map<Integer, Integer> stars) {
		this.stars = stars;
	}

	public double getAvgStars() {
		return avgStars;
	}

	public void setAvgStars(double avgStars) {
		this.avgStars = avgStars;
	}

}
