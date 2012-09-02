package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.PromocaoModel;

public class PromocaoDAO {

    
    @SuppressWarnings("unchecked")
	public List<PromocaoModel> pesquisarPorIndicacoes(){
    
        TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
        
        broker.setPropertySQL("promocaodao.pesquisarporindicacoes");
        
        return broker.getCollectionBean(PromocaoModel.class, "id", "tipoPromocaoModel.id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "titulo", "indicacoes");
                
    }

}