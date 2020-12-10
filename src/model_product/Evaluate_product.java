package model_product;

public class Evaluate_product {
	private int oneStar;
	private int twoStar;
	private int threeStar;
	private int fourStar;
	private int fiveStar;
	private int view;
	private int avgStar;
	public int getOneStar() {
		return oneStar;
	}
	public void setOneStar(int oneStar) {
		this.oneStar = oneStar;
	}
	public int getTwoStar() {
		return twoStar;
	}
	public void setTwoStar(int twoStar) {
		this.twoStar = twoStar;
	}
	public int getThreeStar() {
		return threeStar;
	}
	public void setThreeStar(int threeStar) {
		this.threeStar = threeStar;
	}
	public int getFourStar() {
		return fourStar;
	}
	public void setFourStar(int fourStar) {
		this.fourStar = fourStar;
	}
	public int getFiveStar() {
		return fiveStar;
	}
	public void setFiveStar(int fiveStar) {
		this.fiveStar = fiveStar;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getAvgStar() {
		return avgStar;
	}
	public void setAvgStar(int avgStar) {
		this.avgStar = avgStar;
	}
	public Evaluate_product(int oneStar, int twoStar, int threeStar, int fourStar, int fiveStar, int view,
			int avgStar) {
		super();
		this.oneStar = oneStar;
		this.twoStar = twoStar;
		this.threeStar = threeStar;
		this.fourStar = fourStar;
		this.fiveStar = fiveStar;
		this.view = view;
		this.avgStar = avgStar;
	}
	public Evaluate_product() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Evaluate_product [oneStar=" + oneStar + ", twoStar=" + twoStar + ", threeStar=" + threeStar
				+ ", fourStar=" + fourStar + ", fiveStar=" + fiveStar + ", view=" + view + ", avgStar=" + avgStar + "]";
	}
	
	
	
}
