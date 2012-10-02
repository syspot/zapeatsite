package br.com.zapeat.site.faces;

import java.io.IOException;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.ImagemFornecedorDAO;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.ImagemFornecedorModel;

@ViewScoped
@ManagedBean(name = "estabelecimentoFaces")
public class EstabelecimentoFaces extends TSMainFaces {

	private FornecedorModel fornecedorModel;
	private List<ImagemFornecedorModel> fotosEstabelecimento;
	private ComentarioModel ranking;
	private FornecedorDAO fornecedorDAO;
	private ImagemFornecedorDAO imagemFornecedorDAO;
	private ComentarioDAO comentarioDAO;

	public EstabelecimentoFaces() {

		this.carregaDados();

	}

	private void carregaDados() {

		String fornecedorId = TSFacesUtil.getRequestParameter("id");

		if (!TSUtil.isEmpty(fornecedorId) && TSUtil.isNumeric(fornecedorId)) {

			this.initDAO();

			this.fornecedorModel = this.fornecedorDAO.obter(new FornecedorModel(new Long(fornecedorId)));

			if (!TSUtil.isEmpty(this.fornecedorModel) && !TSUtil.isEmpty(this.fornecedorModel.getId())) {

				this.fotosEstabelecimento = this.imagemFornecedorDAO.pesquisar(this.fornecedorModel);

				this.ranking = this.comentarioDAO.rankingEstabelecimento(this.fornecedorModel);
				
				this.setarCssFotos();

			} else {

				this.redirect();
			}

		} else {

			this.redirect();
		}

	}

	private void setarCssFotos() {

		int count = 1;

		for (ImagemFornecedorModel item : this.fotosEstabelecimento) {

			if (count == 1) {

				item.setCss("ftoGrande");

			} else if (count == 2) {

				item.setCss("ftoPeq floatLeft");

			} else if (count == 3) {

				item.setCss("ftoPeq floatRight");

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

	private void initDAO() {

		this.fornecedorDAO = new FornecedorDAO();
		this.imagemFornecedorDAO = new ImagemFornecedorDAO();
		this.comentarioDAO = new ComentarioDAO();
	}

	public FornecedorDAO getFornecedorDAO() {
		return fornecedorDAO;
	}

	public void setFornecedorDAO(FornecedorDAO fornecedorDAO) {
		this.fornecedorDAO = fornecedorDAO;
	}
	
	public List<ImagemFornecedorModel> getFotosEstabelecimento() {
		return fotosEstabelecimento;
	}

	public void setFotosEstabelecimento(List<ImagemFornecedorModel> fotosEstabelecimento) {
		this.fotosEstabelecimento = fotosEstabelecimento;
	}

	public ImagemFornecedorDAO getImagemFornecedorDAO() {
		return imagemFornecedorDAO;
	}

	public void setImagemFornecedorDAO(ImagemFornecedorDAO imagemFornecedorDAO) {
		this.imagemFornecedorDAO = imagemFornecedorDAO;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
	}

	public ComentarioDAO getComentarioDAO() {
		return comentarioDAO;
	}

	public void setComentarioDAO(ComentarioDAO comentarioDAO) {
		this.comentarioDAO = comentarioDAO;
	}

	public ComentarioModel getRanking() {
		return ranking;
	}

	public void setRanking(ComentarioModel ranking) {
		this.ranking = ranking;
	}

}
