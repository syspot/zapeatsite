package br.com.zapeat.site.model;


public class ImagemPromocaoModel {
	
	private Long id;
	
	private PromocaoModel promocaoModel;
	
	private String imagem;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public PromocaoModel getPromocaoModel() {
		return promocaoModel;
	}

	public void setPromocaoModel(PromocaoModel promocaoModel) {
		this.promocaoModel = promocaoModel;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ImagemPromocaoModel other = (ImagemPromocaoModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
