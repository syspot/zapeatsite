package br.com.zapeat.site.dao;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.model.CarroChefeModel;

public class CarroChefeDAO {

	public CarroChefeModel pesquisar(CarroChefeModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		StringBuilder sql = new StringBuilder("SELECT CF.ID, CF.FORNECEDOR_ID, F.NOME_FANTASIA, CF.DESCRICAO, CF.FLAG_ATIVO, CF.TITULO, (SELECT I.IMAGEM FROM IMAGENS_CARROS_CHEFES I WHERE I.CARRO_CHEFE_ID = CF.ID ORDER BY RANDOM() LIMIT 1) AS IMAGEM_CARRO_CHEFE FROM CARROS_CHEFES CF, FORNECEDORES F WHERE CF.FORNECEDOR_ID = F.ID AND CF.FLAG_ATIVO AND F.FLAG_ATIVO");

		if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getFornecedorModel()) && !TSUtil.isEmpty(model.getFornecedorModel().getId())) {

			sql.append(" AND CF.FORNECEDOR = ?");
		}

		sql.append(" ORDER BY RANDOM() LIMIT 1");

		broker.setSQL(sql.toString());

		if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getFornecedorModel()) && !TSUtil.isEmpty(model.getFornecedorModel().getId())) {

			broker.set(model.getFornecedorModel().getId());
		}

		return (CarroChefeModel) broker.getObjectBean(CarroChefeModel.class, "id", "fornecedorModel.id", "fornecedorModel.nomeFantasia", "descricao", "inicio", "fim", "precoOriginal", "precoPromocional", "titulo", "imagem");

	}

}