package br.com.zapeat.site.dao;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.UsuarioModel;

public class UsuarioDAO {

	public UsuarioModel obter(UsuarioModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("usuariodao.obter", model.getEmail());

		return (UsuarioModel) broker.getObjectBean(UsuarioModel.class, "id", "nome", "email", "senha", "flagAtivo", "imagem");

	}

}