package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.zapeat.site.dao.CategoriaDAO;
import br.com.zapeat.site.model.CategoriaModel;

@ManagedBean
public class CategoriaFaces {

	private List<CategoriaModel> categorias;

	public CategoriaFaces() {

		this.setCategorias(new CategoriaDAO().pesquisar());

	}

	public List<CategoriaModel> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<CategoriaModel> categorias) {
		this.categorias = categorias;
	}

}
