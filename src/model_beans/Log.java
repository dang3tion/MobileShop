package model_beans;

public class Log {
	private String date;
	private String name;

	private String content;
	private String detail;

	public Log(String date, String name, String content, String detail) {
		super();
		this.date = date;
		this.name = name;
		this.content = content;
		this.detail = detail;
	}

	public Log() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "Log [date=" + date + ", name=" + name + ", content=" + content + ", detail=" + detail + "]";
	}

}
