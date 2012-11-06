package br.com.zapeat.site.faces;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class LoginFaces extends TSMainFaces {

	private UsuarioModel usuarioModel;

	public LoginFaces() {
		this.usuarioModel = new UsuarioModel();
	}

	private boolean validaCampos() {

		boolean validado = true;

		if (TSUtil.isEmpty(this.usuarioModel.getEmail())) {

			validado = false;

			super.addErrorMessage("E-mail: campo obrigatório.");

		} else if (!TSUtil.isEmailValid(this.usuarioModel.getEmail())) {

			validado = false;

			super.addErrorMessage("E-mail: campo inválido.");
		}

		if (TSUtil.isEmpty(this.usuarioModel.getSenha())) {

			validado = false;

			super.addErrorMessage("Senha: campo obrigatório.");
		}

		return validado;
	}

	public String autenticar() throws InvalidKeyException, UnsupportedEncodingException, NoSuchPaddingException, BadPaddingException, NoSuchAlgorithmException, IllegalBlockSizeException {

		if (this.validaCampos()) {

			UsuarioModel model = new UsuarioDAO().obter(this.usuarioModel);

			if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getSenha()) && model.getSenha().equals(TSCryptoUtil.gerarHash(this.usuarioModel.getSenha(), "MD5"))) {

				if (!model.getFlagAtivo()) {

					TSFacesUtil.addErrorMessage("Seu cadastro encontra-se inativo!");

				} else {

					if (!TSUtil.isEmpty(model.getFlagAceitouTermo()) && model.getFlagAceitouTermo()) {

						TSFacesUtil.addObjectInSession(Constantes.ID_USUARIO_LOGADO, model.getId());
						TSFacesUtil.addObjectInSession(Constantes.NOME_USUARIO_LOGADO, model.getNome());

						TSFacesUtil.addObjectInSession(Constantes.LOGIN_APLICACAO, true);

						ZapeatUtil.redirect();

					} else {

						ZapeatUtil.redirectTermoUso(TSCryptoUtil.criptografar(model.getId().toString()));
					}

				}

			} else {

				TSFacesUtil.addErrorMessage("Dados inválidos.");

			}
		}

		return null;
	}

	public UsuarioModel getUsuarioModel() {
		return usuarioModel;
	}

	public void setUsuarioModel(UsuarioModel usuarioModel) {
		this.usuarioModel = usuarioModel;
	}

}
