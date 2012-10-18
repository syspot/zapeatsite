package br.com.zapeat.site.faces;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.BannerDAO;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.BannerModel;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;

@ManagedBean(name = "indexFaces")
public class IndexFaces extends TSMainFaces {

	private PromocaoModel promocaoDia;
	private PromocaoModel promocaoHora;
	private PromocaoModel promocaoSemana;
	private BannerModel bannerModel;
	private CarroChefeModel carroChefeModel;
	private ComentarioModel comentarioModel;

	private List<PromocaoModel> promocoesHora;
	private List<FornecedorModel> estabelecimentos;
	private List<FornecedorModel> topGeral;

	private PromocaoDAO promocaoDAO;
	private FornecedorDAO fornecedorDAO;
	private BannerDAO bannerDAO;
	private CarroChefeDAO carroChefeDAO;
	private ComentarioDAO comentarioDAO;

	public IndexFaces() {

		this.initDAO();
		this.initObjetos();
		this.carregaDados();

	}

	private void initDAO() {

		this.promocaoDAO = new PromocaoDAO();
		this.bannerDAO = new BannerDAO();
		this.fornecedorDAO = new FornecedorDAO();
		this.carroChefeDAO = new CarroChefeDAO();
		this.comentarioDAO = new ComentarioDAO();
	}

	private void initObjetos() {

		this.promocaoHora = new PromocaoModel();
		this.promocaoDia = new PromocaoModel();
		this.promocaoSemana = new PromocaoModel();
		this.bannerModel = new BannerModel();
		this.promocoesHora = new ArrayList<PromocaoModel>();
		this.estabelecimentos = new ArrayList<FornecedorModel>();
		this.topGeral = new ArrayList<FornecedorModel>();
		this.comentarioModel = new ComentarioModel();

	}

	private void carregaDados() {

		this.promocaoDia = this.promocaoDAO.obterPromocaoDia(new FornecedorModel());

		this.promocaoSemana = this.promocaoDAO.obterPromocaoSemana(new FornecedorModel());

		this.promocaoHora = this.promocaoDAO.obterPromocaoHora();

		if (!TSUtil.isEmpty(this.promocaoHora) && !TSUtil.isEmpty(this.promocaoHora.getId())) {
			
			this.promocoesHora = this.promocaoDAO.pesquisarPromocoesHora(this.promocaoHora);
			
			TSFacesUtil.addObjectInSession("promocaoHora", this.promocaoHora);
		}

		this.bannerModel = this.bannerDAO.pesquisar(new BannerModel());

		this.carroChefeModel = this.carroChefeDAO.pesquisar(new CarroChefeModel());

		this.estabelecimentos = this.fornecedorDAO.pesquisarHome();

		this.topGeral = this.fornecedorDAO.pesquisarTopGeral();

		this.comentarioModel = this.comentarioDAO.obterIndicacao();

		this.setarCssTopGeral();

	}
	
	private void setarCssTopGeral() {

		int count = 1;

		for (FornecedorModel item : this.topGeral) {

			if (count == 1) {

				item.setCss("hum");

			} else if (count == 2) {

				item.setCss("dois");

			} else if (count == 3) {

				item.setCss("tres");

			} else if (count == 4) {

				item.setCss("quatro");

			} else {

				item.setCss("cinco");
			}

			count++;
		}
	}

	public PromocaoModel getPromocaoDia() {
		return promocaoDia;
	}

	public void setPromocaoDia(PromocaoModel promocao) {
		this.promocaoDia = promocao;
	}

	public PromocaoModel getPromocaoSemana() {
		return promocaoSemana;
	}

	public void setPromocaoSemana(PromocaoModel promocaoSemana) {
		this.promocaoSemana = promocaoSemana;
	}

	public BannerModel getBannerModel() {
		return bannerModel;
	}

	public void setBannerModel(BannerModel bannerModel) {
		this.bannerModel = bannerModel;
	}

	public List<PromocaoModel> getPromocoesHora() {
		return promocoesHora;
	}

	public void setPromocoesHora(List<PromocaoModel> promocoesHora) {
		this.promocoesHora = promocoesHora;
	}

	public List<FornecedorModel> getEstabelecimentos() {
		return estabelecimentos;
	}

	public void setEstabelecimentos(List<FornecedorModel> estabelecimentos) {
		this.estabelecimentos = estabelecimentos;
	}

	public List<FornecedorModel> getTopGeral() {
		return topGeral;
	}

	public void setTopGeral(List<FornecedorModel> topGeral) {
		this.topGeral = topGeral;
	}

	public CarroChefeModel getCarroChefeModel() {
		return carroChefeModel;
	}

	public void setCarroChefeModel(CarroChefeModel carroChefeModel) {
		this.carroChefeModel = carroChefeModel;
	}

	public PromocaoDAO getPromocaoDAO() {
		return promocaoDAO;
	}

	public void setPromocaoDAO(PromocaoDAO promocaoDAO) {
		this.promocaoDAO = promocaoDAO;
	}

	public FornecedorDAO getFornecedorDAO() {
		return fornecedorDAO;
	}

	public void setFornecedorDAO(FornecedorDAO fornecedorDAO) {
		this.fornecedorDAO = fornecedorDAO;
	}

	public BannerDAO getBannerDAO() {
		return bannerDAO;
	}

	public void setBannerDAO(BannerDAO bannerDAO) {
		this.bannerDAO = bannerDAO;
	}

	public CarroChefeDAO getCarroChefeDAO() {
		return carroChefeDAO;
	}

	public void setCarroChefeDAO(CarroChefeDAO carroChefeDAO) {
		this.carroChefeDAO = carroChefeDAO;
	}

	public PromocaoModel getPromocaoHora() {
		return promocaoHora;
	}

	public void setPromocaoHora(PromocaoModel promocaoHora) {
		this.promocaoHora = promocaoHora;
	}

	public ComentarioModel getComentarioModel() {
		return comentarioModel;
	}

	public void setComentarioModel(ComentarioModel comentarioModel) {
		this.comentarioModel = comentarioModel;
	}

	public ComentarioDAO getComentarioDAO() {
		return comentarioDAO;
	}

	public void setComentarioDAO(ComentarioDAO comentarioDAO) {
		this.comentarioDAO = comentarioDAO;
	}

}
