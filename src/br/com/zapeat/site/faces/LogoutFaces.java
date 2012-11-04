package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean(name = "logoutFaces")
public class LogoutFaces {

	public LogoutFaces() {

		TSFacesUtil.removeObjectInSession(Constantes.ID_USUARIO_LOGADO);
		TSFacesUtil.removeObjectInSession(Constantes.NOME_USUARIO_LOGADO);
		
		TSFacesUtil.removeObjectInSession(Constantes.LOGIN_APLICACAO);
		
		TSFacesUtil.getRequest().getSession().invalidate();
		
		ZapeatUtil.redirect();
		
	}

}
