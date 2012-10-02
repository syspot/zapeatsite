package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;

@ViewScoped
@ManagedBean(name = "rankingFaces")
public class RankingFaces extends TSMainFaces {

	private List<FornecedorModel> melhorComida;
	private List<FornecedorModel> melhorAmbiente;
	private ComentarioModel comentarioModel;
	private CategoriaModel categoriaModel;
	private String indico;

	public RankingFaces() {

		this.initComentario();

		this.carregaDados();

		this.getParametrosIndicacao();

		this.indicacaoPositiva();

		this.indicacaoNegativa();

		this.indicarEstabelecimento();

	}

	private void carregaDados() {

		String categoriaId = TSFacesUtil.getRequestParameter("categoriaId");

		if (!TSUtil.isEmpty(categoriaId) && TSUtil.isNumeric(categoriaId)) {

			this.categoriaModel = new CategoriaModel(new Long(categoriaId));

			this.melhorComida = new FornecedorDAO().pesquisarMelhorComida(categoriaModel);

			this.melhorAmbiente = new FornecedorDAO().pesquisarMelhorAtendimento(categoriaModel);

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

	public String indicarEstabelecimento() {

		if (!TSUtil.isEmpty(this.indico) && TSUtil.isNumeric(this.indico) && this.indico.equals("3")) {

			UsuarioModel model = (UsuarioModel) TSFacesUtil.getObjectInSession(Constantes.USUARIO_LOGADO);

			if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

				this.comentarioModel.setUsuarioModel(model);

				ComentarioModel coment = new ComentarioDAO().obterIndicacaoEstabelecimentoPorUsuario(this.comentarioModel);

				if (TSUtil.isEmpty(coment)) {

					this.comentarioModel.setUsuarioModel(model);

					this.comentarioModel.setFlagIndicaAtendimento(Boolean.TRUE);

					try {

						new ComentarioDAO().inserir(this.comentarioModel);

						this.initComentario();

						super.addInfoMessage("Voto computado com sucesso.");

					} catch (TSApplicationException e) {

						e.printStackTrace();
					}

				} else {

					super.addErrorMessage(model.getNome() + ": O Sr(a) j� indicou essa promo��o");
				}

			} else {

				super.addErrorMessage("Voc� precisa estar logado para realizar a opera��o!");
			}

		}

		return null;
	}

	public String indicacaoPositiva() {

		if (!TSUtil.isEmpty(this.indico) && TSUtil.isNumeric(this.indico) && this.indico.equals("1")) {

			UsuarioModel model = (UsuarioModel) TSFacesUtil.getObjectInSession(Constantes.USUARIO_LOGADO);

			if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

				this.comentarioModel.setUsuarioModel(model);

				ComentarioModel coment = new ComentarioDAO().obterIndicacaoComidaPositiva(this.comentarioModel);

				if (TSUtil.isEmpty(coment)) {

					try {

						this.comentarioModel.setFlagIndicaPromocao(Boolean.TRUE);

						new ComentarioDAO().inserir(this.comentarioModel);

						this.initComentario();

						super.addInfoMessage("Voto computado com sucesso.");

					} catch (TSApplicationException e) {

						e.printStackTrace();
					}

				} else {

					super.addErrorMessage(model.getNome() + ": O Sr(a) j� indicou essa promo��o");
				}

			} else {

				super.addErrorMessage("Voc� precisa estar logado para realizar a opera��o!");
			}
		}

		return null;
	}

	public String indicacaoNegativa() {

		if (!TSUtil.isEmpty(this.indico) && TSUtil.isNumeric(this.indico) && this.indico.equals("2")) {

			UsuarioModel model = (UsuarioModel) TSFacesUtil.getObjectInSession(Constantes.USUARIO_LOGADO);

			if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

				this.comentarioModel.setUsuarioModel(model);

				ComentarioModel coment = new ComentarioDAO().obterIndicacaoComidaPositiva(this.comentarioModel);

				if (TSUtil.isEmpty(coment)) {

					try {

						this.comentarioModel.setFlagIndicaPromocao(Boolean.TRUE);

						new ComentarioDAO().inserir(this.comentarioModel);

						this.initComentario();

						super.addInfoMessage("Voto computado com sucesso.");

					} catch (TSApplicationException e) {

						e.printStackTrace();
					}

				} else {

					super.addErrorMessage(model.getNome() + ": O Sr(a) j� indicou essa promo��o");
				}

			} else {

				super.addErrorMessage("Voc� precisa estar logado para realizar a opera��o!");
			}
		}

		return null;
	}

	private void initComentario() {

		this.setComentarioModel(new ComentarioModel());

		this.getComentarioModel().setFornecedorModel(new FornecedorModel());

		this.getComentarioModel().setUsuarioModel(new UsuarioModel());

		this.getComentarioModel().setFlagIndicaAtendimento(Boolean.FALSE);

		this.getComentarioModel().setFlagIndicaPromocao(Boolean.FALSE);

		this.getComentarioModel().setFlagNaoIndica(Boolean.FALSE);
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

}
