package br.com.zapeat.site.faces;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.BuscaDAO;
import br.com.zapeat.site.model.BuscaModel;
import br.com.zapeat.site.model.CidadeModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class BuscaFaces extends TSMainFaces {

	private BuscaDAO buscaDAO;
	
	private String termoBuscado;
	
	private CidadeModel cidade;
	
	private String localBuscado;
	
	private List<BuscaModel> listagem;
	
	private Long qtdPaginas;
	
	private Long page;
	
	public BuscaFaces(){
		this.cidade = new CidadeModel();
		this.buscar();
	}
	
	public String buscar(){
		
		this.page = ZapeatUtil.getPageParamFormatado(super.getRequestParameter("page"));
		
		this.buscaDAO = new BuscaDAO();
			
		this.listagem = this.buscaDAO.pesquisarPorTexto(this.termoBuscado, this.page);
		
		this.qtdPaginas = this.buscaDAO.obterQtdPaginasPorTexto(this.termoBuscado).getValue();
		
		return null;
		
	}
	
	public List<String> completeCidades(String query) {
		
		List<String> lista = new ArrayList<String>();
		
		lista.add("teste2");
		lista.add("teste2");
		lista.add("teste3");
		
		return lista;
    }  
	
	public List<BuscaModel> getListagem() {
		return listagem;
	}

	public void setListagem(List<BuscaModel> listagem) {
		this.listagem = listagem;
	}

	public String getTermoBuscado() {
		return termoBuscado;
	}

	public void setTermoBuscado(String termoBuscado) {
		this.termoBuscado = termoBuscado;
	}

	public CidadeModel getCidade() {
		return cidade;
	}

	public void setCidade(CidadeModel cidade) {
		this.cidade = cidade;
	}

	public String getLocalBuscado() {
		return localBuscado;
	}

	public void setLocalBuscado(String localBuscado) {
		this.localBuscado = localBuscado;
	}

	public Long getQtdPaginas() {
		return qtdPaginas;
	}

	public void setQtdPaginas(Long qtdPaginas) {
		this.qtdPaginas = qtdPaginas;
	}

	public Long getPage() {
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

}
