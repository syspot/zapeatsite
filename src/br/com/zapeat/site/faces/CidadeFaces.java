package br.com.zapeat.site.faces;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.CidadeDAO;
import br.com.zapeat.site.model.CidadeModel;

@ManagedBean
public class CidadeFaces extends TSMainFaces {

	private List<CidadeModel> cidades;
	private String cidadeSelecionada;
	
	public CidadeFaces() {

		this.cidades = new CidadeDAO().pesquisarTodos();
		this.cidadeSelecionada = (String) super.getRequestParameter("cidade");
		
		if(!TSUtil.isEmpty(this.cidadeSelecionada)){
			try {
				this.cidadeSelecionada = new String (cidadeSelecionada.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} 
		}
		
		CidadeModel cidadeModel = new CidadeDAO().obter(getCidade(), getEstado());
		
		if(!TSUtil.isEmpty(cidadeModel)){
			super.addObjectInSession("cidadeId", cidadeModel.getId());
		}
		
	}
	
	private String getCidade(){
		return TSUtil.isEmpty(cidadeSelecionada) ? cidadeSelecionada : cidadeSelecionada.split("-")[0]; 
	}
	
	private String getEstado(){
		return TSUtil.isEmpty(cidadeSelecionada) ? cidadeSelecionada : cidadeSelecionada.split("-").length < 2 ? cidadeSelecionada.split("-")[0] : cidadeSelecionada.split("-")[cidadeSelecionada.split("-").length-1]; 
	}

	public List<CidadeModel> getCidades() {
		return cidades;
	}

	public void setCidades(List<CidadeModel> cidades) {
		this.cidades = cidades;
	}

	public String getCidadeSelecionada() {
		return cidadeSelecionada;
	}

	public void setCidadeSelecionada(String cidadeSelecionada) {
		this.cidadeSelecionada = cidadeSelecionada;
	}

}
