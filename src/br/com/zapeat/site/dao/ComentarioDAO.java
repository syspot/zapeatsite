package br.com.zapeat.site.dao;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.topsys.exception.TSApplicationException;
import br.com.zapeat.site.model.ComentarioModel;
import br.com.zapeat.site.model.FornecedorModel;

public class ComentarioDAO {

	public ComentarioModel obterIndicacao() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.obterIndicacaoEstabelecimento");

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "id", "descricao", "usuarioModel.nome", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca");

	}

	public ComentarioModel rankingEstabelecimento(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.rankingEstabelecimento", model.getId());

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "posicao", "fornecedorModel.id");

	}

	public void inserir(ComentarioModel model) throws TSApplicationException {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("comentariodao.inserir", model.getUsuarioModel().getId(), model.getFornecedorModel().getId(), model.getDescricao(), model.getFlagIndicaAtendimento(), model.getFlagIndicaPromocao());

		broker.execute();

	}

}
