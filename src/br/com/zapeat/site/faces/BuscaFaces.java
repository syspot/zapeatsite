package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.BuscaDAO;
import br.com.zapeat.site.model.BuscaModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class BuscaFaces extends TSMainFaces {

	private BuscaDAO buscaDAO;
	
	private String termoBuscado;
	
	private String localBuscado;
	
	private List<BuscaModel> listagem;
	
	private Long qtdPaginas;
	
	private Long page;
	
	public BuscaFaces(){
		this.init();
	}
	
	private void init() {
		
		this.page = ZapeatUtil.getPageParamFormatado(super.getRequestParameter("page"));
		
		this.buscaDAO = new BuscaDAO();
			
		this.listagem = this.buscaDAO.pesquisarPorTexto(this.termoBuscado, this.localBuscado, this.page);
		
		this.qtdPaginas = this.buscaDAO.obterQtdPaginasPorTexto(this.termoBuscado, localBuscado).getValue();
		
	}

	public String buscar(){
		
		this.init();
		
		return "pesquisar";
		
	}
	
	public Long getPaginaInicial(){
		return this.page < 11 ? 1 : this.page - 9;
	}
	
	public Long getPaginaFinal(){
		return this.page < 11 ? this.qtdPaginas > 10 ? 10 : this.qtdPaginas : this.page;
	}
	
	public String getPosicaoCentralMaps(){
		return TSUtil.isEmpty(this.listagem) ? "-12.0, -38.0" : this.listagem.get(0).getLatitude() + ", " + this.listagem.get(0).getLongitude();
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
