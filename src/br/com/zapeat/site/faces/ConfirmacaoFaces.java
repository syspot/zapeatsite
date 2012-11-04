package br.com.zapeat.site.faces;

import java.io.IOException;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;

@ManagedBean
public class ConfirmacaoFaces {

	public ConfirmacaoFaces() {

		String token = TSFacesUtil.getRequestParameter("token");

		if (!TSUtil.isEmpty(token)) {

			try {

				String tokenDescriptografado = TSCryptoUtil.desCriptografar(token);

				if (!TSUtil.isEmpty(tokenDescriptografado) && TSUtil.isNumeric(tokenDescriptografado)) {

					UsuarioModel model = new UsuarioModel();

					UsuarioDAO usuarioDAO = new UsuarioDAO();

					model.setId(new Long(tokenDescriptografado));

					model = usuarioDAO.getById(model);

					if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

						model.setFlagAtivo(Boolean.TRUE);

						usuarioDAO.alterarStatus(model);

						TSFacesUtil.addObjectInSession(Constantes.ID_USUARIO_LOGADO, model.getId());
						TSFacesUtil.addObjectInSession(Constantes.NOME_USUARIO_LOGADO, model.getNome());

						TSFacesUtil.addObjectInSession(Constantes.LOGIN_APLICACAO, true);
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			TSFacesUtil.getFacesContext().getExternalContext().redirect("");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
