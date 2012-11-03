package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.CategoriaDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;

@ViewScoped
@ManagedBean(name = "rankingFaces")
public class RankingFaces extends TSMainFaces {

	private List<FornecedorModel> melhorComida;
	private List<FornecedorModel> melhorAmbiente;
	private ComentarioModel comentarioModel;
	private CategoriaModel categoriaModel;
	private String indico;

	private String comentario;

	public RankingFaces() {

		this.carregaDados();

		this.getParametrosIndicacao();

	}

	private void carregaDados() {

		String categoriaId = TSFacesUtil.getRequestParameter("categoriaId");

		if (!TSUtil.isEmpty(categoriaId) && TSUtil.isNumeric(categoriaId)) {

			this.categoriaModel = new CategoriaDAO().obter(new Long(categoriaId));

			this.melhorComida = new FornecedorDAO().pesquisarMelhorComida(categoriaModel);

			this.melhorAmbiente = new FornecedorDAO().pesquisarMelhorAtendimento(categoriaModel, (Long)TSFacesUtil.getObjectInSession("cidadeId"));

			this.setarCss();

		} else {

			this.redirect();
		}

	}

	private void getParametrosIndicacao() {

		String estabelecimentoId = TSFacesUtil.getRequestParameter("estabelecimentoId");

		this.indico = TSFacesUtil.getRequestParameter("indico");

		if (!TSUtil.isEmpty(estabelecimentoId) && TSUtil.isNumeric(estabelecimentoId) && !TSUtil.isEmpty(this.indico) && TSUtil.isNumeric(this.indico)) {

			this.comentarioModel.getFornecedorModel().setId(Long.valueOf(estabelecimentoId));

		}

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

		count = 1;

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

	public ComentarioModel getComentarioModel() {
		return comentarioModel;
	}

	public void setComentarioModel(ComentarioModel comentarioModel) {
		this.comentarioModel = comentarioModel;
	}

	public String getIndico() {
		return indico;
	}

	public void setIndico(String indico) {
		this.indico = indico;
	}

	public CategoriaModel getCategoriaModel() {
		return categoriaModel;
	}

	public void setCategoriaModel(CategoriaModel categoriaModel) {
		this.categoriaModel = categoriaModel;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

}
