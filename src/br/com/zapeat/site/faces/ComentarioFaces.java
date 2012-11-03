package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.ComentarioDAO;
import br.com.zapeat.site.model.ComentarioModel;

@ManagedBean
public class ComentarioFaces {

	private ComentarioModel comentarioModel;
	
	public ComentarioFaces() {
		this.comentarioModel = new ComentarioDAO().obterIndicacao((Long)TSFacesUtil.getObjectInSession("cidadeId"));
	}

	public ComentarioModel getComentarioModel() {
		return comentarioModel;
	}

	public void setComentarioModel(ComentarioModel comentarioModel) {
		this.comentarioModel = comentarioModel;
	}
	
	
}
