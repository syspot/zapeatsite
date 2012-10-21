package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.FormaPagamentoDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.PromocaoModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class PromocaoFaces extends TSMainFaces {

	private PromocaoModel promocao;
	private CarroChefeModel carroChefe;
	private boolean tipoPromocao;
	
	private PromocaoModel promocaoDaHora;
	private PromocaoModel promocaoDoDia;
	private PromocaoModel promocaoDaSemana;
	private CarroChefeModel carroChefeModel;

	public PromocaoFaces() {

		Long id = ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));
		Long carroChefeId = ZapeatUtil.getParamFormatado(super.getRequestParameter("carroChefeId"));
		
		PromocaoDAO promocaoDAO = new PromocaoDAO();
		CarroChefeDAO carroChefeDAO = new CarroChefeDAO();
		
		this.promocaoDaHora = promocaoDAO.obterPromocaoHoraAleatoria();
		this.promocaoDoDia = promocaoDAO.obterPromocaoDiaAleatoria();
		this.promocaoDaSemana = promocaoDAO.obterPromocaoSemanaAleatoria();
		this.carroChefeModel = carroChefeDAO.obterCarroChefeAleatorio();
		
		
		if(TSUtil.isEmpty(id) || TSUtil.isEmpty(carroChefeId)){
			
			
			if(!TSUtil.isEmpty(carroChefeId)){
				
				this.obterCarroChefe(carroChefeDAO, carroChefeId);
				
			} else{
				
				this.obterPromocao(promocaoDAO, id);
				
			}
			
		}
		
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

	public PromocaoModel getPromocaoDaHora() {
		return promocaoDaHora;
	}

	public void setPromocaoDaHora(PromocaoModel promocaoDaHora) {
		this.promocaoDaHora = promocaoDaHora;
	}

	public PromocaoModel getPromocaoDoDia() {
		return promocaoDoDia;
	}

	public void setPromocaoDoDia(PromocaoModel promocaoDoDia) {
		this.promocaoDoDia = promocaoDoDia;
	}

	public PromocaoModel getPromocaoDaSemana() {
		return promocaoDaSemana;
	}

	public void setPromocaoDaSemana(PromocaoModel promocaoDaSemana) {
		this.promocaoDaSemana = promocaoDaSemana;
	}

	public CarroChefeModel getCarroChefeModel() {
		return carroChefeModel;
	}

	public void setCarroChefeModel(CarroChefeModel carroChefeModel) {
		this.carroChefeModel = carroChefeModel;
	}

}
