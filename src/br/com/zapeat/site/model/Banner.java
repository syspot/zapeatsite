package br.com.zapeat.site.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import br.com.topsys.database.hibernate.TSActiveRecordAb;
import br.com.topsys.util.TSUtil;

@Entity
@SuppressWarnings("serial")
@Table(name = "banners")
public class Banner extends TSActiveRecordAb<Banner> {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="banners_id")
	@SequenceGenerator(name="banners_id", sequenceName="banners_id_seq")
	private Long id;

	@ManyToOne
	@JoinColumn(name = "tipo_banner_id")
	private TipoBanner tipoBanner;
	
	@ManyToOne
	private Fornecedor fornecedor;
	
	private String imagem;
	
	private Date inicio;
	
	private Date fim;
	
	@Column(name = "taxa_prioridade")
	private Integer taxaPrioridade;
	
	@Column(name = "qdo_cliques")
	private Integer qdoCliques;
	
	@Column(name = "flag_ativo")
	private Boolean flagAtivo;
	
	
	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TipoBanner getTipoBanner() {
		return tipoBanner;
	}

	public void setTipoBanner(TipoBanner tipoBanner) {
		this.tipoBanner = tipoBanner;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Date getInicio() {
		return inicio;
	}

	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}

	public Date getFim() {
		return fim;
	}

	public void setFim(Date fim) {
		this.fim = fim;
	}

	public Integer getTaxaPrioridade() {
		return TSUtil.tratarInteger(taxaPrioridade);
	}

	public void setTaxaPrioridade(Integer taxaPrioridade) {
		this.taxaPrioridade = taxaPrioridade;
	}

	public Integer getQdoCliques() {
		return qdoCliques;
	}

	public void setQdoCliques(Integer qdoCliques) {
		this.qdoCliques = qdoCliques;
	}

	public Boolean getFlagAtivo() {
		return flagAtivo;
	}

	public void setFlagAtivo(Boolean flagAtivo) {
		this.flagAtivo = flagAtivo;
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
		Banner other = (Banner) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}


}
