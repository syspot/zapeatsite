package br.com.zapeat.site.model;

import java.io.Serializable;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.Constantes;

@SuppressWarnings("serial")
public class FormaPagamentoModel implements Serializable {

	private Long id;

	private String descricao;

	private String imagem;

	private Boolean flagAtivo;

	private String imagemThumb25x18;

	public Long getId() {
		return id;
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

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Boolean getFlagAtivo() {
		return flagAtivo;
	}

	public void setFlagAtivo(Boolean flagAtivo) {
		this.flagAtivo = flagAtivo;
	}

	public String getImagemThumb25x18() {

		if (!TSUtil.isEmpty(this.imagem)) {

			this.imagemThumb25x18 = Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_FORMA_PAGAMENTO + this.imagem;
		}

		return imagemThumb25x18;
	}

	public void setImagemThumb25x18(String imagemThumb25x18) {
		this.imagemThumb25x18 = imagemThumb25x18;
	}

}
