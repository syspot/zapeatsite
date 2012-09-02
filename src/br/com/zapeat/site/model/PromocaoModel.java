package br.com.zapeat.site.model;

import java.util.Date;
import java.util.List;

import br.com.topsys.util.TSUtil;


public class PromocaoModel {

	private Long id;

	private TipoPromocaoModel tipoPromocaoModel;
	
	private FornecedorModel fornecedorModel;
	
	private String titulo;
	
	private String descricao;
	
	private Date inicio;
	
	private Date fim;
	
	private Double precoOriginal;
	
	private Double precoPromocional;
	
	private List<ImagemPromocaoModel> imagensPromocoes;
	
	private Integer indicacoes;

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TipoPromocaoModel getTipoPromocaoModel() {
		return tipoPromocaoModel;
	}

	public void setTipoPromocaoModel(TipoPromocaoModel tipoPromocaoModel) {
		this.tipoPromocaoModel = tipoPromocaoModel;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getInicio() {
		return inicio;
	}

	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}

	public Date getFim() {
		return fim;
	}

	public void setFim(Date fim) {
		this.fim = fim;
	}

	public Double getPrecoOriginal() {
		return precoOriginal;
	}

	public void setPrecoOriginal(Double precoOriginal) {
		this.precoOriginal = precoOriginal;
	}

	public Double getPrecoPromocional() {
		return precoPromocional;
	}

	public void setPrecoPromocional(Double precoPromocional) {
		this.precoPromocional = precoPromocional;
	}

	public List<ImagemPromocaoModel> getImagensPromocoes() {
		return imagensPromocoes;
	}

	public void setImagensPromocoes(List<ImagemPromocaoModel> imagensPromocoes) {
		this.imagensPromocoes = imagensPromocoes;
	}

	public Integer getIndicacoes() {
		return indicacoes;
	}

	public void setIndicacoes(Integer indicacoes) {
		this.indicacoes = indicacoes;
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
		PromocaoModel other = (PromocaoModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
