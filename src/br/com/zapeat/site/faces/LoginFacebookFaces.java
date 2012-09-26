package br.com.zapeat.site.faces;

import java.io.IOException;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.model.Usuario;
import br.com.zapeat.site.util.FacebookClient;

@ManagedBean(name = "loginFacebookFaces")
@SessionScoped
public class LoginFacebookFaces {

	private String login;
	private String senha;
	private Usuario usuario;
	private String url;
	
	public LoginFacebookFaces() {
		this.url = this.conectarComFace();
		
		System.out.println(this.url);
	}

	public String conectarComFace() {
		return FacebookClient.getLoginRedirectURL();
	}
	
	@SuppressWarnings("static-access")
	public String logout(){
		
		TSFacesUtil.getFacesContext().getCurrentInstance().getExternalContext().invalidateSession();
		
		try {
			TSFacesUtil.getFacesContext().getCurrentInstance().getExternalContext().redirect("index.jsf");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  	
		return null;
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

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
