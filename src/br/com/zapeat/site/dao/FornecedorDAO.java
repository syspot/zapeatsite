package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.CategoriaModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.Model;

public class FornecedorDAO {

	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarHome(Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarHome", cidadeId);

		return broker.getCollectionBean(FornecedorModel.class, "id", "logoMarca", "nomeFantasia");

	}

	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarTopGeral(Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarTopGeral", cidadeId);

		return broker.getCollectionBean(FornecedorModel.class, "id", "nomeFantasia", "quantidadeIndicacoes");

	}
	
	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarTop10(CategoriaModel model, Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisartop10", model.getId(), cidadeId);

		return broker.getCollectionBean(FornecedorModel.class, "id", "nomeFantasia", "quantidadeIndicacoes", "logoMarca", "categoriaPrincipal.id", "categoriaPrincipal.descricao");

	}
	
	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarMelhorComida(CategoriaModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarMelhorComida", model.getId());

		return broker.getCollectionBean(FornecedorModel.class, "id", "nomeFantasia", "quantidadeIndicacoes", "logoMarca", "categoriaPrincipal.id", "categoriaPrincipal.descricao");

	}

	public FornecedorModel obter(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.obter", model.getId());

		return (FornecedorModel) broker.getObjectBean(FornecedorModel.class, "id", "razaoSocial", "cnpj", "nomeFantasia", "cep", "logradouro", "numero", "bairro", "cidadeModel.id", "latitude", "longitude", "logoMarca", "flagAtivo", "descricao", "horariosFuncionamento", "twitter", "facebook", "site", "telefone","quantidadeIndicacoes", "imagemThumb", "categoriaPrincipal.id", "categoriaPrincipal.descricao", "categoriaPrincipal.imagem");

	}
	
	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarPorCategoria(Long page, Long categoria) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("fornecedordao.pesquisarporcategoria", categoria, page);
		
		return broker.getCollectionBean(FornecedorModel.class, "id", "logoMarca", "nomeFantasia", "descricao", "telefone", "site", "latitude", "longitude", "categoriaPrincipal.id", "categoriaPrincipal.descricao", "categoriaPrincipal.imagem", "quantidadeIndicacoes", "numeroUnico");
		
	}
	
	public Model obterQtdPaginasPorCategoria(Long categoria) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("fornecedordao.obterqtdpaginasporcategoria", categoria);
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}
	
	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarPorCategoriaMaisIndicados(Long page){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("fornecedordao.pesquisaporcategoriamaisindicadas", page);
		
		return broker.getCollectionBean(FornecedorModel.class, "id", "logoMarca", "nomeFantasia", "descricao", "telefone", "site", "latitude", "longitude", "categoriaPrincipal.id", "categoriaPrincipal.descricao", "categoriaPrincipal.imagem", "quantidadeIndicacoes", "numeroUnico");
		
	}
	
	@SuppressWarnings("unchecked")
	public List<FornecedorModel> pesquisarPorCategoriaOutrasCategorias(Long page){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("fornecedordao.pesquisaporcategoriaoutrascategorias", page);
		
		return broker.getCollectionBean(FornecedorModel.class, "id", "logoMarca", "nomeFantasia", "descricao", "telefone", "site", "latitude", "longitude", "categoriaPrincipal.id", "categoriaPrincipal.descricao", "categoriaPrincipal.imagem", "quantidadeIndicacoes", "numeroUnico");
		
	}
	
	public Model obterQtdPaginasPorCategoriaMaisIndicados() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("fornecedordao.pesquisarqtdpaginasporcategoriamaisindicados");

		return (Model) broker.getObjectBean(Model.class, "value");

	}
	
	public Model obterQtdPaginasPorCategoriaOutrasCategorias() {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("fornecedordao.pesquisarqtdpaginasporcategoriaoutrascategorias");
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}

}
