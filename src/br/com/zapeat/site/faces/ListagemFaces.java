package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.PromocaoModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class ListagemFaces extends TSMainFaces {

	private PromocaoDAO promocaoDAO;
	
	private List<PromocaoModel> promocoes;
	
	private Long qtdPaginas;
	
	public ListagemFaces(){
		
		Long page = ZapeatUtil.getParamFormatado(super.getRequestParameter("page"));
		Long tipoPromocao = ZapeatUtil.getParamFormatado(super.getRequestParameter("tipo"));
		Long categoriaId = ZapeatUtil.getParamFormatado(super.getRequestParameter("categoriaId"));
		
		this.promocaoDAO = new PromocaoDAO();
		
		this.promocoes = this.promocaoDAO.pesquisarPorIndicacoes(page, tipoPromocao, categoriaId);
		
		this.qtdPaginas = this.promocaoDAO.obterQtdPaginasPorIndicacoes(tipoPromocao, categoriaId).getValue();
		
	}

	public List<PromocaoModel> getPromocoes() {
		return promocoes;
	}

	public void setPromocoes(List<PromocaoModel> promocoes) {
		this.promocoes = promocoes;
	}

	public Long getQtdPaginas() {
		return qtdPaginas;
	}

	public void setQtdPaginas(Long qtdPaginas) {
		this.qtdPaginas = qtdPaginas;
	}
	
	
}
