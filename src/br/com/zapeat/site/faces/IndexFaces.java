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

	private PromocaoModel promocao;
	
	private List<PromocaoModel> promocoes;
	private List<FornecedorModel> topGeral;

	public IndexFaces() {

		PromocaoDAO promocaoDAO = new PromocaoDAO();
		
		Long cidadeId = (Long)TSFacesUtil.getObjectInSession("cidadeId");
		
		this.promocao = promocaoDAO.obterPromocaoHoraAleatoria(null, null, cidadeId);

		if(TSUtil.isEmpty(this.promocao)){
			this.promocao = promocaoDAO.obterPromocaoDiaAleatoria(null, null, cidadeId);
		} 
		
		if(TSUtil.isEmpty(this.promocao)){
			this.promocao = promocaoDAO.obterPromocaoSemanaAleatoria(null, null, cidadeId);
		} 
		
		if (!TSUtil.isEmpty(this.promocao) && !TSUtil.isEmpty(this.promocao.getId())) {
			
			if(TSUtil.isEmpty(this.promocao.getImagemPromocao())){
				
				ImagemModel imagemModel = new ImagemFornecedorDAO().obterAleatorio(this.promocao.getFornecedorModel());
				
				this.promocao.setImagemPromocao(imagemModel.getImagem());
				
			}
			
			this.promocoes = promocaoDAO.pesquisarPromocoes(this.promocao, (Long)TSFacesUtil.getObjectInSession("cidadeId"));
			
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

	public List<FornecedorModel> getTopGeral() {
		return topGeral;
	}

	public void setTopGeral(List<FornecedorModel> topGeral) {
		this.topGeral = topGeral;
	}

	public PromocaoModel getPromocao() {
		return promocao;
	}

	public void setPromocao(PromocaoModel promocao) {
		this.promocao = promocao;
	}

	public List<PromocaoModel> getPromocoes() {
		return promocoes;
	}

	public void setPromocoes(List<PromocaoModel> promocoes) {
		this.promocoes = promocoes;
	}

}
