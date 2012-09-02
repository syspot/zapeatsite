package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.PromocaoModel;

@ManagedBean
public class ListagemFaces extends TSMainFaces {

	private PromocaoDAO promocaoDAO;
	
	private List<PromocaoModel> promocoes;
	
	public ListagemFaces(){
		
		this.promocaoDAO = new PromocaoDAO();
		this.promocoes = this.promocaoDAO.pesquisarPorIndicacoes();
		
	}

	public List<PromocaoModel> getPromocoes() {
		return promocoes;
	}

	public void setPromocoes(List<PromocaoModel> promocoes) {
		this.promocoes = promocoes;
	}
	
	
}
