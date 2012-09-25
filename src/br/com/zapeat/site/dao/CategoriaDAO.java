package br.com.zapeat.site.dao;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.CategoriaModel;

public class CategoriaDAO {

    public CategoriaModel obter(Long id){
    	
    	TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
    	
    	broker.setPropertySQL("categoriadao.obter", id);
    	
    	return (CategoriaModel) broker.getObjectBean(CategoriaModel.class, "id", "descricao", "css");
    	
    }
}
