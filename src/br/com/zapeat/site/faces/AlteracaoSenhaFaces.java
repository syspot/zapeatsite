package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.constant.TSConstant;
import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean(name = "alteracaoSenhaFaces")
public class AlteracaoSenhaFaces extends TSMainFaces{

	
	private UsuarioModel usuarioModel;
	
	
	public AlteracaoSenhaFaces() {
		
		usuarioModel = new UsuarioModel();

		String token = TSFacesUtil.getRequestParameter("token");

		if (!TSUtil.isEmpty(token)) {

			UsuarioDAO usuarioDAO = new UsuarioDAO();

			usuarioModel.setToken(token);

			usuarioModel = usuarioDAO.getByToken(usuarioModel);

			if (TSUtil.isEmpty(usuarioModel)) {
				ZapeatUtil.redirect();
			}
			
		} else{
			ZapeatUtil.redirect();
		}

	}

	private boolean validaCampos(){

		boolean erro = false;
		
		if(TSUtil.isEmpty(usuarioModel.getSenha())){
			super.addErrorMessage("Senha: Campo obrigatório");
			erro = true;
		}
		
		if(TSUtil.isEmpty(usuarioModel.getConfirmaSenha())){
			super.addErrorMessage("Confirma senha: Campo obrigatório");
			erro = true;
		}
		
		if(!usuarioModel.getSenha().equals(usuarioModel.getConfirmaSenha())){
			super.addErrorMessage("Senhas não conferem");
			erro = true;
		}
		
		return erro;
	}
	
	public String alterarSenha() throws TSApplicationException{
	
		if(validaCampos()){
			return null;
		}
		
		this.usuarioModel.setSenha(TSCryptoUtil.gerarHash(this.usuarioModel.getSenha(), TSConstant.CRIPTOGRAFIA_MD5));
		
		new UsuarioDAO().alterarSenha(this.usuarioModel);

		super.addInfoMessage("Senha alterada com sucesso");
		
		return "homeMessage";
		
	}

	public UsuarioModel getUsuarioModel() {
		return usuarioModel;
	}


	public void setUsuarioModel(UsuarioModel usuarioModel) {
		this.usuarioModel = usuarioModel;
	}

}
