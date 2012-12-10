package br.com.zapeat.site.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ImagemFornecedorModel extends ImagemModel implements Serializable {

	private FornecedorModel fornecedorModel;

	private String css;

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

}
