package br.unb.loa.model;


public class Classifier{
	
	private String label;
	private String code;
	private int year;
	private ClassifierType type;
	
	public Classifier(){ }

	public Classifier(String label, String code, int year, ClassifierType type) {
		this.label = label;
		this.code = code;
		this.year = year;
		this.type = type;
	}
	
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

		public ClassifierType getType() {
		return type;
	}

	public void setType(ClassifierType type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return type.toString() + " - "+code+"/"+label;
	}
}
