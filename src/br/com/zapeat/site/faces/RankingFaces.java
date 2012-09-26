package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.UsuarioModel;

@ViewScoped
@ManagedBean(name = "rankingFaces")
public class RankingFaces extends TSMainFaces {

	private List<FornecedorModel> melhorComida;
	private List<FornecedorModel> melhorAmbiente;
	private UsuarioModel usuarioModel;

	public RankingFaces() {

		this.carregaDados();
		

	}

	private void carregaDados() {

		String categoriaId = TSFacesUtil.getRequestParameter("categoriaId");

		if (!TSUtil.isEmpty(categoriaId) && TSUtil.isNumeric(categoriaId)) {

			CategoriaModel categoriaModel = new CategoriaModel(new Long(categoriaId));

			this.melhorComida = new FornecedorDAO().pesquisarMelhorComida(categoriaModel);

			this.melhorAmbiente = new FornecedorDAO().pesquisarMelhorAtendimento(categoriaModel);
			
			this.setarCss();
			
			this.setUsuarioModel(new UsuarioModel());

		} else {

			this.redirect();
		}

	}
	
	public String indicar(){
		
		
		
		return null;
	}

	private void setarCss() {

		int count = 1;

		for (FornecedorModel item : this.melhorAmbiente) {

			if (count == 1) {

				item.setCss("position1");

			} else if (count == 2) {

				item.setCss("position2");

			} else if (count == 3) {

				item.setCss("position3");

			} else if (count == 4) {

				item.setCss("position4");

			} else {

				item.setCss("position5");
			}

			count++;
		}
		
		for (FornecedorModel item : this.melhorComida) {

			if (count == 1) {

				item.setCss("position1");

			} else if (count == 2) {

				item.setCss("position2");

			} else if (count == 3) {

				item.setCss("position3");

			} else if (count == 4) {

				item.setCss("position4");

			} else {

				item.setCss("position5");
			}

			count++;
		}
	}

	private void redirect() {

		try {

			TSFacesUtil.getFacesContext().getExternalContext().redirect("index.jsf");

		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public List<FornecedorModel> getMelhorComida() {
		return melhorComida;
	}

	public void setMelhorComida(List<FornecedorModel> melhorComida) {
		this.melhorComida = melhorComida;
	}

	public List<FornecedorModel> getMelhorAmbiente() {
		return melhorAmbiente;
	}

	public void setMelhorAmbiente(List<FornecedorModel> melhorAmbiente) {
		this.melhorAmbiente = melhorAmbiente;
	}

	public UsuarioModel getUsuarioModel() {
		return usuarioModel;
	}

	public void setUsuarioModel(UsuarioModel usuarioModel) {
		this.usuarioModel = usuarioModel;
	}

}
