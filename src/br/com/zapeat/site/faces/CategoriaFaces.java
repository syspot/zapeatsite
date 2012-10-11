package br.com.zapeat.site.faces;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CategoriaDAO;
import br.com.zapeat.site.model.CategoriaModel;

@ManagedBean(name = "categoriaFaces")
public class CategoriaFaces extends TSMainFaces {

	private List<CategoriaModel> categorias;

	public CategoriaFaces() {

		this.carregaDados();

	}

	private void carregaDados() {

		this.setCategorias(new CategoriaDAO().pesquisar());

		if (TSUtil.isEmpty(this.getCategorias())) {

			this.setCategorias(new ArrayList<CategoriaModel>());
		}
	}

	public List<CategoriaModel> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<CategoriaModel> categorias) {
		this.categorias = categorias;
	}

}
