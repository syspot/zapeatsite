package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.CategoriaModel;

public class CategoriaDAO {

	public CategoriaModel obter(Long id) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("categoriadao.obter", id);

		return (CategoriaModel) broker.getObjectBean(CategoriaModel.class, "id", "descricao", "css");

	}

	@SuppressWarnings("unchecked")
	public List<CategoriaModel> pesquisar() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("categoriadao.pesquisar");

		return broker.getCollectionBean(CategoriaModel.class, "id", "descricao", "flagAtivo", "imagem", "flagDestaque");

	}
}
