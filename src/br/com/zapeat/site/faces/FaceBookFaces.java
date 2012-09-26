package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.util.FacebookClient;

@ViewScoped
@ManagedBean(name = "faceBookFaces")
public class FaceBookFaces {
	
	private String id;
	private String nome;
	private String email;
	private String url;
	
	public FaceBookFaces() {
		
		this.url = FacebookClient.getLoginRedirectURL();

		//this.obterParametros();
	}

	public String obterParametros() {
		
		this.id = TSFacesUtil.getRequestParameter("faceId");
		this.nome = TSFacesUtil.getRequestParameter("faceNome");
		this.email = TSFacesUtil.getRequestParameter("faceEmail");
		
		if (!TSUtil.isEmpty(id)) {
			
			System.out.println(id);
		}
		if (!TSUtil.isEmpty(nome)) {

			System.out.println(nome);
		}
		if (!TSUtil.isEmpty(email)) {

			System.out.println(email);
		}
		
		return null;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
