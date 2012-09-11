package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.BannerDAO;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.ImagemFornecedorDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.BannerModel;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.ImagemFornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;

@RequestScoped
@ManagedBean(name = "estabelecimentoFaces")
public class EstabelecimentoFaces extends TSMainFaces {

	private FornecedorModel fornecedorModel;
	private List<ImagemFornecedorModel> fotosEstabelecimento;
	private PromocaoModel promocaoDia;
	private PromocaoModel promocaoSemana;
	private BannerModel bannerModel;
	private CarroChefeModel carroChefeModel;

	private PromocaoDAO promocaoDAO;
	private FornecedorDAO fornecedorDAO;
	private BannerDAO bannerDAO;
	private CarroChefeDAO carroChefeDAO;
	private ImagemFornecedorDAO imagemFornecedorDAO;

	public EstabelecimentoFaces() {

		this.carregaDados();

	}

	private void carregaDados() {

		String fornecedorId = TSFacesUtil.getRequestParameter("id");

		if (!TSUtil.isEmpty(fornecedorId) && TSUtil.isNumeric(fornecedorId)) {

			this.initDAO();

			this.fornecedorModel = this.fornecedorDAO.obter(new FornecedorModel(new Long(fornecedorId)));

			if (!TSUtil.isEmpty(this.fornecedorModel) && !TSUtil.isEmpty(this.fornecedorModel.getId())) {

				this.fotosEstabelecimento = this.imagemFornecedorDAO.pesquisar(this.fornecedorModel);

				this.promocaoDia = this.promocaoDAO.obterPromocaoDia(this.fornecedorModel);

				this.promocaoSemana = this.promocaoDAO.obterPromocaoSemana(this.fornecedorModel);

				this.bannerModel = this.bannerDAO.pesquisar(new BannerModel(this.fornecedorModel));

				this.carroChefeModel = this.carroChefeDAO.pesquisar(new CarroChefeModel(this.fornecedorModel));

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

	private void initDAO() {

		this.promocaoDAO = new PromocaoDAO();
		this.bannerDAO = new BannerDAO();
		this.fornecedorDAO = new FornecedorDAO();
		this.carroChefeDAO = new CarroChefeDAO();
		this.imagemFornecedorDAO = new ImagemFornecedorDAO();
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

	public BannerModel getBannerModel() {
		return bannerModel;
	}

	public void setBannerModel(BannerModel bannerModel) {
		this.bannerModel = bannerModel;
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

	public List<ImagemFornecedorModel> getFotosEstabelecimento() {
		return fotosEstabelecimento;
	}

	public void setFotosEstabelecimento(List<ImagemFornecedorModel> fotosEstabelecimento) {
		this.fotosEstabelecimento = fotosEstabelecimento;
	}

	public ImagemFornecedorDAO getImagemFornecedorDAO() {
		return imagemFornecedorDAO;
	}

	public void setImagemFornecedorDAO(ImagemFornecedorDAO imagemFornecedorDAO) {
		this.imagemFornecedorDAO = imagemFornecedorDAO;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

}
