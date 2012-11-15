package br.com.zapeat.site.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ImagemCarroChefeModel extends ImagemModel implements Serializable {

	private CarroChefeModel carroChefeModel;

	public CarroChefeModel getCarroChefeModel() {
		return carroChefeModel;
	}

	public void setCarroChefeModel(CarroChefeModel carroChefeModel) {
		this.carroChefeModel = carroChefeModel;
	}

}
