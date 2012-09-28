package br.com.zapeat.site.dao;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.model.BannerModel;

public class BannerDAO {
	
	public BannerModel pesquisar(BannerModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		StringBuilder sql = new StringBuilder("SELECT B.ID, B.IMAGEM, B.TAXA_PRIORIDADE, B.QDO_CLIQUES, B.FLAG_ATIVO FROM PUBLIC.BANNERS B, FORNECEDORES F, TIPOS_BANNERS TB WHERE B.FORNECEDOR_ID = F.ID AND B.TIPO_BANNER_ID = TB.ID AND B.FLAG_ATIVO AND DATE_TRUNC ('DAY', B.INICIO) >= CURRENT_DATE AND DATE_TRUNC('DAY', B.FIM) <= CURRENT_DATE");

		if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getFornecedorModel()) && !TSUtil.isEmpty(model.getFornecedorModel().getId())) {

			sql.append(" AND B.FORNECEDOR_ID = ?");
		}

		sql.append(" ORDER BY RANDOM() LIMIT 1");

		broker.setSQL(sql.toString());

		if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getFornecedorModel()) && !TSUtil.isEmpty(model.getFornecedorModel().getId())) {

			broker.set(model.getFornecedorModel().getId());
		}

		return (BannerModel) broker.getObjectBean(BannerModel.class, "id", "imagem", "taxaPrioridade", "qdoCliques", "flagAtivo");

	}
	
	public BannerModel obterBannerLateral(){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("bannerdao.obterbannerlateral");
		
		return (BannerModel) broker.getObjectBean(BannerModel.class, "id", "imagem");
		
	}
	
	public BannerModel obterBannerSuperiorPequeno(){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("bannerdao.obterbannersuperiorpequeno");
		
		return (BannerModel) broker.getObjectBean(BannerModel.class, "id", "imagem");
		
	}
	
	public BannerModel obterBannerTopo(){
		
		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();
		
		broker.setPropertySQL("bannerdao.obterbannertopo");
		
		return (BannerModel) broker.getObjectBean(BannerModel.class, "id", "imagem");
		
	}

}
