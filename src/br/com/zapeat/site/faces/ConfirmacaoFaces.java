package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class ConfirmacaoFaces {

	public ConfirmacaoFaces() {

		String token = TSFacesUtil.getRequestParameter("token");

		if (!TSUtil.isEmpty(token)) {

			UsuarioModel model = new UsuarioModel();

			UsuarioDAO usuarioDAO = new UsuarioDAO();

			model.setToken(token);

			model = usuarioDAO.getByToken(model);

			if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

				model.setFlagAtivo(Boolean.TRUE);

				try {
					
					usuarioDAO.alterarStatus(model);
					
				} catch (TSApplicationException e) {
					
					e.printStackTrace();
					
				}

				TSFacesUtil.addObjectInSession(Constantes.ID_USUARIO_LOGADO, model.getId());
				TSFacesUtil.addObjectInSession(Constantes.NOME_USUARIO_LOGADO, model.getNome());
				TSFacesUtil.addObjectInSession(Constantes.LOGIN_APLICACAO, true);
			}

		}

		ZapeatUtil.redirect();
	}

}
