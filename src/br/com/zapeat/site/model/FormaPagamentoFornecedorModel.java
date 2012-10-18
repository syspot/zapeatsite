package br.com.zapeat.site.model;

public class FormaPagamentoFornecedorModel {
	
	private Long id;
	
	private FormaPagamentoModel formaPagamentoModel;
	
	private FornecedorModel fornecedorModel;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public FormaPagamentoModel getFormaPagamentoModel() {
		return formaPagamentoModel;
	}

	public void setFormaPagamentoModel(FormaPagamentoModel formaPagamentoModel) {
		this.formaPagamentoModel = formaPagamentoModel;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

}
