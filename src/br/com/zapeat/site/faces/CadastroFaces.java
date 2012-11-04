package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.constant.TSConstant;
import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSStringUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.EnviarEmail;


@ManagedBean
public class CadastroFaces extends TSMainFaces {

	private UsuarioModel usuarioModel;

	public CadastroFaces() {

		this.usuarioModel = new UsuarioModel();

	}

	private boolean validaCampos() {

		boolean validado = true;

		if (TSUtil.isEmpty(this.usuarioModel.getNome())) {

			validado = false;

			super.addErrorMessage("Nome: campo obrigatório.");
		}

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

	@Override
	protected String insert() throws TSApplicationException {

		super.setClearFields(false);

		super.setDefaultMessage(false);
		
		if (this.validaCampos()) {
			
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			
			UsuarioModel model = usuarioDAO.obter(this.usuarioModel);

			if (TSUtil.isEmpty(model)) {

				this.usuarioModel.setSenha(TSCryptoUtil.gerarHash(this.usuarioModel.getSenha(), TSConstant.CRIPTOGRAFIA_MD5));

				model = usuarioDAO.inserir(this.usuarioModel);

				model.setNome(TSStringUtil.formatarNomeProprio(model.getNome()));
				
				this.enviarEmail(model);
				
				this.usuarioModel = new UsuarioModel();

				super.addInfoMessage("Para efetivar seu cadastro é necessário acessar o e-mail informado e clicar no link de confirmação.");

			} else {

				super.addErrorMessage("Esse e-mail já existe.");
			}

		}

		return null;
	}
	
	private void enviarEmail(UsuarioModel model){
		
		StringBuilder corpo = new StringBuilder();
		
		String marca = Constantes.URL_APLICACAO + "img/marca.png";
		
		corpo.append("<img src="+ marca +"/>");
		
		corpo.append("<br><br><br>");

		corpo.append("Olá " + model.getNome());

		corpo.append("<br>");

		corpo.append("Para confirmar seu cadastro no site ZAPEAT clique no link abaixo:");

		corpo.append("<br><br>");

		try {
			
			corpo.append(Constantes.URL_APLICACAO + "confirmacao.jsf?token="+ TSCryptoUtil.criptografar(model.getId().toString()) + "");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		EnviarEmail.enviar(Constantes.ZAPEAT_GMAIL, model.getEmail(), "Zapeat - Confirmação de Cadastro", corpo.toString());
	}

	public UsuarioModel getUsuarioModel() {
		return usuarioModel;
	}

	public void setUsuarioModel(UsuarioModel usuarioModel) {
		this.usuarioModel = usuarioModel;
	}

}
