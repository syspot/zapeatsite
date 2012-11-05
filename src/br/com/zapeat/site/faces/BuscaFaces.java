package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSStringUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.BuscaDAO;
import br.com.zapeat.site.dao.CidadeDAO;
import br.com.zapeat.site.model.BuscaModel;
import br.com.zapeat.site.model.CidadeModel;
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
		
		Long cidadeId = (Long)TSFacesUtil.getObjectInSession("cidadeId");
			
		this.listagem = this.buscaDAO.pesquisarPorTexto(this.termoBuscado, cidadeId, this.page);
		
		this.qtdPaginas = this.buscaDAO.obterQtdPaginasPorTexto(this.termoBuscado, cidadeId).getValue();
		
	}

	public String buscar(String cidade){
		
		if (TSUtil.isEmpty(termoBuscado)){
			
			if(!TSUtil.isEmpty(cidade)){
				
				cidade = ZapeatUtil.tratarCidadeUTF8(TSStringUtil.removerAcentos(cidade));
				
				CidadeModel cidadeModel = new CidadeDAO().obter(ZapeatUtil.getCidade(cidade), ZapeatUtil.getEstado(cidade));
				
				if(!TSUtil.isEmpty(cidadeModel)){
					super.addObjectInSession("cidadeId", cidadeModel.getId());
				}
			}
			
			ZapeatUtil.redirect(cidade);
		}
		
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
