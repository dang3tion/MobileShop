package model_beans;

public class Statictical {
	private String date;
	private int revenue;
	private int productSaled;
	private int sumAccess;

	public Statictical(String date, int revenue, int productSaled, int sumAccess) {
		super();
		this.date = date;
		this.revenue = revenue;
		this.productSaled = productSaled;
		this.sumAccess = sumAccess;
	}

	public Statictical() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getRevenue() {
		return revenue;
	}

	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}

	public int getProductSaled() {
		return productSaled;
	}

	public void setProductSaled(int productSaled) {
		this.productSaled = productSaled;
	}

	public int getSumAccess() {
		return sumAccess;
	}

	public void setSumAccess(int sumAccess) {
		this.sumAccess = sumAccess;
	}

	@Override
	public String toString() {
		return "Statictical [date=" + date + ", revenue=" + revenue + ", productSaled=" + productSaled + ", sumAccess="
				+ sumAccess + "]";
	}

}
