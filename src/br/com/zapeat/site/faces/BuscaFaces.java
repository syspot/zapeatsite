package br.com.zapeat.site.faces;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.model.BuscaModel;
import br.com.zapeat.site.model.Promocao;

@ManagedBean
public class BuscaFaces extends TSMainFaces {

	private Promocao promocaoBusca;
	
	private String termoBuscado;
	private String localBuscado;
	
	private List<BuscaModel> listagem;
	
	public BuscaFaces(){
		
		this.promocaoBusca = new Promocao();
		this.listagem = new ArrayList<BuscaModel>();
		
	}
	
	public String buscar(){
		
		System.out.println("teste");
		
		//this.promocoes = this.promocaoBusca.findPromocoes(termoBuscado);
		
		return null;
		
	}

	public List<BuscaModel> getListagem() {
		return listagem;
	}

	public void setListagem(List<BuscaModel> listagem) {
		this.listagem = listagem;
	}

	public String getTermoBuscado() {
		return termoBuscado;
	}

	public void setTermoBuscado(String termoBuscado) {
		this.termoBuscado = termoBuscado;
	}

	public String getLocalBuscado() {
		return localBuscado;
	}

	public void setLocalBuscado(String localBuscado) {
		this.localBuscado = localBuscado;
	}

}
