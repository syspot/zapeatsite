package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.model.PromocaoModel;

@ManagedBean
public class IndexFaces extends TSMainFaces{

	private PromocaoModel promocaoDia;
	private List<PromocaoModel> promocoesSemana;
	private List<PromocaoModel> promocoesHora;
	private PromocaoModel promocao;

	public IndexFaces(){
		this.promocao = new PromocaoModel();
//		this.promocaoDia = promocao.getPromocaoDia();
//		this.promocoesSemana = promocao.findPromocoesSemana();
//		this.promocoesHora = promocao.findPromocoesHora();
		
	}

	public PromocaoModel getPromocaoDia() {
		return promocaoDia;
	}

	public void setPromocaoDia(PromocaoModel promocao) {
		this.promocaoDia = promocao;
	}
	
	public List<PromocaoModel> getPromocoesSemana() {
		return promocoesSemana;
	}

	public void setPromocoesSemana(List<PromocaoModel> promocoesSemana) {
		this.promocoesSemana = promocoesSemana;
	}

}
