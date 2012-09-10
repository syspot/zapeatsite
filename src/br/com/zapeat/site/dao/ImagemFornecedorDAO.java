package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.ImagemFornecedorModel;

public class ImagemFornecedorDAO {

	@SuppressWarnings("unchecked")
	public List<ImagemFornecedorModel> pesquisar(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("imagemfornecedordao.pesquisar");

		return broker.getCollectionBean(ImagemFornecedorModel.class, "id", "fornecedorModel.id", "imagem");

	}

}
