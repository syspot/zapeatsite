package br.com.zapeat.site.model;

import java.util.Date;

import br.com.topsys.util.TSUtil;

public class ComentarioModel {

	private Long id;

	private UsuarioModel usuarioModel;

	private FornecedorModel fornecedorModel;

	private String descricao;

	private Date dataCadastro;

	private Boolean flagIndicaAmbiente;

	private Boolean flagIndicaComida;

	private Long posicao;

	private Boolean flagNaoIndicaComida;

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UsuarioModel getUsuarioModel() {
		return usuarioModel;
	}

	public void setUsuarioModel(UsuarioModel usuarioModel) {
		this.usuarioModel = usuarioModel;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
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
		ComentarioModel other = (ComentarioModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public Long getPosicao() {
		return posicao;
	}

	public void setPosicao(Long posicao) {
		this.posicao = posicao;
	}

	public Boolean getFlagIndicaAmbiente() {
		return flagIndicaAmbiente;
	}

	public void setFlagIndicaAmbiente(Boolean flagIndicaAmbiente) {
		this.flagIndicaAmbiente = flagIndicaAmbiente;
	}

	public Boolean getFlagIndicaComida() {
		return flagIndicaComida;
	}

	public void setFlagIndicaComida(Boolean flagIndicaComida) {
		this.flagIndicaComida = flagIndicaComida;
	}

	public Boolean getFlagNaoIndicaComida() {
		return flagNaoIndicaComida;
	}

	public void setFlagNaoIndicaComida(Boolean flagNaoIndicaComida) {
		this.flagNaoIndicaComida = flagNaoIndicaComida;
	}

}
