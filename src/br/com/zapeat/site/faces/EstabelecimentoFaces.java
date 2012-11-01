package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.FormaPagamentoDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.ImagemFornecedorDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.ImagemFornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;

@ViewScoped
@ManagedBean(name = "estabelecimentoFaces")
public class EstabelecimentoFaces extends TSMainFaces {

	private FornecedorModel fornecedorModel;
	private List<ImagemFornecedorModel> fotosEstabelecimento;
	private ComentarioModel ranking;
	private FornecedorDAO fornecedorDAO;
	private ImagemFornecedorDAO imagemFornecedorDAO;
	private ComentarioDAO comentarioDAO;
	private PromocaoDAO promocaoDAO;
	private CarroChefeDAO carroChefeDAO;

	private PromocaoModel promocaoDoDia;
	private PromocaoModel promocaoDaSemana;
	private CarroChefeModel carroChefeModel;
	
	private ComentarioModel comentarioModel;

	public EstabelecimentoFaces() {

		this.carregaDados();

	}

	private void carregaDados() {
         
		String fornecedorId = TSFacesUtil.getRequestParameter("estabelecimento_id");
		
		if( TSUtil.isEmpty(fornecedorId) ){
			
			fornecedorId = TSFacesUtil.getRequestParameter("id");
			
		}

		if (!TSUtil.isEmpty(fornecedorId) && TSUtil.isNumeric(fornecedorId)) {

			this.initDAO();

			this.fornecedorModel = this.fornecedorDAO.obter(new FornecedorModel(new Long(fornecedorId)));

			if (!TSUtil.isEmpty(this.fornecedorModel) && !TSUtil.isEmpty(this.fornecedorModel.getId())) {

				this.fotosEstabelecimento = this.imagemFornecedorDAO.pesquisar(this.fornecedorModel);

				this.ranking = this.comentarioDAO.rankingEstabelecimento(this.fornecedorModel);

				this.fornecedorModel.setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.fornecedorModel));

				this.promocaoDaSemana = this.promocaoDAO.obterPromocaoSemana(this.fornecedorModel);

				this.promocaoDoDia = this.promocaoDAO.obterPromocaoSemana(this.fornecedorModel);

				this.carroChefeModel = this.carroChefeDAO.obter(this.fornecedorModel);
				
				this.comentarioModel = new ComentarioDAO().obterIndicacao(this.fornecedorModel);

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

		this.fornecedorDAO = new FornecedorDAO();
		this.imagemFornecedorDAO = new ImagemFornecedorDAO();
		this.comentarioDAO = new ComentarioDAO();
		this.promocaoDAO = new PromocaoDAO();
		this.carroChefeDAO = new CarroChefeDAO();

	}

	public List<FornecedorModel> obterEstabelecimentosLateral() {
		return new FornecedorDAO().pesquisarHome();
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

	public FornecedorDAO getFornecedorDAO() {
		return fornecedorDAO;
	}

	public void setFornecedorDAO(FornecedorDAO fornecedorDAO) {
		this.fornecedorDAO = fornecedorDAO;
	}

	public ImagemFornecedorDAO getImagemFornecedorDAO() {
		return imagemFornecedorDAO;
	}

	public void setImagemFornecedorDAO(ImagemFornecedorDAO imagemFornecedorDAO) {
		this.imagemFornecedorDAO = imagemFornecedorDAO;
	}

	public ComentarioDAO getComentarioDAO() {
		return comentarioDAO;
	}

	public void setComentarioDAO(ComentarioDAO comentarioDAO) {
		this.comentarioDAO = comentarioDAO;
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

	public PromocaoDAO getPromocaoDAO() {
		return promocaoDAO;
	}

	public void setPromocaoDAO(PromocaoDAO promocaoDAO) {
		this.promocaoDAO = promocaoDAO;
	}

	public CarroChefeDAO getCarroChefeDAO() {
		return carroChefeDAO;
	}

	public void setCarroChefeDAO(CarroChefeDAO carroChefeDAO) {
		this.carroChefeDAO = carroChefeDAO;
	}

	public ComentarioModel getComentarioModel() {
		return comentarioModel;
	}

	public void setComentarioModel(ComentarioModel comentarioModel) {
		this.comentarioModel = comentarioModel;
	}

}
