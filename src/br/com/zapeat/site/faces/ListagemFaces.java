package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CarroChefeDAO;
import br.com.zapeat.site.dao.CategoriaDAO;
import br.com.zapeat.site.dao.PromocaoDAO;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.PromocaoModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class ListagemFaces extends TSMainFaces {

	private List<PromocaoModel> promocoes;
	private List<CarroChefeModel> carrosChefes;
	
	private CategoriaModel categoria;
	
	private Long tipo;
	
	private Long qtdPaginas;
	
	private Long page;
	
	public ListagemFaces(){
		
		this.page = ZapeatUtil.getParamFormatado(super.getRequestParameter("page"));
		this.tipo = ZapeatUtil.getParamFormatado(super.getRequestParameter("tipo"));
		Long categoriaId = ZapeatUtil.getParamFormatado(super.getRequestParameter("categoriaId"));
		
		if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_CARRO_CHEFE.equals(tipo)){
			
			CarroChefeDAO carroChefeDAO = new CarroChefeDAO();
			this.carrosChefes = carroChefeDAO.pesquisarPorCategoria(categoriaId, this.page);
			this.qtdPaginas = carroChefeDAO.obterQtdPaginasPorCategoria(categoriaId).getValue();
			
		} else{
			
			PromocaoDAO promocaoDAO = new PromocaoDAO();
			this.promocoes = promocaoDAO.pesquisarPorIndicacoes(this.page, tipo, categoriaId);
			this.qtdPaginas = promocaoDAO.obterQtdPaginasPorIndicacoes(tipo, categoriaId).getValue();
			
		}
		
		categoria = new CategoriaDAO().obter(categoriaId);
		
		if(TSUtil.isEmpty(categoria)){
			categoria = new CategoriaModel("Mais Indicados", "icons maisIndicados");
			categoria.setId(Constantes.CATEGORIA_MAIS_INDICADOS);
		}
		
	}
	
	public boolean isTipoPromocao(){
		return !TSUtil.isEmpty(promocoes);
	}
	
	public boolean isTipoCarroChefe(){
		return !TSUtil.isEmpty(carrosChefes);
	}
	
	public String getNomeTipo(){
		
		String nomeTipo = "Estabelecimentos";
				
		if(!TSUtil.isEmpty(tipo)){
			
			switch(this.tipo.intValue()){
			
				case(1): nomeTipo = "Promoção da Hora"; break; 
				case(2): nomeTipo = "Promoção do Dia"; break; 
				case(3): nomeTipo = "Promoção da Semana"; break; 
				case(5): nomeTipo = "Carro Chefe"; break;
				default: break;
				
			}
			
		} 
		return nomeTipo;
	}
	
	public String getPosicaoCentralMaps(){
		
		if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_CARRO_CHEFE.equals(tipo)){
			
			return TSUtil.isEmpty(this.carrosChefes) ? "-12.0, -38.0" : this.carrosChefes.get(0).getFornecedorModel().getLatitude() + ", " + this.carrosChefes.get(0).getFornecedorModel().getLongitude();
			
		} else{
			
			return TSUtil.isEmpty(this.promocoes) ? "-12.0, -38.0" : this.promocoes.get(0).getFornecedorModel().getLatitude() + ", " + this.promocoes.get(0).getFornecedorModel().getLongitude();
			
		}
	}
	
	public String getPosicoesMaps(){
		
		if(!TSUtil.isEmpty(tipo) && Constantes.TIPO_LISTAGEM_CARRO_CHEFE.equals(tipo)){
			
			return this.carrosChefes.toString();
			
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
