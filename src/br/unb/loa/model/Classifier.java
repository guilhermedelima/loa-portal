package br.unb.loa.model;

import br.unb.loa.util.FormatterUtil;

public class Classifier{
	
	private String label;
	private String code;
	private int year;
	private double valueProjetoLei;
	private double valueDotacaoInicial;
	private double valueLeiMaisCredito;
	private double valueLiquidado;
	private double valueEmpenhado;
	private double valuePago;
	private ClassifierType type;
	
	public Classifier(){ }

	public Classifier(String label, String code, int year,
			double valueProjetoLei, double valueDotacaoInicial,
			double valueLeiMaisCredito, double valueLiquidado,
			double valueEmpenhado, double valuePago, ClassifierType type) {
		this.label = label;
		this.code = code;
		this.year = year;
		this.valueProjetoLei = valueProjetoLei;
		this.valueDotacaoInicial = valueDotacaoInicial;
		this.valueLeiMaisCredito = valueLeiMaisCredito;
		this.valueLiquidado = valueLiquidado;
		this.valueEmpenhado = valueEmpenhado;
		this.valuePago = valuePago;
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

	public String getValueProjetoLei() {
		return FormatterUtil.convertDouble(valueProjetoLei);
	}

	public void setValueProjetoLei(double valueProjetoLei) {
		this.valueProjetoLei = valueProjetoLei;
	}

	public String getValueDotacaoInicial() {
		return FormatterUtil.convertDouble(valueDotacaoInicial);
	}

	public void setValueDotacaoInicial(double valueDotacaoInicial) {
		this.valueDotacaoInicial = valueDotacaoInicial;
	}

	public String getValueLeiMaisCredito() {
		return FormatterUtil.convertDouble(valueLeiMaisCredito);
	}

	public void setValueLeiMaisCredito(double valueLeiMaisCredito) {
		this.valueLeiMaisCredito = valueLeiMaisCredito;
	}

	public String getValueLiquidado() {
		return FormatterUtil.convertDouble(valueLiquidado);
	}

	public void setValueLiquidado(double valueLiquidado) {
		this.valueLiquidado = valueLiquidado;
	}

	public String getValueEmpenhado() {
		return FormatterUtil.convertDouble(valueEmpenhado);
	}

	public void setValueEmpenhado(double valueEmpenhado) {
		this.valueEmpenhado = valueEmpenhado;
	}

	public String getValuePago() {
		return FormatterUtil.convertDouble(valuePago);
	}

	public void setValuePago(double valuePago) {
		this.valuePago = valuePago;
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
