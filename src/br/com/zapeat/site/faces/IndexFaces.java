package br.com.zapeat.site.faces;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;

@ManagedBean(name = "indexFaces")
public class IndexFaces extends TSMainFaces {

	private PromocaoModel promocaoHora;
	
	private List<PromocaoModel> promocoesHora;
	private List<FornecedorModel> topGeral;

	public IndexFaces() {

		this.initObjetos();
		this.carregaDados();

	}

	private void initObjetos() {

		this.promocoesHora = new ArrayList<PromocaoModel>();
		this.topGeral = new ArrayList<FornecedorModel>();

	}

	private void carregaDados() {
		
		PromocaoDAO promocaoDAO = new PromocaoDAO();
		
		this.promocaoHora = promocaoDAO.obterPromocaoHora();

		if (!TSUtil.isEmpty(this.promocaoHora) && !TSUtil.isEmpty(this.promocaoHora.getId())) {
			
			this.promocoesHora = promocaoDAO.pesquisarPromocoesHora(this.promocaoHora);
				
		}
		
		this.topGeral = new FornecedorDAO().pesquisarTopGeral((Long)TSFacesUtil.getObjectInSession("cidadeId"));

		this.setarCssTopGeral();

	}
	
	private void setarCssTopGeral() {

		int count = 1;

		for (FornecedorModel item : this.topGeral) {

			if (count == 1) {

				item.setCss("hum");

			} else if (count == 2) {

				item.setCss("dois");

			} else if (count == 3) {

				item.setCss("tres");

			} else if (count == 4) {

				item.setCss("quatro");

			} else {

				item.setCss("cinco");
			}

			count++;
		}
	}

	public List<PromocaoModel> pesquisarPromocoesHora(Long id) {
		return new PromocaoDAO().pesquisarPromocoesHora(id);
	}

	public List<PromocaoModel> getPromocoesHora() {
		return promocoesHora;
	}

	public void setPromocoesHora(List<PromocaoModel> promocoesHora) {
		this.promocoesHora = promocoesHora;
	}

	public List<FornecedorModel> getTopGeral() {
		return topGeral;
	}

	public void setTopGeral(List<FornecedorModel> topGeral) {
		this.topGeral = topGeral;
	}

	public PromocaoModel getPromocaoHora() {
		return promocaoHora;
	}

	public void setPromocaoHora(PromocaoModel promocaoHora) {
		this.promocaoHora = promocaoHora;
	}

}
