package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.FornecedorModel;
import br.com.zapeat.site.model.ImagemModel;

public class ImagemFornecedorDAO {

	@SuppressWarnings("unchecked")
	public List<ImagemModel> pesquisar(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("imagemfornecedordao.pesquisar", model.getId());

		return broker.getCollectionBean(ImagemModel.class, "id", "imagem");

	}
	
	public ImagemModel obterAleatorio(FornecedorModel model) {
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("imagemfornecedordao.obteraleatorio", model.getId());
		
		return (ImagemModel)broker.getObjectBean(ImagemModel.class, "id", "imagem");
		
	}

}
