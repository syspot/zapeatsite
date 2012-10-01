package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.apache.myfaces.custom.fileupload.UploadedFile;

import br.com.topsys.constant.TSConstant;
import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.file.TSFile;
import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSStringUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;

@ViewScoped
@ManagedBean(name = "cadastroFaces")
public class CadastroFaces extends TSMainFaces {

	private UsuarioModel usuarioModel;
	private UsuarioDAO usuarioDAO;
	private UploadedFile arquivo;

	public CadastroFaces() {

		this.initDAO();

		this.initObjetos();

	}

	private void initObjetos() {

		this.setUsuarioModel(new UsuarioModel());
		
		this.getUsuarioModel().setFlagAtivo(Boolean.TRUE);
	}

	private void initDAO() {

		this.setUsuarioDAO(new UsuarioDAO());
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

			if (!this.existeEmail()) {

				this.criarArquivoDiretorio();

				this.usuarioModel.setSenha(TSCryptoUtil.gerarHash(this.usuarioModel.getSenha(), TSConstant.CRIPTOGRAFIA_MD5));

				UsuarioModel model = this.usuarioDAO.inserir(this.usuarioModel);

				super.setDefaultMessage(true);
				
				model.setNome(TSStringUtil.formatarNomeProprio(model.getNome()));

				TSFacesUtil.addObjectInSession(Constantes.USUARIO_LOGADO, model);

				this.initObjetos();
				
				super.setDefaultMessage(true);
				
				super.addObjectInRequest("cadastro_sucesso",true);

				return Constantes.INDEX;

			} else {
				
			    super.addObjectInRequest("cadastro_sucesso",false);
			    
				super.addErrorMessage("Esse e-mail já existe.");
			}

		}

		return null;
	}

	private boolean existeEmail() {

		UsuarioModel model = this.usuarioDAO.obter(this.usuarioModel);

		if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

			return true;
		}

		return false;

	}

	private void criarArquivoDiretorio() {

		try {

			if (!TSUtil.isEmpty(this.getArquivo())) {

				this.usuarioModel.setImagem(TSUtil.gerarId() + TSFile.obterExtensaoArquivo(this.getArquivo().getName()));

				TSFile.inputStreamToFile(this.getArquivo().getInputStream(), Constantes.PASTA_UPLOAD + this.usuarioModel.getImagem());

			}

		} catch (Exception e) {

			TSFacesUtil.addErrorMessage("Erro ao enviar o arquivo!");

			e.printStackTrace();

		}

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

	public UploadedFile getArquivo() {
		return arquivo;
	}

	public void setArquivo(UploadedFile arquivo) {
		this.arquivo = arquivo;
	}

}
