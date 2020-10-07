package pojo;

public class Conditions {
	private String findname;
	private String findsex;

	public Conditions() {

	}

	public String getFindname() {
		return findname;
	}

	public void setFindname(String findname) {
		this.findname = findname;
	}

	public String getFindsex() {
		return findsex;
	}

	public void setFindsex(String findsex) {
		this.findsex = findsex;
	}


	public Conditions(String findname, String findsex) {
		this.findname = findname;
		this.findsex = findsex;
	}

}
