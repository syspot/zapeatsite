package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.zapeat.site.dao.BannerDAO;
import br.com.zapeat.site.model.BannerModel;

@ManagedBean
public class BannerFaces {

	public BannerModel getBannerTopo() {
		return new BannerDAO().obterBannerTopo();
	}

	public BannerModel getBannerLateral() {
		return new BannerDAO().obterBannerLateral();
	}
	
}
