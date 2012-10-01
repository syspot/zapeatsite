package br.com.zapeat.site.model;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.Constantes;

public class FornecedorModel {

	private Long id;

	private String razaoSocial;

	private String cnpj;

	private String nomeFantasia;

	private String cep;

	private String logradouro;

	private String numero;

	private String bairro;

	private String site;

	private String telefone;

	private Double latitude;

	private Double longitude;

	private String logoMarca;

	private Boolean flagAtivo;

	private String descricao;

	private String horariosFuncionamento;

	private String twitter;

	private String facebook;

	private CidadeModel cidadeModel;

	private String imagemThumb;

	private CategoriaModel categoriaPrincipal;

	private Integer quantidadeIndicacoes;
	
	private String css;

	public FornecedorModel() {
	}

	public FornecedorModel(Long id) {
		this.id = id;
	}

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getSite() {
		
		if(!TSUtil.isEmpty(this.site) && !this.site.contains("http://")){
			
			this.site = "http://" + this.site;
		}
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getLogoMarca() {

		if (!TSUtil.isEmpty(this.logoMarca)) {
			
			this.logoMarca = Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_FORNECEDOR_LOGOMARCA + this.logoMarca;
		}

		return logoMarca;
	}

	public void setLogoMarca(String logoMarca) {
		this.logoMarca = logoMarca;
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

	public String getHorariosFuncionamento() {
		return horariosFuncionamento;
	}

	public void setHorariosFuncionamento(String horariosFuncionamento) {
		this.horariosFuncionamento = horariosFuncionamento;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public CidadeModel getCidadeModel() {
		return cidadeModel;
	}

	public void setCidadeModel(CidadeModel cidadeModel) {
		this.cidadeModel = cidadeModel;
	}

	public String getImagemThumb() {
		return imagemThumb;
	}

	public void setImagemThumb(String imagemThumb) {
		this.imagemThumb = imagemThumb;
	}

	public CategoriaModel getCategoriaPrincipal() {
		return categoriaPrincipal;
	}

	public void setCategoriaPrincipal(CategoriaModel categoriaPrincipal) {
		this.categoriaPrincipal = categoriaPrincipal;
	}
	
	public Integer getQuantidadeIndicacoes() {
		return quantidadeIndicacoes;
	}

	public void setQuantidadeIndicacoes(Integer quantidadeIndicacoes) {
		this.quantidadeIndicacoes = quantidadeIndicacoes;
	}

	public String getImagemThumbView() {
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_FORNECEDOR_THUMB + getImagemThumb();
	}
	
	public String getImagemFullView() {
		return Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_FORNECEDOR_FULL + getImagemThumb();
	}
	
	public String getLogoMarcaView() {
		return TSUtil.isEmpty(this.logoMarca) ? this.logoMarca : Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_FORNECEDOR_LOGOMARCA + this.logoMarca;
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
		FornecedorModel other = (FornecedorModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}
	
	@Override
	public String toString() {
		
		StringBuilder retorno = new StringBuilder();
		
		retorno.append("['");
		retorno.append(nomeFantasia).append("', ");
		retorno.append(latitude).append(", ");
		retorno.append(longitude).append(", ");
		retorno.append(1);
		retorno.append("]");
		
		return retorno.toString();
	}

}
