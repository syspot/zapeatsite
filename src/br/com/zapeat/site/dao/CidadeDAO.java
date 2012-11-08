package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.CidadeModel;

public class CidadeDAO {


    public CidadeModel obter(String cidade, String estado){
    	
    	TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
    	
    	broker.setPropertySQL("cidadedao.obterporcidadeestado", cidade, estado);
    	
    	return (CidadeModel) broker.getObjectBean(CidadeModel.class, "id", "nome", "estadoModel.id", "estadoModel.sigla");
    	
    }
    
    @SuppressWarnings("unchecked")
    public List<CidadeModel> pesquisarTodos(){
    	
    	TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
    	
    	broker.setPropertySQL("cidadedao.pesquisartodos");
    	
    	return broker.getCollectionBean(CidadeModel.class, "id", "nome", "estadoModel.id", "estadoModel.sigla");
    	
    }
    
    public CidadeModel obter(CidadeModel cidade){
    	
    	TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
    	
    	broker.setPropertySQL("cidadedao.obter", cidade.getId());
    	
    	return (CidadeModel) broker.getObjectBean(CidadeModel.class, "id", "nome", "estadoModel.id", "estadoModel.sigla");
    	
    }
}
