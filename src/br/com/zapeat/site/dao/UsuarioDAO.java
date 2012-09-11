package br.com.zapeat.site.dao;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.topsys.exception.TSApplicationException;
import br.com.zapeat.site.model.UsuarioModel;

public class UsuarioDAO {

	public UsuarioModel obter(UsuarioModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("usuariodao.obter", model.getEmail());

		return (UsuarioModel) broker.getObjectBean(UsuarioModel.class, "id", "nome", "email", "senha", "flagAtivo", "imagem");

	}

	public UsuarioModel inserir(UsuarioModel model) throws TSApplicationException {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("usuariodao.inserir", model.getNome(), model.getEmail(), model.getSenha(), model.getFlagAtivo(), model.getImagem());

		broker.execute();

		return model;

	}

}
