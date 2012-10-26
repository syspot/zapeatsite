package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CategoriaDAO;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean(name = "listagemCategoriaFaces")
public class ListagemCategoriaFaces extends TSMainFaces {

	private List<CategoriaModel> outrasCategorias;
	
	private Long qtdPaginas;
	
	private Long page;
	
	public ListagemCategoriaFaces(){
		
		this.page = ZapeatUtil.getPageParamFormatado(super.getRequestParameter("page"));
		
		CategoriaDAO categoriaDAO = new CategoriaDAO();
		
		this.outrasCategorias = categoriaDAO.pesquisarOutrasCategorias(this.page);
				
		this.qtdPaginas = categoriaDAO.obterQtdPaginasOutrasCategorias().getValue();
		
	}
	
	public Long getPaginaInicial(){
		return this.page < 11 ? 1 : this.page - 9;
	}
	
	public Long getPaginaFinal(){
		return this.page < 11 ? this.qtdPaginas > 10 ? 10 : this.qtdPaginas : this.page;
	}

	public List<CategoriaModel> getOutrasCategorias() {
		return outrasCategorias;
	}

	public void setOutrasCategorias(List<CategoriaModel> outrasCategorias) {
		this.outrasCategorias = outrasCategorias;
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
