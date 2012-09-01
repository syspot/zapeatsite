package br.com.zapeat.site.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import br.com.topsys.database.hibernate.TSActiveRecordAb;
import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.ZapeatUtil;


@Entity
@SuppressWarnings("serial")
@Table(name = "promocoes")
public class Promocao extends TSActiveRecordAb<Promocao> {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="promocoes_id")
	@SequenceGenerator(name="promocoes_id", sequenceName="promocoes_id_seq")
	private Long id;

	@ManyToOne
	@JoinColumn(name = "tipo_promocao_id")
	private TipoPromocao tipoPromocao;
	
	@ManyToOne
	private Fornecedor fornecedor;
	
	private String titulo;
	
	private String descricao;
	
	private Date inicio;
	
	private Date fim;
	
	@Column(name = "preco_original")
	private Double precoOriginal;
	
	@Column(name = "preco_promocional")
	private Double precoPromocional;
	
	@OneToMany(mappedBy = "promocao", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ImagemPromocao> imagensPromocoes;

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public TipoPromocao getTipoPromocao() {
		return tipoPromocao;
	}

	public void setTipoPromocao(TipoPromocao tipoPromocao) {
		this.tipoPromocao = tipoPromocao;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
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

	public Double getPrecoOriginal() {
		return precoOriginal;
	}

	public void setPrecoOriginal(Double precoOriginal) {
		this.precoOriginal = precoOriginal;
	}

	public Double getPrecoPromocional() {
		return precoPromocional;
	}

	public void setPrecoPromocional(Double precoPromocional) {
		this.precoPromocional = precoPromocional;
	}

	public List<ImagemPromocao> getImagensPromocoes() {
		return imagensPromocoes;
	}

	public void setImagensPromocoes(List<ImagemPromocao> imagensPromocoes) {
		this.imagensPromocoes = imagensPromocoes;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((fim == null) ? 0 : fim.hashCode());
		result = prime * result
				+ ((fornecedor == null) ? 0 : fornecedor.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime
				* result
				+ ((imagensPromocoes == null) ? 0 : imagensPromocoes.hashCode());
		result = prime * result + ((inicio == null) ? 0 : inicio.hashCode());
		result = prime * result
				+ ((precoOriginal == null) ? 0 : precoOriginal.hashCode());
		result = prime
				* result
				+ ((precoPromocional == null) ? 0 : precoPromocional.hashCode());
		result = prime * result
				+ ((tipoPromocao == null) ? 0 : tipoPromocao.hashCode());
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
		Promocao other = (Promocao) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (fim == null) {
			if (other.fim != null)
				return false;
		} else if (!fim.equals(other.fim))
			return false;
		if (fornecedor == null) {
			if (other.fornecedor != null)
				return false;
		} else if (!fornecedor.equals(other.fornecedor))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (imagensPromocoes == null) {
			if (other.imagensPromocoes != null)
				return false;
		} else if (!imagensPromocoes.equals(other.imagensPromocoes))
			return false;
		if (inicio == null) {
			if (other.inicio != null)
				return false;
		} else if (!inicio.equals(other.inicio))
			return false;
		if (precoOriginal == null) {
			if (other.precoOriginal != null)
				return false;
		} else if (!precoOriginal.equals(other.precoOriginal))
			return false;
		if (precoPromocional == null) {
			if (other.precoPromocional != null)
				return false;
		} else if (!precoPromocional.equals(other.precoPromocional))
			return false;
		if (tipoPromocao == null) {
			if (other.tipoPromocao != null)
				return false;
		} else if (!tipoPromocao.equals(other.tipoPromocao))
			return false;
		return true;
	}

	public Promocao getPromocaoDia(){
		return this.get("from Promocao p where p.tipoPromocao.id= 2 and p.inicio <= ? and p.fim >= ? order by random()", new Date(), new Date());
	}
	
	public List<Promocao> findPromocoesSemana(){
		return this.find("from Promocao p where p.tipoPromocao.id= 3 and p.inicio <= ? and p.fim >= ? order by random()", new Date(), new Date());
	}
	
	public List<Promocao> findPromocoesHora(){
		return this.find("from Promocao p where p.tipoPromocao.id= 1 and p.inicio <= ? and p.fim >= ? order by random()", new Date(), new Date());
	}
	
	public List<Promocao> findPromocoes(String texto){
		return this.find("from Promocao p where p.descricao like ? order by p.inicio", ZapeatUtil.tratarStringILike(texto));
	}
	
	public List<Promocao> findPromocoesMaisIndicadas(){
		return this.find("from Promocao p order by p.inicio");
	}

}
