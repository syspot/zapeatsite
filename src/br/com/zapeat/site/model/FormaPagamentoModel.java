package br.com.zapeat.site.model;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.Constantes;

public class FormaPagamentoModel {

	private Long id;

	private String descricao;
	
	private String imagem;

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getImagem() {
		return imagem;
	}
	
	public String getImagemView() {
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_FORMA_PAGAMENTO + imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public void setId(Long id) {
		this.id = id;
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
		FormaPagamentoModel other = (FormaPagamentoModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	

}
