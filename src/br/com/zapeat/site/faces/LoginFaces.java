package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;

@SessionScoped
@ManagedBean(name = "loginFaces")
public class LoginFaces extends TSMainFaces {

	private UsuarioModel usuarioModel;
	private UsuarioDAO usuarioDAO;

	public LoginFaces() {

		this.initDAO();
		this.initObejtos();

	}

	private void initDAO() {

		this.usuarioDAO = new UsuarioDAO();
	}

	private void initObejtos() {

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

	public String autenticar() {

		if (this.validaCampos()) {

			UsuarioModel model = this.usuarioDAO.obter(this.usuarioModel);

			if (!TSUtil.isEmpty(model.getId()) && model.getSenha().equals(TSCryptoUtil.gerarHash(this.usuarioModel.getSenha(), "MD5"))) {

				TSFacesUtil.addObjectInSession(br.com.zapeat.site.util.Constantes.USUARIO_LOGADO, model);

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

	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}

	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}

}
