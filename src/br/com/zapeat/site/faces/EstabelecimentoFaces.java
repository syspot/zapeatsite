package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.FormaPagamentoDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.ImagemFornecedorDAO;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.ComentarioFornecedorModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class EstabelecimentoFaces extends CarregaPromocaoFaces {

	private FornecedorModel fornecedorModel;
	private ComentarioModel ranking;
	private ComentarioFornecedorModel comentarioFornecedorModel;
	private UsuarioModel usuarioLogado;

	public EstabelecimentoFaces() {
		
		this.carregaDados();
		
		this.processarIndicacao();
		
	}
	
	private void processarIndicacao(){
		
		String indicacao = super.getRequestParameter("indicacao");
		
		if(!TSUtil.isEmpty(indicacao)){
			
			if(indicacao.equals("true")){
				this.indicar();
			} else if(indicacao.equals("false")){
				this.naoIndicar();
			}
		}
	}
	
	private void carregaDados(){
		
		String fornecedorId = TSFacesUtil.getRequestParameter("id");

		if (!TSUtil.isEmpty(fornecedorId) && TSUtil.isNumeric(fornecedorId)) {

			this.fornecedorModel = new FornecedorDAO().obter(new FornecedorModel(new Long(fornecedorId)));

			if (!TSUtil.isEmpty(this.fornecedorModel) && !TSUtil.isEmpty(this.fornecedorModel.getId())) {

				this.ranking = new ComentarioDAO().rankingEstabelecimento(this.fornecedorModel);

				this.fornecedorModel.setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.fornecedorModel));
				this.fornecedorModel.setImagensFornecedorModel(new ImagemFornecedorDAO().pesquisar(this.fornecedorModel));
				this.fornecedorModel.setComentarios(new ComentarioDAO().pesquisarComentarios(this.fornecedorModel));
				
				this.comentarioFornecedorModel = new ComentarioFornecedorModel();
				this.comentarioFornecedorModel.setFornecedorModel(this.fornecedorModel);
				
				Long idUsuarioLogado = (Long) TSFacesUtil.getObjectInSession(Constantes.ID_USUARIO_LOGADO);
				
				this.usuarioLogado = new UsuarioDAO().getById(new UsuarioModel(idUsuarioLogado));
				
				this.comentarioFornecedorModel.setUsuarioModel(this.usuarioLogado);

			} else {

				ZapeatUtil.redirect();
			}

		} else {

			ZapeatUtil.redirect();
		}
		
	}

	public String comentar() throws TSApplicationException{

		if(!TSUtil.isEmpty(this.usuarioLogado) && !TSUtil.isEmpty(this.usuarioLogado.getId())){
			
			new ComentarioDAO().comentar(comentarioFornecedorModel);
			
			this.carregaDados();
			
		} else{
			
			addErrorMessage("É necessário estar logado para realizar essa operação");
			
		}
		
		return null;
	}
	
	private void executarIndicacao(ComentarioModel comentarioModel){
		
		String comentario = super.getRequestParameter("comentario");

		if (!TSUtil.isEmpty(this.usuarioLogado) && !TSUtil.isEmpty(this.usuarioLogado.getId())) {

			comentarioModel.setUsuarioModel(this.usuarioLogado);
			comentarioModel.setDescricao(comentario);
			comentarioModel.setFornecedorModel(this.fornecedorModel);

			ComentarioModel coment = new ComentarioDAO().obterIndicacao(comentarioModel);

			if (TSUtil.isEmpty(coment)) {
				
				try {
					new ComentarioDAO().inserir(comentarioModel);
				} catch (TSApplicationException e) {
					e.printStackTrace();
				}
				
				this.carregaDados();

				super.addInfoMessage("Indicação realizada com sucesso!");
					
			} else {

				super.addErrorMessage(this.usuarioLogado.getNome() + ": O Sr(a) já indicou esse estabelecimento!");
			}

		} else {
			
			TSFacesUtil.addErrorMessage("Você precisa estar logado para realizar a operação!");
		}
			
	}
	
	public String indicar(){
		
		ComentarioModel comentarioModel = new ComentarioModel();

		comentarioModel.setFlagIndica(Boolean.TRUE);
		
		this.executarIndicacao(comentarioModel);
		
		return null;
		
	}
	
	public String naoIndicar(){
		
		ComentarioModel comentarioModel = new ComentarioModel();
		
		comentarioModel.setFlagNaoIndica(Boolean.TRUE);
		
		this.executarIndicacao(comentarioModel);
		
		
		return null;
		
	}
	
	@Override
	protected Long getFornecedorId() {
		return ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));
	}

	public List<FornecedorModel> obterEstabelecimentosLateral() {
		return new FornecedorDAO().pesquisarHome((Long)TSFacesUtil.getObjectInSession("cidadeId"));
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
