package br.com.zapeat.site.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import br.com.topsys.database.hibernate.TSActiveRecordAb;
import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.ZapeatUtil;

@SuppressWarnings("serial")
@Entity
@Table(name = "cidades")
public class Cidade extends TSActiveRecordAb<Cidade> {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	private String nome;

	@ManyToOne
	private Estado estado;

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
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
		Cidade other = (Cidade) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public List<Cidade> findByModel(String... fieldsOrderBy) {

		StringBuilder query = new StringBuilder();

		query.append(" from Cidade c where 1 = 1 ");

		if (!TSUtil.isEmpty(nome)) {
			query.append("and ").append(ZapeatUtil.semAcento("c.descricao")).append(" like ").append(ZapeatUtil.semAcento("?")).append(" ");
		}

		if (!TSUtil.isEmpty(estado) && !TSUtil.isEmpty(estado.getId())) {
			query.append("and c.estado.id = ? ");
		}

		List<Object> params = new ArrayList<Object>();

		if (!TSUtil.isEmpty(nome)) {
			params.add(ZapeatUtil.tratarString(nome));
		}

		if (!TSUtil.isEmpty(estado) && !TSUtil.isEmpty(estado.getId())) {
			params.add(estado.getId());
		}

		return super.find(query.toString(), params.toArray());
	}

	public List<Cidade> findCombo() {

		StringBuilder query = new StringBuilder();

		query.append(" from Cidade c where c.estado.id = ? ");

		List<Object> params = new ArrayList<Object>();

		params.add(estado.getId());

		return super.find(query.toString(), params.toArray());
	}

}
