package br.com.zapeat.site.faces;

import java.io.IOException;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.util.Constantes;

@ManagedBean(name = "logoutFaces")
public class LogoutFaces {

	public LogoutFaces() {

		this.logout();
	}

	public String logout() {

		TSFacesUtil.removeObjectInSession(Constantes.ID_USUARIO_LOGADO);
		TSFacesUtil.removeObjectInSession(Constantes.NOME_USUARIO_LOGADO);

		TSFacesUtil.removeObjectInSession(Constantes.LOGIN_APLICACAO);

		TSFacesUtil.getRequest().getSession().invalidate();

		try {
			
			TSFacesUtil.getFacesContext().getExternalContext().redirect("index.jsf?cidade=" + TSFacesUtil.getRequestParameter("cidade"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
