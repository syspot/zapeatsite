package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.Model;
import br.com.zapeat.site.model.PromocaoModel;

public class PromocaoDAO {

	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPorIndicacoes(Integer page) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarporindicacoes", page);

		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "descricao", "titulo", "indicacoes");

	}
	
	public Model obterQtdPaginasPorIndicacoes() {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.pesquisarqtdpaginasporindicacoes");
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}

	public PromocaoModel obterPromocaoHora() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoHora");

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo");

	}

	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPromocoesHora() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarPromocoesHora");

		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo");

	}

	public PromocaoModel obterPromocaoDia() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoDia");

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo");

	}

	public PromocaoModel obterPromocaoSemana() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoSemana");

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo");

	}

}
