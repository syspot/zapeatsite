package br.com.zapeat.site.faces;

import java.io.IOException;

import javax.faces.bean.ManagedBean;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.faces.TSMainFaces;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.ZapeatUtil;

@ManagedBean(name="indicacaoFaces")
public class IndicacaoFaces extends TSMainFaces {
	
	public String naoIndicar(){
		
		Long categoriaId = ZapeatUtil.getPageParamFormatado(super.getRequestParameter("categoriaId"));
		Long estabelecimentoId = ZapeatUtil.getPageParamFormatado(super.getRequestParameter("estabelecimentoId"));
		String comentario = super.getRequestParameter("comentario");
		
		if(!TSUtil.isEmpty(estabelecimentoId)){
			
			UsuarioModel model = (UsuarioModel) TSFacesUtil.getObjectInSession(Constantes.USUARIO_LOGADO);

			if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

				ComentarioModel comentarioModel = new ComentarioModel();
				
				comentarioModel.setUsuarioModel(model);
				comentarioModel.setDescricao(comentario);
				comentarioModel.setFornecedorModel(new FornecedorModel(estabelecimentoId));

				ComentarioModel coment = new ComentarioDAO().obterIndicacaoComidaPositiva(comentarioModel);

				if (TSUtil.isEmpty(coment)) {

					try {

						comentarioModel.setFlagNaoIndicaComida(Boolean.TRUE);

						new ComentarioDAO().inserir(comentarioModel);

						super.addInfoMessage("Opera��o realizada com sucesso!");
						
						this.redirect(categoriaId);

					} catch (Exception e) {

						e.printStackTrace();
						
					}

				} else {

					super.addErrorMessage(model.getNome() + " voc� j� realizou essa opera��o!");
				}

			} else {

				super.addErrorMessage("Voc� precisa estar logado para realizar a opera��o!");
			}
			
		}
		
		TSFacesUtil.addObjectInRequest("categoriaId", categoriaId);
		TSFacesUtil.addObjectInRequest("estabelecimentoId", estabelecimentoId);
		
		//this.redirect(categoriaId);
		
		return null;
		
	}
	
	private void redirect(Long categoriaId){
		try {
			
			//TSFacesUtil.getResponse().sendRedirect("http://localhost/ranking.jsf?categoriaId="+categoriaId);
			TSFacesUtil.getFacesContext().getExternalContext().redirect("ranking.jsf?categoriaId="+categoriaId);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
