package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.FornecedorModel;

public class FornecedorDAO {

	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarHome() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarHome");

		return broker.getCollectionBean(FornecedorModel.class, "id", "logoMarca", "nomeFantasia");

	}

	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarTopGeral() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarTopGeral");

		return broker.getCollectionBean(FornecedorModel.class, "id", "nomeFantasia", "quantidadeIndicacoes");

	}

}
