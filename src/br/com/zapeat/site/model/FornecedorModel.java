package br.com.zapeat.site.model;

import br.com.topsys.util.TSUtil;

public class FornecedorModel {

	private Long id;

	private String razaoSocial;

	private String cnpj;

	private String nomeFantasia;

	private String cep;

	private String logradouro;

	private String numero;

	private String bairro;

	private Integer latitude;

	private Integer longitude;

	private String logoMarca;

	private Boolean flagAtivo;

	private String descricao;

	private String horariosFuncionamento;

	private String twitter;

	private String facebook;

	private CidadeModel cidadeModel;
	
	private String imagem;
	
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

	public Integer getLatitude() {
		return latitude;
	}

	public void setLatitude(Integer latitude) {
		this.latitude = latitude;
	}

	public Integer getLongitude() {
		return longitude;
	}

	public void setLongitude(Integer longitude) {
		this.longitude = longitude;
	}

	public String getLogoMarca() {
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
	
	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
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

}
