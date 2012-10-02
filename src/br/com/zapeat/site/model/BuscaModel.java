package br.com.zapeat.site.model;

import br.com.zapeat.site.util.Constantes;

public class BuscaModel {

	private Long id;
	
	private Integer numeroUnico;
	
	private String titulo;
	
	private String nome;
	
	private String descricao;
	
	private Integer tipo;
	
	private String categoria;
	
	private String telefone;
	
	private String site;
	
	private Integer indicacoes;
	
	private String imagem;
	
	private Double latitude;
	
	private Double longitude;

	public Integer getNumeroUnico() {
		return numeroUnico;
	}

	public void setNumeroUnico(Integer numeroUnico) {
		this.numeroUnico = numeroUnico;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public Integer getIndicacoes() {
		return indicacoes;
	}

	public void setIndicacoes(Integer indicacoes) {
		this.indicacoes = indicacoes;
	}

	public String getImagem() {
		return imagem;
	}
	
	public String getImagemView() {
		
		switch (tipo) {
			
			case 1: imagem = Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_PROMOCAO_THUMB + imagem; break; 
			case 2: imagem = Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_CARRO_CHEFE_THUMB + imagem; break; 
			case 3: imagem = Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_FORNECEDOR_LOGOMARCA + imagem; break; 

			default: break;

		}
		
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
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
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLink() {
		
		String link = "";
		
		switch (tipo) {
			
			case 1: link = "promocao.jsf?id=" + id; break; 
			case 2: link = "estabelecimento.jsf?id=" + id; break; 
			case 3: link = "estabelecimento.jsf?id=" + id; break; 

			default: break;

		}
		
		return link;
	}
	
	@Override
	public String toString() {
		
		StringBuilder retorno = new StringBuilder();
		
		retorno.append("['");
		retorno.append(tipo.equals(3) ? titulo : nome).append("', ");
		retorno.append(latitude).append(", ");
		retorno.append(longitude).append(", ");
		retorno.append(numeroUnico);
		retorno.append("]");
		
		return retorno.toString();
	}

}
