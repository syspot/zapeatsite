package br.com.zapeat.site.model;

import java.util.Date;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.Constantes;

public class BannerModel {

	private Long id;

	private TipoBannerModel tipoBannerModel;

	private FornecedorModel fornecedorModel;

	private String imagem;

	private Date inicio;

	private Date fim;

	private Integer taxaPrioridade;

	private Integer qdoCliques;

	private Boolean flagAtivo;
	
	private String url;

	public BannerModel() {

	}

	public BannerModel(FornecedorModel fornecedorModel) {

		this.fornecedorModel = fornecedorModel;
	}

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TipoBannerModel getTipoBannerModel() {
		return tipoBannerModel;
	}

	public void setTipoBannerModel(TipoBannerModel tipoBannerModel) {
		this.tipoBannerModel = tipoBannerModel;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
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

	public Integer getTaxaPrioridade() {
		return TSUtil.tratarInteger(taxaPrioridade);
	}

	public void setTaxaPrioridade(Integer taxaPrioridade) {
		this.taxaPrioridade = taxaPrioridade;
	}

	public Integer getQdoCliques() {
		return qdoCliques;
	}

	public void setQdoCliques(Integer qdoCliques) {
		this.qdoCliques = qdoCliques;
	}

	public Boolean getFlagAtivo() {
		return flagAtivo;
	}

	public void setFlagAtivo(Boolean flagAtivo) {
		this.flagAtivo = flagAtivo;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImagemLateralView(){
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_BANNER_LATERAL + this.imagem;
	}
	
	public String getImagemSuperiorGrandeView(){
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_BANNER_SUPERIOR_GRANDE + this.imagem;
	}
	public String getImagemSuperiorPequenoView(){
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_BANNER_SUPERIOR_PEQUENO + this.imagem;
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
		BannerModel other = (BannerModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
