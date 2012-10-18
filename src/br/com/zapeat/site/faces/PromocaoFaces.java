package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.FormaPagamentoDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class PromocaoFaces extends TSMainFaces {

	private PromocaoModel promocao;
	private CarroChefeModel carroChefe;

	private PromocaoModel promocaoDia;
	private PromocaoModel promocaoSemana;
	private CarroChefeModel carroChefeModel;
	
	private boolean tipoPromocao;

	public PromocaoFaces() {

		Long id = ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));
		Long carroChefeId = ZapeatUtil.getParamFormatado(super.getRequestParameter("carroChefeId"));
		
		PromocaoDAO promocaoDAO = new PromocaoDAO();
		CarroChefeDAO carroChefeDAO = new CarroChefeDAO();
		
		if(!TSUtil.isEmpty(carroChefeId)){
			
			this.obterCarroChefe(carroChefeDAO, carroChefeId);
			
		} else{
			
			this.obterPromocao(promocaoDAO, id);
			
		}

		this.promocaoDia = promocaoDAO.obterPromocaoDia(new FornecedorModel());
		this.promocaoSemana = promocaoDAO.obterPromocaoSemana(new FornecedorModel());
		this.carroChefeModel = carroChefeDAO.pesquisar(new CarroChefeModel());

	}
	
	private void obterPromocao(PromocaoDAO promocaoDAO, Long id){
		
		this.tipoPromocao = true;
		
		this.promocao = new PromocaoDAO().obter(id);
		
		if(!TSUtil.isEmpty(this.promocao)){
			this.promocao.getFornecedorModel().setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.promocao.getFornecedorModel()));
		}
		
	}
	
	private void obterCarroChefe(CarroChefeDAO carroChefeDAO, Long id){
		
		this.tipoPromocao = false;
		
		this.carroChefe = new CarroChefeDAO().obter(id);
		
		if(!TSUtil.isEmpty(this.carroChefe)){
			this.carroChefe.getFornecedorModel().setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.carroChefe.getFornecedorModel()));
		}
		
	}

	public PromocaoModel getPromocao() {
		return promocao;
	}

	public void setPromocao(PromocaoModel promocao) {
		this.promocao = promocao;
	}

	public PromocaoModel getPromocaoDia() {
		return promocaoDia;
	}

	public void setPromocaoDia(PromocaoModel promocaoDia) {
		this.promocaoDia = promocaoDia;
	}

	public PromocaoModel getPromocaoSemana() {
		return promocaoSemana;
	}

	public void setPromocaoSemana(PromocaoModel promocaoSemana) {
		this.promocaoSemana = promocaoSemana;
	}

	public CarroChefeModel getCarroChefeModel() {
		return carroChefeModel;
	}

	public void setCarroChefeModel(CarroChefeModel carroChefeModel) {
		this.carroChefeModel = carroChefeModel;
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

}
