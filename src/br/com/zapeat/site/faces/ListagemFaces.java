package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.CategoriaDAO;
import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class ListagemFaces extends TSMainFaces {

	private List<PromocaoModel> promocoes;
	private List<CarroChefeModel> carrosChefes;
	private List<FornecedorModel> fornecedores;
	
	private CategoriaModel categoria;
	
	private Long tipo;
	
	private Long qtdPaginas;
	
	private Long page;
	
	public ListagemFaces(){
		
		this.page = ZapeatUtil.getPageParamFormatado(super.getRequestParameter("page"));
		this.tipo = ZapeatUtil.getParamFormatado(super.getRequestParameter("tipo"));
		Long categoriaId = ZapeatUtil.getParamFormatado(super.getRequestParameter("categoriaId"));
		
		Long cidadeId = (Long) TSFacesUtil.getObjectInSession("cidadeId");
		
		if(!TSUtil.isEmpty(categoriaId) && Constantes.CATEGORIA_MAIS_INDICADOS.equals(categoriaId)){
			
			if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_CARRO_CHEFE.equals(tipo)){
				
				CarroChefeDAO carroChefeDAO = new CarroChefeDAO();
				this.carrosChefes = carroChefeDAO.pesquisarPorCategoriaMaisIndicados(cidadeId, this.page);
				this.qtdPaginas = carroChefeDAO.obterQtdPaginasPorCategoriaMaisIndicados(cidadeId).getValue();
				
			} else if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_ESTABELECIMENTO.equals(tipo)){
				
				FornecedorDAO fornecedorDAO = new FornecedorDAO();
				this.fornecedores = fornecedorDAO.pesquisarPorCategoriaMaisIndicados(cidadeId, this.page);
				this.qtdPaginas = fornecedorDAO.obterQtdPaginasPorCategoriaMaisIndicados(cidadeId).getValue();
				
			} else{
				
				PromocaoDAO promocaoDAO = new PromocaoDAO();
				this.promocoes = promocaoDAO.pesquisarPorIndicacoesMaisIndicados(cidadeId, this.page, tipo);
				this.qtdPaginas = promocaoDAO.obterQtdPaginasPorIndicacoesMaisIndicados(cidadeId, tipo).getValue();
				
			}
			
		} else{
			
			if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_CARRO_CHEFE.equals(tipo)){
				
				CarroChefeDAO carroChefeDAO = new CarroChefeDAO();
				this.carrosChefes = carroChefeDAO.pesquisarPorCategoria(cidadeId, categoriaId, this.page);
				this.qtdPaginas = carroChefeDAO.obterQtdPaginasPorCategoria(cidadeId, categoriaId).getValue();
				
			} else if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_ESTABELECIMENTO.equals(tipo)){
				
				FornecedorDAO fornecedorDAO = new FornecedorDAO();
				this.fornecedores = fornecedorDAO.pesquisarPorCategoria(cidadeId, this.page, categoriaId);
				this.qtdPaginas = fornecedorDAO.obterQtdPaginasPorCategoria(cidadeId,categoriaId).getValue();
				
			} else{
				
				PromocaoDAO promocaoDAO = new PromocaoDAO();
				this.promocoes = promocaoDAO.pesquisarPorIndicacoes(cidadeId, this.page, tipo, categoriaId);
				this.qtdPaginas = promocaoDAO.obterQtdPaginasPorIndicacoes(cidadeId, tipo, categoriaId).getValue();
				
			}
		
		}
		
		categoria = new CategoriaDAO().obter(categoriaId);
		
		if(TSUtil.isEmpty(categoria)){
			categoria = new CategoriaDAO().obter(Constantes.CATEGORIA_MAIS_INDICADOS);
		}
		
	}
	
	public boolean isTipoPromocao(){
		return !TSUtil.isEmpty(promocoes);
	}
	
	public boolean isTipoCarroChefe(){
		return !TSUtil.isEmpty(carrosChefes);
	}
	
	public Long getPaginaInicial(){
		return this.page < 11 ? 1 : this.page - 9;
	}
	
	public Long getPaginaFinal(){
		return this.page < 11 ? this.qtdPaginas > 10 ? 10 : this.qtdPaginas : this.page;
	}
	
	public String getNomeTipo(){
		
		String nomeTipo = "Estabelecimentos";
				
		if(!TSUtil.isEmpty(tipo)){
			
			switch(this.tipo.intValue()){
			
				case(1): nomeTipo = Constantes.ZAPEAT_HORA; break; 
				case(2): nomeTipo = Constantes.ZAPEAT_DIA; break; 
				case(3): nomeTipo = Constantes.ZAPEAT_SEMANA; break; 
				case(5): nomeTipo = "Carro Chefe"; break;
				default: break;
				
			}
			
		} 
		return nomeTipo;
	}
	
	public String getPosicaoCentralMaps(){
		
		if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_CARRO_CHEFE.equals(tipo)){
			
			return TSUtil.isEmpty(this.carrosChefes) ? "-12.0, -38.0" : this.carrosChefes.get(0).getFornecedorModel().getLatitude() + ", " + this.carrosChefes.get(0).getFornecedorModel().getLongitude();
			
		} else if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_ESTABELECIMENTO.equals(tipo)){
			
			return TSUtil.isEmpty(this.fornecedores) ? "-12.0, -38.0" : this.fornecedores.get(0).getLatitude() + ", " + this.fornecedores.get(0).getLongitude();
			
		} else{
			
			return TSUtil.isEmpty(this.promocoes) ? "-12.0, -38.0" : this.promocoes.get(0).getFornecedorModel().getLatitude() + ", " + this.promocoes.get(0).getFornecedorModel().getLongitude();
			
		}
	}
	
	public String getPosicoesMaps(){
		
		if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_CARRO_CHEFE.equals(tipo)){
			
			return this.carrosChefes.toString();
			
		} else if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_ESTABELECIMENTO.equals(tipo)){
			
			return this.fornecedores.toString();
			
		} else{
			
			return this.promocoes.toString();
			
		}

	}
	
	public List<PromocaoModel> getPromocoes() {
		return promocoes;
	}

	public void setPromocoes(List<PromocaoModel> promocoes) {
		this.promocoes = promocoes;
	}

	public List<FornecedorModel> getFornecedores() {
		return fornecedores;
	}

	public void setFornecedores(List<FornecedorModel> fornecedores) {
		this.fornecedores = fornecedores;
	}

	public List<CarroChefeModel> getCarrosChefes() {
		return carrosChefes;
	}

	public void setCarrosChefes(List<CarroChefeModel> carrosChefes) {
		this.carrosChefes = carrosChefes;
	}

	public Long getQtdPaginas() {
		return qtdPaginas;
	}

	public void setQtdPaginas(Long qtdPaginas) {
		this.qtdPaginas = qtdPaginas;
	}

	public CategoriaModel getCategoria() {
		return categoria;
	}

	public void setCategoria(CategoriaModel categoria) {
		this.categoria = categoria;
	}

	public Long getPage() {
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getTipo() {
		return tipo;
	}
	
}
