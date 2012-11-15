package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.CarroChefeModel;
import br.com.zapeat.site.model.ImagemModel;

public class ImagemCarroChefeDAO {

	@SuppressWarnings("unchecked")
	public List<ImagemModel> pesquisar(CarroChefeModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("imagemcarrochefedao.pesquisar", model.getId());

		return broker.getCollectionBean(ImagemModel.class, "id", "imagem");

	}

}
