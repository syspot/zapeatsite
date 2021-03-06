package br.com.zapeat.site.faces;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.PromocaoModel;

public class CarregaPromocaoFaces extends TSMainFaces{

	private PromocaoModel promocaoDaHora;
	private PromocaoModel promocaoDoDia;
	private PromocaoModel promocaoDaSemana;
	private CarroChefeModel carroChefeModel;
	private ComentarioModel comentarioModel;

	public CarregaPromocaoFaces() {

		PromocaoDAO promocaoDAO = new PromocaoDAO();
		
		this.promocaoDaHora = promocaoDAO.obterPromocaoHoraAleatoria(getPromocaoId(), getFornecedorId(), (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		this.promocaoDoDia = promocaoDAO.obterPromocaoDiaAleatoria(getPromocaoId(), getFornecedorId(), (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		this.promocaoDaSemana = promocaoDAO.obterPromocaoSemanaAleatoria(getPromocaoId(), getFornecedorId(), (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		this.carroChefeModel = new CarroChefeDAO().obterCarroChefeAleatorio(getFornecedorId(), (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		
		this.comentarioModel = new ComentarioDAO().obterIndicacao(getFornecedorId(), (Long)TSFacesUtil.getObjectInSession("cidadeId"));
		
	}
	
	protected Long getPromocaoId(){
		return null;
	}
	
	protected Long getFornecedorId(){
		return null;
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

	public ComentarioModel getComentarioModel() {
		return comentarioModel;
	}

	public void setComentarioModel(ComentarioModel comentarioModel) {
		this.comentarioModel = comentarioModel;
	}

}
