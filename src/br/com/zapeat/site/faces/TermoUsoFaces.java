package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean(name = "termoUsoFaces")
public class TermoUsoFaces {

	private String id;
	private Boolean flagAceito;

	public TermoUsoFaces() {

		String id = TSFacesUtil.getRequestParameter("token");

		if (!TSUtil.isEmpty(id)) {

			this.id = id;

			this.flagAceito = Boolean.FALSE;

		} else {

			ZapeatUtil.redirect();
		}

	}

	public String confirmarTermo() {

		if (this.flagAceito) {

			try {

				String tokenDescriptografado = TSCryptoUtil.desCriptografar(this.id);

				if (!TSUtil.isEmpty(tokenDescriptografado) && TSUtil.isNumeric(tokenDescriptografado)) {

					UsuarioModel model = new UsuarioModel();

					UsuarioDAO usuarioDAO = new UsuarioDAO();

					model.setId(new Long(tokenDescriptografado));

					model = usuarioDAO.getById(model);

					if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

						if (!model.getFlagAceitouTermo()) {

							model.setFlagAceitouTermo(Boolean.TRUE);

							usuarioDAO.alterarFlagTermo(model);

							TSFacesUtil.addObjectInSession(Constantes.ID_USUARIO_LOGADO, model.getId());
							TSFacesUtil.addObjectInSession(Constantes.NOME_USUARIO_LOGADO, model.getNome());

							TSFacesUtil.addObjectInSession(Constantes.LOGIN_APLICACAO, true);

							ZapeatUtil.redirect();
						}

					} else {

						TSFacesUtil.addErrorMessage("Token inválido.");
					}
				}

			} catch (Exception e) {

				e.printStackTrace();
			}

		} else {
			
			TSFacesUtil.addErrorMessage("É necessário aceitar o termo de uso.");
		}
		
		return null;

	}

	public Boolean getFlagAceito() {
		return flagAceito;
	}

	public void setFlagAceito(Boolean flagAceito) {
		this.flagAceito = flagAceito;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
