package br.com.zapeat.site.faces;

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
	
	
	private void executarIndicacao(ComentarioModel comentarioModel){
		
		Long estabelecimentoId = ZapeatUtil.getParamFormatado(super.getRequestParameter("estabelecimentoId"));
		String comentario = super.getRequestParameter("comentario");

		if(!TSUtil.isEmpty(estabelecimentoId)){
			
			UsuarioModel model = (UsuarioModel) TSFacesUtil.getObjectInSession(Constantes.USUARIO_LOGADO);

			if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

				comentarioModel.setUsuarioModel(model);
				comentarioModel.setDescricao(comentario);
				comentarioModel.setFornecedorModel(new FornecedorModel(estabelecimentoId));

				ComentarioModel coment = new ComentarioDAO().obterIndicacaoComidaPositiva(comentarioModel);

				if (TSUtil.isEmpty(coment)) {

					try {

						new ComentarioDAO().inserir(comentarioModel);

						super.addInfoMessage("Voto computado com sucesso!");
						
					} catch (Exception e) {

						e.printStackTrace();
						
					}

				} else {

					super.addErrorMessage(model.getNome() + ": O Sr(a) já indicou essa promoção!");
				}

			} else {

				super.addErrorMessage("Você precisa estar logado para realizar a operação!");
			}
			
		}
		
	}
	
	public String indicarComida(){
		
		ComentarioModel comentarioModel = new ComentarioModel();
		
		comentarioModel.setFlagIndicaComida(Boolean.TRUE);
		
		this.executarIndicacao(comentarioModel);
		
		return null;
		
	}
	
	public String indicarAmbiente(){
		
		ComentarioModel comentarioModel = new ComentarioModel();
		
		comentarioModel.setFlagIndicaAmbiente(Boolean.TRUE);
		
		this.executarIndicacao(comentarioModel);
		
		return null;
		
	}
	
	public String naoIndicar(){
		
		ComentarioModel comentarioModel = new ComentarioModel();
		
		comentarioModel.setFlagNaoIndicaComida(Boolean.TRUE);
		
		this.executarIndicacao(comentarioModel);
		
		return null;
		
	}
	
}
