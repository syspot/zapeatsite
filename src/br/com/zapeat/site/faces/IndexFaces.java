package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.ImagemFornecedorDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.ImagemModel;
import br.com.zapeat.site.model.PromocaoModel;

@ManagedBean
public class IndexFaces extends CarregaPromocaoFaces {

	private PromocaoModel promocaoHora;
	
	private List<PromocaoModel> promocoesHora;
	private List<FornecedorModel> topGeral;

	public IndexFaces() {

		PromocaoDAO promocaoDAO = new PromocaoDAO();
		
		this.promocaoHora = promocaoDAO.obterPromocaoHora((Long)TSFacesUtil.getObjectInSession("cidadeId"));

		if (!TSUtil.isEmpty(this.promocaoHora) && !TSUtil.isEmpty(this.promocaoHora.getId())) {
			
			if(TSUtil.isEmpty(this.promocaoHora.getImagemPromocao())){
				
				ImagemModel imagemModel = new ImagemFornecedorDAO().obterAleatorio(this.promocaoHora.getFornecedorModel());
				
				this.promocaoHora.setImagemPromocao(imagemModel.getImagem());
				
			}
			
			this.promocoesHora = promocaoDAO.pesquisarPromocoesHora(this.promocaoHora, (Long)TSFacesUtil.getObjectInSession("cidadeId"));
			
		}
		
		this.topGeral = new FornecedorDAO().pesquisarTopGeral((Long)TSFacesUtil.getObjectInSession("cidadeId"));

		int count = 1;

		for (FornecedorModel item : this.topGeral) {
			item.setCss("top" + count++);
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
