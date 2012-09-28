package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.BannerDAO;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.BannerModel;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class PromocaoFaces extends TSMainFaces {

	private PromocaoModel promocao;
	
	private PromocaoModel promocaoDia;
	private PromocaoModel promocaoSemana;
	private CarroChefeModel carroChefeModel;
	
	private BannerModel bannerSuperiorGrande;
	private BannerModel bannerSuperiorPequeno;
	private BannerModel bannerLateral;
	
	public PromocaoFaces() {
		
		Long id = ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));
		
		PromocaoDAO promocaoDAO = new PromocaoDAO();
		BannerDAO bannerDAO = new BannerDAO();
		CarroChefeDAO carroChefeDAO = new CarroChefeDAO();
		
		this.promocao = promocaoDAO.obter(id);
		
		this.promocaoDia = promocaoDAO.obterPromocaoDia(new FornecedorModel());
		this.promocaoSemana = promocaoDAO.obterPromocaoSemana(new FornecedorModel());
		this.bannerLateral = bannerDAO.obterBannerLateral();
		//this.bannerSuperiorGrande = bannerDAO.obterBannerSuperiorGrande();
		this.bannerSuperiorPequeno = bannerDAO.obterBannerSuperiorPequeno();
		this.carroChefeModel = carroChefeDAO.pesquisar(new CarroChefeModel());
		
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

	public BannerModel getBannerSuperiorGrande() {
		return bannerSuperiorGrande;
	}

	public void setBannerSuperiorGrande(BannerModel bannerSuperiorGrande) {
		this.bannerSuperiorGrande = bannerSuperiorGrande;
	}

	public BannerModel getBannerSuperiorPequeno() {
		return bannerSuperiorPequeno;
	}

	public void setBannerSuperiorPequeno(BannerModel bannerSuperiorPequeno) {
		this.bannerSuperiorPequeno = bannerSuperiorPequeno;
	}

	public BannerModel getBannerLateral() {
		return bannerLateral;
	}

	public void setBannerLateral(BannerModel bannerLateral) {
		this.bannerLateral = bannerLateral;
	}
	
}
