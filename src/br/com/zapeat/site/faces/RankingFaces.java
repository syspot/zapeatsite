package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.CategoriaDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean(name = "rankingFaces")
public class RankingFaces extends TSMainFaces {

	private List<FornecedorModel> melhorEstabelecimento;
	private CategoriaModel categoriaModel;

	public RankingFaces() {

		String categoriaId = super.getRequestParameter("categoriaId");

		if (!TSUtil.isEmpty(categoriaId) && TSUtil.isNumeric(categoriaId)) {

			this.categoriaModel = new CategoriaDAO().obter(new Long(categoriaId));

			this.melhorEstabelecimento = new FornecedorDAO().pesquisarTop10(categoriaModel, (Long)TSFacesUtil.getObjectInSession("cidadeId"));

			int count = 1;
			
			for (FornecedorModel item : this.melhorEstabelecimento) {
				item.setCss("position" + count++);
			}

		} else {

			ZapeatUtil.redirect();
		}

	}

	public CategoriaModel getCategoriaModel() {
		return categoriaModel;
	}

	public void setCategoriaModel(CategoriaModel categoriaModel) {
		this.categoriaModel = categoriaModel;
	}

	public List<FornecedorModel> getMelhorEstabelecimento() {
		return melhorEstabelecimento;
	}

	public void setMelhorEstabelecimento(List<FornecedorModel> melhorEstabelecimento) {
		this.melhorEstabelecimento = melhorEstabelecimento;
	}

}
