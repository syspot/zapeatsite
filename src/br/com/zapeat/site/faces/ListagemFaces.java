package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
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
		
		Integer page = ZapeatUtil.getParamFormatado(super.getRequestParameter("page"));
		Integer tipoPromocao = ZapeatUtil.getParamFormatado(super.getRequestParameter("tipo"));
		Integer categoriaId = ZapeatUtil.getParamFormatado(super.getRequestParameter("categoriaId"));
		
		this.promocaoDAO = new PromocaoDAO();
		
		if(!TSUtil.isEmpty(page)){
			
			this.promocoes = this.promocaoDAO.pesquisarPorIndicacoes(page, tipoPromocao, categoriaId);
			
		} else{
			
			this.promocoes = this.promocaoDAO.pesquisarPorIndicacoes(null, tipoPromocao, categoriaId);
			
		}
		
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
