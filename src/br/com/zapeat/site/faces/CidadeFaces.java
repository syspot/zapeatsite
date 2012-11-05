package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSStringUtil;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.CidadeDAO;
import br.com.zapeat.site.model.CidadeModel;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean
public class CidadeFaces extends TSMainFaces {

	private List<CidadeModel> cidades;
	private String cidadeSelecionada;
	
	public CidadeFaces() {

		this.cidades = new CidadeDAO().pesquisarTodos();
		this.cidadeSelecionada = (String) super.getRequestParameter("cidade");
		
		if(!TSUtil.isEmpty(this.cidadeSelecionada)){
			
			this.cidadeSelecionada = ZapeatUtil.tratarCidadeUTF8(TSStringUtil.removerAcentos(this.cidadeSelecionada));
			
		} else {
			
			Long cidadeId = (Long)TSFacesUtil.getObjectInSession("cidadeId");
			
			if(!TSUtil.isEmpty(cidadeId)){
				
				CidadeModel cidade = new CidadeDAO().obter(new CidadeModel(cidadeId));
				
				if(!TSUtil.isEmpty(cidade)){
					this.cidadeSelecionada = cidade.toString();
				}
			}
			
		}
		
		CidadeModel cidadeModel = new CidadeDAO().obter(ZapeatUtil.getCidade(this.cidadeSelecionada), ZapeatUtil.getEstado(this.cidadeSelecionada));
		
		if(!TSUtil.isEmpty(cidadeModel)){
			super.addObjectInSession("cidadeId", cidadeModel.getId());
		}
		
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
