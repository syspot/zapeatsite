package br.com.zapeat.site.faces;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.BuscaDAO;
import br.com.zapeat.site.model.BuscaModel;

@ManagedBean
public class BuscaFaces extends TSMainFaces {

	private BuscaDAO buscaDAO;
	
	private String termoBuscado;
	private String localBuscado;
	
	private List<BuscaModel> listagem;
	
	public BuscaFaces(){
		
		this.buscaDAO = new BuscaDAO();
		this.listagem = new ArrayList<BuscaModel>();
		
	}
	
	public String buscar(){
		
		this.listagem = new ArrayList<BuscaModel>();
		this.listagem.addAll(this.buscaDAO.pesquisarPromocaoPorTexto(termoBuscado));
		this.listagem.addAll(this.buscaDAO.pesquisarCarroChefePorTexto(termoBuscado));
		this.listagem.addAll(this.buscaDAO.pesquisarEstabelecimentoPorTexto(termoBuscado));
		
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
