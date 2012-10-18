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

	private PromocaoModel promocaoDia;
	private PromocaoModel promocaoSemana;
	private CarroChefeModel carroChefeModel;

	public PromocaoFaces() {

		Long id = ZapeatUtil.getParamFormatado(super.getRequestParameter("id"));

		PromocaoDAO promocaoDAO = new PromocaoDAO();
		CarroChefeDAO carroChefeDAO = new CarroChefeDAO();

		this.promocao = promocaoDAO.obter(id);
		
		if(!TSUtil.isEmpty(this.promocao)){
			this.promocao.getFornecedorModel().setFormasPagamentos(new FormaPagamentoDAO().pesquisar(this.promocao.getFornecedorModel()));
		}
		
		this.promocaoDia = promocaoDAO.obterPromocaoDia(new FornecedorModel());
		this.promocaoSemana = promocaoDAO.obterPromocaoSemana(new FornecedorModel());
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

}
