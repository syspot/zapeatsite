package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.CategoriaModel;
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
	
	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarMelhorAtendimento(CategoriaModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarMelhorAtendimento", model.getId());

		return broker.getCollectionBean(FornecedorModel.class, "id", "nomeFantasia", "quantidadeIndicacoes", "logoMarca");

	}
	
	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarMelhorComida(CategoriaModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarMelhorComida", model.getId());

		return broker.getCollectionBean(FornecedorModel.class, "id", "nomeFantasia", "quantidadeIndicacoes", "logoMarca");

	}

	public FornecedorModel obter(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.obter", model.getId());

		return (FornecedorModel) broker.getObjectBean(FornecedorModel.class,

		"id", "razaoSocial", "cnpj", "nomeFantasia", "cep", "logradouro", "numero", "bairro", "cidadeModel.id", "latitude", "longitude", "logoMarca", "flagAtivo", "descricao", "horariosFuncionamento", "twitter", "facebook", "site", "telefone","quantidadeIndicacoes");

	}

}
