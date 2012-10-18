package br.com.zapeat.site.dao;

import java.util.List;

import br.com.topsys.database.TSDataBaseBrokerIf;
import br.com.topsys.database.factory.TSDataBaseBrokerFactory;
import br.com.zapeat.site.model.FormaPagamentoFornecedorModel;
import br.com.zapeat.site.model.FornecedorModel;

public class FormaPagamentoFornecedorDAO {

	@SuppressWarnings("unchecked")
	public List<FormaPagamentoFornecedorModel> pesquisar(FornecedorModel model) {

		TSDataBaseBrokerIf broker = TSDataBaseBrokerFactory.getDataBaseBrokerIf();

		broker.setPropertySQL("formapagamentofornecedordao.pesquisar", model.getId());

		return broker.getCollectionBean(FormaPagamentoFornecedorModel.class, "id", "formaPagamentoModel.id", "formaPagamentoModel.descricao", "formaPagamentoModel.imagem", "fornecedorModel.id");

	}

}
