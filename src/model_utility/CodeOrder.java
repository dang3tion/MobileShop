package model_utility;

public class CodeOrder {
	private String codeOder;

	public String getCode() {
		return codeOder;
	}

	public CodeOrder() {
		this.codeOder = ""+ randomCode();
	}

	private int randomCode() {
		return (int) ((Math.random() * (99999999 - 10000000)) + 10000000);
	}
}
