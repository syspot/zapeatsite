package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CidadeDAO;
import br.com.zapeat.site.model.CidadeModel;

@ManagedBean
public class CidadeFaces extends TSMainFaces {

	private List<CidadeModel> cidades;
	
	public CidadeFaces() {
		this.cidades = new CidadeDAO().pesquisarTodos();
	}

	public List<CidadeModel> getCidades() {
		return cidades;
	}

	public void setCidades(List<CidadeModel> cidades) {
		this.cidades = cidades;
	}
	
}
