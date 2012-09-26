package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.util.Constantes;

@ManagedBean(name = "logoutFaces")
public class LogoutFaces {

	public LogoutFaces() {
		
		this.logout();
	}

	@SuppressWarnings("static-access")
	public String logout() {

		TSFacesUtil.removeObjectInSession(Constantes.USUARIO_LOGADO);
		
		this.removerCookieFaceBoook();
		
		TSFacesUtil.getFacesContext().getCurrentInstance().getExternalContext().invalidateSession();
		
		try {

			TSFacesUtil.getFacesContext().getCurrentInstance().getExternalContext().redirect("index.jsf");

		} catch (IOException e) {

			e.printStackTrace();
		}

		return null;
	}

	@SuppressWarnings("static-access")
	private void removerCookieFaceBoook() {

		Map<String, Object> props = new HashMap<String, Object>();

		props.put("maxAge", 0);

		TSFacesUtil.getFacesContext().getCurrentInstance().getExternalContext().addResponseCookie("c_user", "", props);
	}

}
