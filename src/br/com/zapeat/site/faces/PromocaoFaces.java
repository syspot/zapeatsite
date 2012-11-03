package br.com.zapeat.site.faces;

import java.io.IOException;

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
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class PromocaoFaces extends CarregaPromocaoFaces {

	private PromocaoModel promocao;
	private CarroChefeModel carroChefe;
	private boolean tipoPromocao;
	private ComentarioPromocaoModel comentarioPromocaoModel;
	private ComentarioCarroChefeModel comentarioCarroChefeModel;
	
	public PromocaoFaces() {

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
			this.redirect();
		}
		
	}
	
	private void redirect() {
		try {
			TSFacesUtil.getFacesContext().getExternalContext().redirect("index.jsf?cidade=" + TSFacesUtil.getRequestParameter("cidade"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void obterPromocao(PromocaoDAO promocaoDAO, Long id){
		
		this.tipoPromocao = true;
		
		this.promocao = new PromocaoDAO().obter(id, (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		
		if(!TSUtil.isEmpty(this.promocao)){
		
			this.promocao.getFornecedorModel().setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.promocao.getFornecedorModel()));
			this.promocao.setImagensPromocoes(new ImagemPromocaoDAO().pesquisar(this.promocao));
			this.promocao.setComentarios(new ComentarioDAO().pesquisarComentarios(this.promocao));
			this.comentarioPromocaoModel = new ComentarioPromocaoModel();
			this.comentarioPromocaoModel.setPromocaoModel(this.promocao);
		
		} else{
			
			this.redirect();
			
		}
		
	}
	
	private void obterCarroChefe(CarroChefeDAO carroChefeDAO, Long id){
		
		this.tipoPromocao = false;
		
		this.carroChefe = new CarroChefeDAO().obter(id, (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		
		if(!TSUtil.isEmpty(this.carroChefe)){
			
			this.carroChefe.getFornecedorModel().setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.carroChefe.getFornecedorModel()));
			this.carroChefe.setImagensCarroChefe(new ImagemCarroChefeDAO().pesquisar(this.carroChefe));
			this.carroChefe.setComentarios(new ComentarioDAO().pesquisarComentarios(this.carroChefe));
			this.comentarioCarroChefeModel = new ComentarioCarroChefeModel();
			this.comentarioCarroChefeModel.setCarroChefeModel(this.carroChefe);
			
		} else{
			
			this.redirect();
			
		}
		
	}
	
	public void comentar() throws TSApplicationException{
		if(isTipoPromocao()){
			new ComentarioDAO().comentar(comentarioPromocaoModel); 
		} else{
			new ComentarioDAO().comentar(comentarioCarroChefeModel);
		}
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

	public void setComentarioPromocaoModel(
			ComentarioPromocaoModel comentarioPromocaoModel) {
		this.comentarioPromocaoModel = comentarioPromocaoModel;
	}

	public ComentarioCarroChefeModel getComentarioCarroChefeModel() {
		return comentarioCarroChefeModel;
	}

	public void setComentarioCarroChefeModel(
			ComentarioCarroChefeModel comentarioCarroChefeModel) {
		this.comentarioCarroChefeModel = comentarioCarroChefeModel;
	}

}
