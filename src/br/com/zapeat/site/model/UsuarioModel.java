package br.com.zapeat.site.model;

import br.com.topsys.util.TSStringUtil;
import br.com.topsys.util.TSUtil;

public class UsuarioModel {

	private Long id;

	private String nome;

	private String login;

	private String senha;

	private String email;

	private String confirmaSenha;

	private Boolean flagAtivo;
	
	private Boolean flagFacebook;
	
	private Boolean flagAceitouTermo;

	private String imagem;

	private String token;

	public UsuarioModel() {

	}
	
	public UsuarioModel(Long id) {
		this.id = id;
	}

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = TSUtil.tratarLong(id);
	}

	public String getNome() {

		if (!TSUtil.isEmpty(this.nome)) {

			this.nome = TSStringUtil.formatarNomeProprio(this.nome);
		}

		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Boolean getFlagAtivo() {
		return TSUtil.isEmpty(flagAtivo) ? false : flagAtivo;
	}

	public void setFlagAtivo(Boolean flagAtivo) {
		this.flagAtivo = flagAtivo;
	}

	public String getConfirmaSenha() {
		return confirmaSenha;
	}

	public void setConfirmaSenha(String confirmaSenha) {
		this.confirmaSenha = confirmaSenha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getToken() {
		return TSUtil.tratarString(token);
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Boolean getFlagFacebook() {
		return TSUtil.isEmpty(flagFacebook) ? false : flagFacebook;
	}

	public void setFlagFacebook(Boolean flagFacebook) {
		this.flagFacebook = flagFacebook;
	}

	public Boolean getFlagAceitouTermo() {
		return flagAceitouTermo;
	}

	public void setFlagAceitouTermo(Boolean flagAceitouTermo) {
		this.flagAceitouTermo = flagAceitouTermo;
	}

}
