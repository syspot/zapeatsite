package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.Model;
import br.com.zapeat.site.model.PromocaoModel;

public class PromocaoDAO {

	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPorIndicacoes(Long cidadeId, Long page, Long tipoPromocao, Long categoriaId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarporindicacoes", tipoPromocao, categoriaId, page);

		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.latitude", "fornecedorModel.longitude", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.imagem", "descricao", "titulo", "indicacoes", "fornecedorModel.numeroUnico");

	}
	
	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPorIndicacoesMaisIndicados(Long cidadeId, Long page, Long tipoPromocao) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.pesquisarporindicacoesmaisindicados", tipoPromocao, page);
		
		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.latitude", "fornecedorModel.longitude", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.imagem", "descricao", "titulo", "indicacoes", "fornecedorModel.numeroUnico");
		
	}
	
	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPorIndicacoesOutrasCategorias(Long page, Long tipoPromocao) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.pesquisarporindicacoesoutrascategorias", tipoPromocao, page);
		
		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.latitude", "fornecedorModel.longitude", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "descricao", "titulo", "indicacoes", "fornecedorModel.numeroUnico");
		
	}

	public Model obterQtdPaginasPorIndicacoes(Long cidadeId, Long tipoPromocao, Long categoriaId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarqtdpaginasporindicacoes", tipoPromocao, categoriaId);

		return (Model) broker.getObjectBean(Model.class, "value");

	}
	
	public Model obterQtdPaginasPorIndicacoesMaisIndicados(Long cidadeId, Long tipoPromocao) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.pesquisarqtdpaginasporindicacoesmaisindicados", tipoPromocao);
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}
	
	public Model obterQtdPaginasPorIndicacoesOutrasCategorias(Long tipoPromocao) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.pesquisarqtdpaginasporindicacoesoutrascategorias", tipoPromocao);
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}

	public PromocaoModel obterPromocaoHora(Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoHora", cidadeId);

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude", "imagemPromocao", "fornecedorModel.logoMarca");

	}

	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPromocoesHora(PromocaoModel model, Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.pesquisarPromocoesHora", model.getId(), cidadeId);

		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude", "fornecedorModel.site","indicacoes", "fornecedorModel.telefone", "imagemPromocao");

	}
	
	@SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPromocoesHora(Long id) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.pesquisarPromocoesHora", id);
		
		return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude", "fornecedorModel.site","indicacoes", "fornecedorModel.telefone", "imagemPromocao");
		
	}

	public PromocaoModel obterPromocaoDia(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoDia", model.getId());

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagemPromocao", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}
	
	public PromocaoModel obterPromocaoHoraAleatoria(Long promocaoId, Long fornecedorId, Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterpromocaohoraaleatoria", fornecedorId, promocaoId, cidadeId);

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagemPromocao", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}
	
	public PromocaoModel obterPromocaoDiaAleatoria(Long promocaoId, Long fornecedorId, Long cidadeId) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.obterpromocaodiaaleatoria", fornecedorId, promocaoId, cidadeId);
		
		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagemPromocao", "fornecedorModel.longitude", "fornecedorModel.latitude");
		
	}
	
	public PromocaoModel obterPromocaoSemanaAleatoria(Long promocaoId, Long fornecedorId, Long cidadeId) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("promocaodao.obterpromocaosemanaaleatoria", fornecedorId, promocaoId, cidadeId);
		
		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagemPromocao", "fornecedorModel.longitude", "fornecedorModel.latitude");
		
	}

	public PromocaoModel obterPromocaoSemana(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obterPromocaoSemana", model.getId());

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagemPromocao", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}
	
	public PromocaoModel obter(Long id, Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("promocaodao.obter", id, cidadeId);

		return (PromocaoModel) broker.getObjectBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "tipoPromocaoModel.descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.horariosFuncionamento", "fornecedorModel.logradouro", "fornecedorModel.numero", "fornecedorModel.bairro", "fornecedorModel.telefone", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.imagem", "imagemPromocao", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}

}
