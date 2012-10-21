package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.Model;

public class CategoriaDAO {

	public CategoriaModel obter(Long id) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("categoriadao.obter", id);

		return (CategoriaModel) broker.getObjectBean(CategoriaModel.class, "id", "descricao", "imagem");

	}

	@SuppressWarnings("unchecked")
	public List<CategoriaModel> pesquisar() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("categoriadao.pesquisar");

		return broker.getCollectionBean(CategoriaModel.class, "id", "descricao", "flagAtivo", "imagem", "flagDestaque");

	}
	
	@SuppressWarnings("unchecked")
	public List<CategoriaModel> pesquisarOutrasCategorias(Long page) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("categoriadao.pesquisaroutrascategorias", page);
		
		return broker.getCollectionBean(CategoriaModel.class, "id", "descricao", "flagAtivo", "imagem", "flagDestaque");
		
	}
	
	public Model obterQtdPaginasOutrasCategorias() {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("categoriadao.obterqtdpaginasoutrascategorias");
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}
}
