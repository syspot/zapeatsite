package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.FormaPagamentoDAO;
import br.com.zapeat.site.dao.ImagemCarroChefeDAO;
import br.com.zapeat.site.dao.ImagemPromocaoDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.ComentarioCarroChefeModel;
import br.com.zapeat.site.model.ComentarioPromocaoModel;
import br.com.zapeat.site.model.PromocaoModel;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class PromocaoFaces extends CarregaPromocaoFaces {

	private PromocaoModel promocao;
	private CarroChefeModel carroChefe;
	private boolean tipoPromocao;
	private ComentarioPromocaoModel comentarioPromocaoModel;
	private ComentarioCarroChefeModel comentarioCarroChefeModel;
	private UsuarioModel usuarioLogado;
	
	public PromocaoFaces() {

		this.carregaDados();
		
	}
	
	private void carregaDados(){
		
		Long id = ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));
		Long carroChefeId = ZapeatUtil.getParamFormatado(super.getRequestParameter("carroChefeId"));
		
		PromocaoDAO promocaoDAO = new PromocaoDAO();
		CarroChefeDAO carroChefeDAO = new CarroChefeDAO();
		
		if(!TSUtil.isEmpty(id) || !TSUtil.isEmpty(carroChefeId)){
			
			if(!TSUtil.isEmpty(carroChefeId)){
				
				this.obterCarroChefe(carroChefeDAO, carroChefeId);
				
			} else{
				
				this.obterPromocao(promocaoDAO, id);
				
			}
			
		} else{
			
			ZapeatUtil.redirect();
			
		}
	}
	
	private void obterPromocao(PromocaoDAO promocaoDAO, Long id){
		
		this.tipoPromocao = true;
		
		this.promocao = new PromocaoDAO().obter(id, (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		
		if(!TSUtil.isEmpty(this.promocao)){
		
			this.promocao.getFornecedorModel().setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.promocao.getFornecedorModel()));
			this.promocao.setImagensPromocoes(new ImagemPromocaoDAO().pesquisar(this.promocao));
			this.promocao.setComentarios(new ComentarioDAO().pesquisarComentarios(this.promocao));
			
			Long idUsuarioLogado = (Long) TSFacesUtil.getObjectInSession(Constantes.ID_USUARIO_LOGADO);
			
			this.usuarioLogado = new UsuarioModel(idUsuarioLogado);
			
			this.comentarioPromocaoModel = new ComentarioPromocaoModel();
			this.comentarioPromocaoModel.setPromocaoModel(this.promocao);
			this.comentarioPromocaoModel.setUsuarioModel(this.usuarioLogado);
		
		} else{
			
			ZapeatUtil.redirect();
			
		}
		
	}
	
	private void obterCarroChefe(CarroChefeDAO carroChefeDAO, Long id){
		
		this.tipoPromocao = false;
		
		this.carroChefe = new CarroChefeDAO().obter(id, (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		
		if(!TSUtil.isEmpty(this.carroChefe)){
			
			this.carroChefe.getFornecedorModel().setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.carroChefe.getFornecedorModel()));
			this.carroChefe.setImagensCarroChefe(new ImagemCarroChefeDAO().pesquisar(this.carroChefe));
			this.carroChefe.setComentarios(new ComentarioDAO().pesquisarComentarios(this.carroChefe));
			
			Long idUsuarioLogado = (Long) TSFacesUtil.getObjectInSession(Constantes.ID_USUARIO_LOGADO);
			
			this.usuarioLogado = new UsuarioModel(idUsuarioLogado);
			
			this.comentarioCarroChefeModel = new ComentarioCarroChefeModel();
			this.comentarioCarroChefeModel.setCarroChefeModel(this.carroChefe);
			this.comentarioCarroChefeModel.setUsuarioModel(this.usuarioLogado);
			
		} else{
			
			ZapeatUtil.redirect();
			
		}
		
	}
	
	public String comentar() throws TSApplicationException{

		if(!TSUtil.isEmpty(this.usuarioLogado) && !TSUtil.isEmpty(this.usuarioLogado.getId())){
			
			if(isTipoPromocao()){
				new ComentarioDAO().comentar(comentarioPromocaoModel); 
			} else{
				new ComentarioDAO().comentar(comentarioCarroChefeModel);
			}
			
			this.carregaDados();
			
		} else{
			
			addErrorMessage("É necessário estar logado para realizar essa operação");
			
		}
		
		return null;
	}
	
	@Override
	protected Long getPromocaoId() {
		return ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));
	}
	
	@Override
	protected Long getFornecedorId() {
		return ZapeatUtil.getParamFormatado(super.getRequestParameter("estabelecimento_id"));
	}

	public PromocaoModel getPromocao() {
		return promocao;
	}

	public void setPromocao(PromocaoModel promocao) {
		this.promocao = promocao;
	}

	public CarroChefeModel getCarroChefe() {
		return carroChefe;
	}

	public void setCarroChefe(CarroChefeModel carroChefe) {
		this.carroChefe = carroChefe;
	}

	public boolean isTipoPromocao() {
		return tipoPromocao;
	}

	public void setTipoPromocao(boolean tipoPromocao) {
		this.tipoPromocao = tipoPromocao;
	}

	public ComentarioPromocaoModel getComentarioPromocaoModel() {
		return comentarioPromocaoModel;
	}

	public void setComentarioPromocaoModel(ComentarioPromocaoModel comentarioPromocaoModel) {
		this.comentarioPromocaoModel = comentarioPromocaoModel;
	}

	public ComentarioCarroChefeModel getComentarioCarroChefeModel() {
		return comentarioCarroChefeModel;
	}

	public void setComentarioCarroChefeModel(ComentarioCarroChefeModel comentarioCarroChefeModel) {
		this.comentarioCarroChefeModel = comentarioCarroChefeModel;
	}

	public UsuarioModel getUsuarioLogado() {
		return usuarioLogado;
	}

	public void setUsuarioLogado(UsuarioModel usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}

}
