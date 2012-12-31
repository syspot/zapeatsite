package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.Model;

public class CarroChefeDAO {

	public CarroChefeModel pesquisar(CarroChefeModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		StringBuilder sql = new StringBuilder("SELECT CF.ID, CF.FORNECEDOR_ID, F.NOME_FANTASIA, CF.DESCRICAO, CF.FLAG_ATIVO, CF.TITULO, (SELECT I.IMAGEM FROM IMAGENS_CARROS_CHEFES I WHERE I.CARRO_CHEFE_ID = CF.ID ORDER BY RANDOM() DESC LIMIT 1) AS IMAGEM_CARRO_CHEFE FROM CARROS_CHEFES CF, FORNECEDORES F WHERE CF.FORNECEDOR_ID = F.ID AND CF.FLAG_ATIVO AND F.FLAG_ATIVO");

		if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getFornecedorModel()) && !TSUtil.isEmpty(model.getFornecedorModel().getId())) {

			sql.append(" AND CF.FORNECEDOR_ID = ?");
		}

		sql.append(" ORDER BY RANDOM() LIMIT 1");

		broker.setSQL(sql.toString());

		if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getFornecedorModel()) && !TSUtil.isEmpty(model.getFornecedorModel().getId())) {

			broker.set(model.getFornecedorModel().getId());
		}

		return (CarroChefeModel) broker.getObjectBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "flagAtivo", "titulo", "imagem");

	}
	
	@SuppressWarnings("unchecked")
	public List<CarroChefeModel> pesquisarPorCategoria(Long cidadeId, Long categoriaId, Long page){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("carrochefedao.pesquisaporcategoria", categoriaId, cidadeId, page);

		return broker.getCollectionBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.latitude", "fornecedorModel.longitude", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.imagem", "descricao", "titulo", "fornecedorModel.numeroUnico");
		
	}
	
	@SuppressWarnings("unchecked")
	public List<CarroChefeModel> pesquisarPorCategoriaMaisIndicados(Long cidadeId, Long page){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("carrochefedao.pesquisaporcategoriamaisindicados", cidadeId, page);
		
		return broker.getCollectionBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.latitude", "fornecedorModel.longitude", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.imagem", "descricao", "titulo", "fornecedorModel.numeroUnico", "fornecedorModel.quantidadeIndicacoes");
		
	}
	
	@SuppressWarnings("unchecked")
	public List<CarroChefeModel> pesquisarPorCategoriaOutrasCategorias(Long page){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("carrochefedao.pesquisaporcategoriaoutrascategorias", page);
		
		return broker.getCollectionBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.telefone", "fornecedorModel.site", "fornecedorModel.latitude", "fornecedorModel.longitude", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.imagem", "descricao", "titulo", "fornecedorModel.numeroUnico", "fornecedorModel.quantidadeIndicacoes");
		
	}
	
	public Model obterQtdPaginasPorCategoria(Long cidadeId, Long categoriaId) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("carrochefedao.pesquisarqtdpaginasporcategoria", categoriaId, cidadeId);
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}
	
	public Model obterQtdPaginasPorCategoriaMaisIndicados(Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("carrochefedao.pesquisarqtdpaginasporcategoriamaisindicados", cidadeId);

		return (Model) broker.getObjectBean(Model.class, "value");

	}
	
	public Model obterQtdPaginasPorCategoriaOutrasCategorias() {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("carrochefedao.pesquisarqtdpaginasporcategoriaoutrascategorias");
		
		return (Model) broker.getObjectBean(Model.class, "value");
		
	}
	
	public CarroChefeModel obter(Long id, Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("carrochefedao.obter", id, cidadeId);

		return (CarroChefeModel) broker.getObjectBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.horariosFuncionamento", "fornecedorModel.logradouro", "fornecedorModel.numero", "fornecedorModel.bairro", "fornecedorModel.telefone", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao", "fornecedorModel.categoriaPrincipal.imagem", "fornecedorModel.cidadeModel.id", "imagem", "descricao", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}
	
	public CarroChefeModel obter(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("carrochefedao.obterPorFornecedor", model.getId());

		return (CarroChefeModel) broker.getObjectBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "fornecedorModel.horariosFuncionamento", "fornecedorModel.logradouro", "fornecedorModel.numero", "fornecedorModel.bairro", "fornecedorModel.telefone", "imagem", "descricao", "titulo", "fornecedorModel.longitude", "fornecedorModel.latitude");

	}
	
	public CarroChefeModel obterCarroChefeAleatorio(Long fornecedorId, Long cidadeId) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("carrochefedao.obtercarrochefealeatorio", fornecedorId, cidadeId);

		return (CarroChefeModel) broker.getObjectBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.quantidadeIndicacoes", "descricao", "flagAtivo", "titulo", "imagem", "fornecedorModel.categoriaPrincipal.id", "fornecedorModel.categoriaPrincipal.descricao");

	}

}
