package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CidadeDAO;
import br.com.zapeat.site.model.CidadeModel;

@ManagedBean
public class CidadeFaces extends TSMainFaces {

	private List<CidadeModel> cidades;
	private String cidadeSelecionada;
	
	public CidadeFaces() {
		this.cidades = new CidadeDAO().pesquisarTodos();
		this.cidadeSelecionada = (String) super.getObjectInRequest("cidade");
	}

	public List<CidadeModel> getCidades() {
		return cidades;
	}

	public void setCidades(List<CidadeModel> cidades) {
		this.cidades = cidades;
	}

	public String getCidadeSelecionada() {
		return cidadeSelecionada;
	}

	public void setCidadeSelecionada(String cidadeSelecionada) {
		this.cidadeSelecionada = cidadeSelecionada;
	}

}
