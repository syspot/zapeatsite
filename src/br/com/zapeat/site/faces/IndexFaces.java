package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.model.Promocao;

@ManagedBean
public class IndexFaces extends TSMainFaces{

	private Promocao promocaoDia;
	private List<Promocao> promocoesSemana;
	private List<Promocao> promocoesHora;
	private Promocao promocao;

	public IndexFaces(){
		this.promocao = new Promocao();
		this.promocaoDia = promocao.getPromocaoDia();
		this.promocoesSemana = promocao.findPromocoesSemana();
		this.promocoesHora = promocao.findPromocoesHora();
		
	}

	public Promocao getPromocaoDia() {
		return promocaoDia;
	}

	public void setPromocaoDia(Promocao promocao) {
		this.promocaoDia = promocao;
	}
	
	public List<Promocao> getPromocoesSemana() {
		return promocoesSemana;
	}

	public void setPromocoesSemana(List<Promocao> promocoesSemana) {
		this.promocoesSemana = promocoesSemana;
	}

}
