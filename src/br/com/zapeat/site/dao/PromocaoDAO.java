package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.Model;
import br.com.zapeat.site.model.PromocaoModel;

public class PromocaoDAO {

	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPorIndicacoes(Long page, Long tipoPromocao, Long categoriaId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarporindicacoes", tipoPromocao, categoriaId, page);

		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.latitude", "fornecedorModel.longitude", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "descricao", "titulo", "indicacoes");

	}

	public Model obterQtdPaginasPorIndicacoes(Long tipoPromocao, Long categoriaId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarqtdpaginasporindicacoes", tipoPromocao, categoriaId);

		return (Model) broker.getObjectBean(Model.class, "value");

	}

	public PromocaoModel obterPromocaoHora() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoHora");

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}

	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPromocoesHora() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarPromocoesHora");

		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude", "fornecedorModel.site","indicacoes", "fornecedorModel.telefone");

	}

	public PromocaoModel obterPromocaoDia(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoDia", model.getId());

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagemPromocao", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}

	public PromocaoModel obterPromocaoSemana(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoSemana", model.getId());

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagemPromocao", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}
	
	public PromocaoModel obter(Long id) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obter", id);

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.horariosFuncionamento", "fornecedorModel.logradouro", "fornecedorModel.numero", "fornecedorModel.bairro", "fornecedorModel.telefone", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.css", "imagemPromocao", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}

}
