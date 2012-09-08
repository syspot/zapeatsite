package br.com.zapeat.site.dao;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.ComentarioModel;

public class ComentarioDAO {

	public ComentarioModel obterIndicacao() {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("comentariodao.obterIndicacao");

		return (ComentarioModel) broker.getObjectBean(ComentarioModel.class, "descricao", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "fornecedorModel.logoMarca", "usuarioModel.nome");

	}

}
