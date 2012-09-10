package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.PromocaoModel;

@ManagedBean
public class ListagemFaces extends TSMainFaces {

	private PromocaoDAO promocaoDAO;
	
	private List<PromocaoModel> promocoes;
	
	private Long qtdPaginas;
	
	public ListagemFaces(){
		
		String page = super.getRequestParameter("page");
		
		this.promocaoDAO = new PromocaoDAO();
		
		if(!TSUtil.isEmpty(page)){
			
			Integer pagina = null;
			
			try{
				pagina = Integer.valueOf(page);
			} catch(NumberFormatException e){}
			
			this.promocoes = this.promocaoDAO.pesquisarPorIndicacoes(pagina);
			
		} else{
			
			this.promocoes = this.promocaoDAO.pesquisarPorIndicacoes(null);
			
		}
		
		this.qtdPaginas = this.promocaoDAO.obterQtdPaginasPorIndicacoes().getValue();
		
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
