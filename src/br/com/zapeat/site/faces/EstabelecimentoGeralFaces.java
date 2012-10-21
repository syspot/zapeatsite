package br.com.zapeat.site.faces;

import java.util.List;

import javax.faces.bean.ManagedBean;

import br.com.zapeat.site.dao.FornecedorDAO;
import br.com.zapeat.site.model.FornecedorModel;

@ManagedBean(name = "estabelecimentoGeralFaces")
public class EstabelecimentoGeralFaces {

	
	public List<FornecedorModel> getEstabelecimentos() {
		return new FornecedorDAO().pesquisarHome();
	}

}
