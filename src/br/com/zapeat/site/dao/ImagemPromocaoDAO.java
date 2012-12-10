package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.ImagemModel;
import br.com.zapeat.site.model.PromocaoModel;

public class ImagemPromocaoDAO {

	@SuppressWarnings("unchecked")
	public List<ImagemModel> pesquisar(PromocaoModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("imagempromocaodao.pesquisar", model.getId());

		return broker.getCollectionBean(ImagemModel.class, "id", "imagem");

	}

}
