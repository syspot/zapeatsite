package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.FormaPagamentoDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.ImagemFornecedorDAO;
import br.com.zapeat.site.model.ComentarioFornecedorModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.ImagemFornecedorModel;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class EstabelecimentoFaces extends CarregaPromocaoFaces {

	private FornecedorModel fornecedorModel;
	private List<ImagemFornecedorModel> fotosEstabelecimento;
	private ComentarioModel ranking;
	private ComentarioFornecedorModel comentarioFornecedorModel;
	private UsuarioModel usuarioLogado;
	

	public EstabelecimentoFaces() {
		
		String fornecedorId = TSFacesUtil.getRequestParameter("id");

		if (!TSUtil.isEmpty(fornecedorId) && TSUtil.isNumeric(fornecedorId)) {

			this.fornecedorModel = new FornecedorDAO().obter(new FornecedorModel(new Long(fornecedorId)));

			if (!TSUtil.isEmpty(this.fornecedorModel) && !TSUtil.isEmpty(this.fornecedorModel.getId())) {

				this.fotosEstabelecimento = new ImagemFornecedorDAO().pesquisar(this.fornecedorModel);

				this.ranking = new ComentarioDAO().rankingEstabelecimento(this.fornecedorModel);

				this.fornecedorModel.setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.fornecedorModel));
				
				this.fornecedorModel.setComentarios(new ComentarioDAO().pesquisarComentarios(this.fornecedorModel));
				
				this.comentarioFornecedorModel = new ComentarioFornecedorModel();
				
				this.comentarioFornecedorModel.setFornecedorModel(this.fornecedorModel);
				
				Long idUsuarioLogado = (Long) TSFacesUtil.getObjectInSession(Constantes.ID_USUARIO_LOGADO);
				
				this.usuarioLogado = new UsuarioModel(idUsuarioLogado);
				
				this.comentarioFornecedorModel.setUsuarioModel(this.usuarioLogado);

			} else {

				this.redirect();
			}

		} else {

			this.redirect();
		}
		
	}

	private void redirect() {

		try {

			TSFacesUtil.getFacesContext().getExternalContext().redirect("index.jsf");

		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	public String comentar() throws TSApplicationException{

		if(!TSUtil.isEmpty(this.usuarioLogado) && !TSUtil.isEmpty(this.usuarioLogado.getId())){
			
			new ComentarioDAO().comentar(comentarioFornecedorModel);
			
		} else{
			
			addErrorMessage("É necessário estar logado para realizar essa operação");
			
		}
		
		return null;
	}
	
	@Override
	protected Long getFornecedorId() {
		return ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));
	}

	public List<FornecedorModel> obterEstabelecimentosLateral() {
		return new FornecedorDAO().pesquisarHome((Long)TSFacesUtil.getObjectInSession("cidadeId"));
	}

	public List<ImagemFornecedorModel> getFotosEstabelecimento() {
		return fotosEstabelecimento;
	}

	public void setFotosEstabelecimento(List<ImagemFornecedorModel> fotosEstabelecimento) {
		this.fotosEstabelecimento = fotosEstabelecimento;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

	public ComentarioModel getRanking() {
		return ranking;
	}

	public void setRanking(ComentarioModel ranking) {
		this.ranking = ranking;
	}

	public ComentarioFornecedorModel getComentarioFornecedorModel() {
		return comentarioFornecedorModel;
	}

	public void setComentarioFornecedorModel(ComentarioFornecedorModel comentarioFornecedorModel) {
		this.comentarioFornecedorModel = comentarioFornecedorModel;
	}

	public UsuarioModel getUsuarioLogado() {
		return usuarioLogado;
	}

	public void setUsuarioLogado(UsuarioModel usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}

}
