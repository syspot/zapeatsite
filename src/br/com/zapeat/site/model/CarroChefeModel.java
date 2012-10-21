package br.com.zapeat.site.model;

import java.io.Serializable;
import java.util.List;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.Constantes;

@SuppressWarnings("serial")
public class CarroChefeModel implements Serializable {

	private Long id;

	private FornecedorModel fornecedorModel;

	private Boolean flagAtivo;

	private String descricao;

	private String titulo;

	private String imagem;
	
	private Integer numeroUnico;
	
	private List<ImagemCarroChefeModel> imagensCarroChefe;

	public CarroChefeModel() {

	}

	public CarroChefeModel(FornecedorModel fornecedorModel) {

		this.fornecedorModel = fornecedorModel;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

	public Boolean getFlagAtivo() {
		return flagAtivo;
	}

	public void setFlagAtivo(Boolean flagAtivo) {
		this.flagAtivo = flagAtivo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getImagemThumbView(){
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_CARRO_CHEFE_THUMB + this.imagem;
	}
	
	public String getImagemFullView() {
		return TSUtil.isEmpty(this.imagem) ? this.imagem : Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_CARRO_CHEFE_FULL + this.imagem;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	public Integer getNumeroUnico() {
		return numeroUnico;
	}

	public void setNumeroUnico(Integer numeroUnico) {
		this.numeroUnico = numeroUnico;
	}

	public List<ImagemCarroChefeModel> getImagensCarroChefe() {
		return imagensCarroChefe;
	}

	public void setImagensCarroChefe(List<ImagemCarroChefeModel> imagensCarroChefe) {
		this.imagensCarroChefe = imagensCarroChefe;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CarroChefeModel other = (CarroChefeModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return this.fornecedorModel.toString();
	}
}
