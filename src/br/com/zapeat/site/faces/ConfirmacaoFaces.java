package br.com.zapeat.site.faces;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;

@RequestScoped
@ManagedBean(name = "confirmacaoFaces")
public class ConfirmacaoFaces extends TSMainFaces {

	public ConfirmacaoFaces() {

		this.confirmar();
	}

	private void confirmar() {

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

			} catch (InvalidKeyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (BadPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalBlockSizeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (TSApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		this.redirect();

	}

	private void redirect() {

		try {

			TSFacesUtil.getFacesContext().getExternalContext().redirect("index.jsf");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
