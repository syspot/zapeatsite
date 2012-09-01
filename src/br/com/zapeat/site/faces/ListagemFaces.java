package br.com.zapeat.site.faces;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.model.Promocao;

@ManagedBean
public class ListagemFaces extends TSMainFaces {

	private Promocao promocaoBusca;
	
	private List<Promocao> promocoes;
	
	public ListagemFaces(){
		
		this.promocaoBusca = new Promocao();
		this.promocoes = new ArrayList<Promocao>();
		this.promocoes = this.promocaoBusca.findPromocoesMaisIndicadas();
		
	}

	public List<Promocao> getPromocoes() {
		return promocoes;
	}

	public void setPromocoes(List<Promocao> promocoes) {
		this.promocoes = promocoes;
	}
	
	
}
