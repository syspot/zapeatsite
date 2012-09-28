package br.com.zapeat.site.faces;

import javax.faces.bean.ManagedBean;

import br.com.topsys.web.faces.TSMainFaces;
import br.com.zapeat.site.dao.BannerDAO;
import br.com.zapeat.site.model.BannerModel;

@ManagedBean
public class BannerFaces extends TSMainFaces {

	private BannerModel bannerTopo;
	private BannerModel bannerLateral;
	
	public BannerFaces() {
		
		BannerDAO bannerDAO = new BannerDAO();
		
		this.bannerLateral = bannerDAO.obterBannerLateral();
		this.bannerTopo = bannerDAO.obterBannerTopo();
		
	}

	public BannerModel getBannerTopo() {
		return bannerTopo;
	}

	public void setBannerTopo(BannerModel bannerTopo) {
		this.bannerTopo = bannerTopo;
	}

	public BannerModel getBannerLateral() {
		return bannerLateral;
	}

	public void setBannerLateral(BannerModel bannerLateral) {
		this.bannerLateral = bannerLateral;
	}

	
}
