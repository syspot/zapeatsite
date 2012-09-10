package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.BuscaModel;
import br.com.zapeat.site.util.ZapeatUtil;

public class BuscaDAO {


    @SuppressWarnings("unchecked")
    public List<BuscaModel> pesquisarPromocaoPorTexto(String texto){
    	
    	TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
    	
    	broker.setPropertySQL("buscadao.pesquisarpromocaoportexto", ZapeatUtil.tratarStringILike(texto));
    	
    	return broker.getCollectionBean(BuscaModel.class, "titulo", "nome", "descricao", "tipo", "categoria",  "telefone", "site", "indicacoes");
    	
    }
    
    @SuppressWarnings("unchecked")
    public List<BuscaModel> pesquisarCarroChefePorTexto(String texto){
    	
    	TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
    	
    	broker.setPropertySQL("buscadao.pesquisarcarrochefeportexto", ZapeatUtil.tratarStringILike(texto));
    	
    	return broker.getCollectionBean(BuscaModel.class, "titulo", "nome", "descricao", "tipo", "categoria",  "telefone", "site", "indicacoes");
    	
    }
    
    @SuppressWarnings("unchecked")
    public List<BuscaModel> pesquisarEstabelecimentoPorTexto(String texto){
    	
    	TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
    	
    	broker.setPropertySQL("buscadao.pesquisarestabelecimentoportexto", ZapeatUtil.tratarStringILike(texto));
    	
    	return broker.getCollectionBean(BuscaModel.class, "titulo", "nome", "descricao", "tipo", "categoria",  "telefone", "site", "indicacoes");
    	
    }


}
