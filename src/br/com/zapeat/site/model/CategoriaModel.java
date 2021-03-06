package br.com.zapeat.site.model;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.Constantes;

public class CategoriaModel {

	private Long id;

	private String descricao;

	private Boolean flagAtivo;
	
	private Boolean flagDestaque;
	
	private String imagem;
	
	private String css;
	
	public CategoriaModel() {

	}
	
	public CategoriaModel(Long id) {
		this.id = id;
	}
	
	public CategoriaModel(String descricao, String css) {
		this.descricao = descricao;
		this.css = css;
	}

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Boolean getFlagAtivo() {
		return flagAtivo;
	}

	public void setFlagAtivo(Boolean flagAtivo) {
		this.flagAtivo = flagAtivo;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	
	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
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
		CategoriaModel other = (CategoriaModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public Boolean getFlagDestaque() {
		return flagDestaque;
	}

	public void setFlagDestaque(Boolean flagDestaque) {
		this.flagDestaque = flagDestaque;
	}

	public String getImagemView() {
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_CATEGORIA + getImagem();
	}


}
