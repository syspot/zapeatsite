package br.com.zapeat.site.dao;

import br.com.topsys.constant.TSConstant;
import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSCryptoUtil;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;

public class UsuarioDAO {

	public UsuarioModel obter(UsuarioModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("usuariodao.obter", model.getEmail());

		return (UsuarioModel) broker.getObjectBean(UsuarioModel.class, "id", "nome", "email", "senha", "flagAtivo", "imagem", "flagAceitouTermo");

	}
	
	public UsuarioModel getById(UsuarioModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("usuariodao.getById", model.getId());

		return (UsuarioModel) broker.getObjectBean(UsuarioModel.class, "id", "nome", "email", "senha", "flagAtivo", "imagem", "flagAceitouTermo");

	}

	public UsuarioModel inserir(UsuarioModel model) throws TSApplicationException {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		model.setId(broker.getSequenceNextValue(Constantes.SEQUENCE_USUARIO_SITE));
		
		model.setToken(TSCryptoUtil.gerarHash(model.getId().toString() + model.getNome(), TSConstant.CRIPTOGRAFIA_MD5));

		broker.setPropertySQL("usuariodao.inserir", model.getId(), model.getNome(), model.getEmail().toLowerCase(), model.getSenha(), model.getFlagAtivo(), model.getImagem(), model.getToken(), model.getFlagFacebook(), model.getFlagAceitouTermo());

		broker.execute();

		return model;

	}

	public void alterar(UsuarioModel model) throws TSApplicationException {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("usuariodao.alterar", model.getNome(), model.getId());

		broker.execute();

	}
	
	public void alterarStatus(UsuarioModel model) throws TSApplicationException {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("usuariodao.alterarStatus", model.getFlagAtivo(), model.getId());

		broker.execute();

	}

}
