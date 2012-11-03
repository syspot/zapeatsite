package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.topsys.exception.TSApplicationException;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.ComentarioCarroChefeModel;
import br.com.zapeat.site.model.ComentarioFornecedorModel;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.ComentarioPromocaoModel;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.PromocaoModel;

public class ComentarioDAO {

	public ComentarioModel obterIndicacao() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.obterIndicacaoEstabelecimento");

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "id", "descricao", "usuarioModel.nome", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.imagemThumb");

	}
	
	public ComentarioModel obterIndicacao(Long id) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.obterIndicacaoEstabelecimentoById", id);

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "id", "descricao", "usuarioModel.nome", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.imagemThumb");

	}

	public ComentarioModel rankingEstabelecimento(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.rankingEstabelecimento", model.getId());

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "posicao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca");

	}

	public void inserir(ComentarioModel model) throws TSApplicationException {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("comentariodao.inserir", model.getUsuarioModel().getId(), model.getFornecedorModel().getId(), model.getDescricao(), model.getFlagIndica(), model.getFlagNaoIndica());

		broker.execute();

	}
	
	public ComentarioModel obterIndicacaoComidaPositiva(ComentarioModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.obterIndicacaoComidaPositiva", model.getFornecedorModel().getId(), model.getUsuarioModel().getId());

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "id", "descricao", "usuarioModel.id", "usuarioModel.nome", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca");

	}
	
	public ComentarioModel obterIndicacaoComidaNegativa(ComentarioModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.obterIndicacaoComidaNegativa", model.getFornecedorModel().getId(), model.getUsuarioModel().getId());

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "id", "descricao", "usuarioModel.id","usuarioModel.nome", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca");

	}
	
	public ComentarioModel obterIndicacaoEstabelecimentoPorUsuario(ComentarioModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.obterIndicacaoEstabelecimentoPorUsuario", model.getFornecedorModel().getId(), model.getUsuarioModel().getId());

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "id", "descricao", "usuarioModel.id", "usuarioModel.nome", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca");

	}
	
	@SuppressWarnings("unchecked")
	public List<ComentarioPromocaoModel> pesquisarComentarios(PromocaoModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.pesquisarcomentariospromocao", model.getId());

		return broker.getCollectionBean(ComentarioPromocaoModel.class, "id", "descricao", "dataCadastro", "promocaoModel.id", "usuarioModel.id", "usuarioModel.nome");

	}
	
	@SuppressWarnings("unchecked")
	public List<ComentarioFornecedorModel> pesquisarComentarios(FornecedorModel model) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("comentariodao.pesquisarcomentariosfornecedor", model.getId());
		
		return broker.getCollectionBean(ComentarioFornecedorModel.class, "id", "descricao", "dataCadastro", "fornecedorModel.id", "usuarioModel.id", "usuarioModel.nome");
		
	}
	
	@SuppressWarnings("unchecked")
	public List<ComentarioCarroChefeModel> pesquisarComentarios(CarroChefeModel model) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("comentariodao.pesquisarcomentarioscarrochefe", model.getId());
		
		return broker.getCollectionBean(ComentarioCarroChefeModel.class, "id", "descricao", "dataCadastro", "carroChefeModel.id", "usuarioModel.id", "usuarioModel.nome");
		
	}
	
	public void comentar(ComentarioPromocaoModel model) throws TSApplicationException {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("comentariodao.comentarpromocao", model.getDescricao(), model.getPromocaoModel(), model.getUsuarioModel().getId());

		broker.execute();

	}
	
	public void comentar(ComentarioFornecedorModel model) throws TSApplicationException {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("comentariodao.comentarfornecedor", model.getDescricao(), model.getFornecedorModel().getId(), model.getUsuarioModel().getId());
		
		broker.execute();
		
	}
	
	public void comentar(ComentarioCarroChefeModel model) throws TSApplicationException {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("comentariodao.comentarcarrochefe", model.getDescricao(), model.getCarroChefeModel(), model.getUsuarioModel().getId());
		
		broker.execute();
		
	}

}
