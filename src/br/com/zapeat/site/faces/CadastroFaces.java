package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.constant.TSConstant;
import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSStringUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
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

		if (this.usuarioModel.getFlagAceitouTermo()) {

			validado = false;

			super.addErrorMessage("É necessário aceitar o termo.");
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

				this.usuarioModel.setFlagAceitouTermo(Boolean.TRUE);

				this.usuarioModel.setSenha(TSCryptoUtil.gerarHash(this.usuarioModel.getSenha(), TSConstant.CRIPTOGRAFIA_MD5));

				model = usuarioDAO.inserir(this.usuarioModel);

				model.setNome(TSStringUtil.formatarNomeProprio(model.getNome()));

				this.usuarioModel = new UsuarioModel();

				super.addInfoMessage("Para efetivar seu cadastro é necessário acessar o e-mail informado e clicar no link de confirmação.");
				
				this.enviarEmail(model, "Para confirmar seu cadastro no site ZAPEAT clique <a href=\"" + Constantes.URL_APLICACAO + "confirmacao.jsf?cidade=" + TSFacesUtil.getObjectInSession("cidadeEstado") + "&token=", "Zapeat - Confirmação de Cadastro");

			} else {

				super.addErrorMessage("Esse e-mail já existe.");
			}

		}

		return null;
	}
	
	public String recuperarSenha(){
		
		if(TSUtil.isEmpty(usuarioModel.getEmail())){
			super.addErrorMessage("Email: Campo obrigatório");
			return null;
		}
		
		this.usuarioModel = new UsuarioDAO().obter(usuarioModel);
		
		if(TSUtil.isEmpty(usuarioModel)){
			super.addErrorMessage("Usuário não localizado na base de dados");
			return null;
		}
		
		String msg1 = "Você está recebendo este e-mail pois clicou no link 'esqueci senha' no site do zapeat. <br/> Caso não tenha feito isso, favor desconsiderar este e-mail. <br/> Caso contrário clique <a href=\"" + Constantes.URL_APLICACAO + "redefinirSenha.jsf?cidade=" + TSFacesUtil.getObjectInSession("cidadeEstado") + "&token=";
		
		this.enviarEmail(usuarioModel, msg1, "Zapeat - Alteração de Senha");
		
		super.addInfoMessage("As instruções para recuperação de senha foram enviadas para o email");
		
		return null;
		
	}

	private void enviarEmail(UsuarioModel model, String msg1, String msg2) {

		StringBuilder corpo = new StringBuilder();

		String marca = Constantes.URL_SITE_PRODUCAO + "img/marca.png";

		corpo.append("<img src='" + marca + "'/>");

		corpo.append("<br><br><br>");

		corpo.append("Olá " + model.getNome());

		corpo.append("<br>");

		try {

			corpo.append(msg1)

			.append(model.getToken())

			.append("\"> aqui </a>");

			EnviarEmail.enviar(Constantes.ZAPEAT_GMAIL, model.getEmail(), msg2, corpo.toString());

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public UsuarioModel getUsuarioModel() {
		return usuarioModel;
	}

	public void setUsuarioModel(UsuarioModel usuarioModel) {
		this.usuarioModel = usuarioModel;
	}

}
