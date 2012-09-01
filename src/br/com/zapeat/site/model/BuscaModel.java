package br.com.zapeat.site.model;

public class BuscaModel {

	private String titulo;
	
	private String nome;
	
	private String descricao;
	
	private Integer tipo;
	
	private Categoria categoria;
	
	private String telefone;
	
	private String site;
	
	private Integer qtdIndicacoes;

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

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
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

	public Integer getQtdIndicacoes() {
		return qtdIndicacoes;
	}

	public void setQtdIndicacoes(Integer qtdIndicacoes) {
		this.qtdIndicacoes = qtdIndicacoes;
	}

}
