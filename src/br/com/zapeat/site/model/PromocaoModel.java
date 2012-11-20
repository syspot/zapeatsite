package br.com.zapeat.site.model;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import br.com.topsys.util.TSDateUtil;
import br.com.topsys.util.TSParseUtil;
import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.Utilitarios;
import br.com.zapeat.site.util.ZapeatUtil;

public class PromocaoModel {

	private Long id;

	private TipoPromocaoModel tipoPromocaoModel;

	private FornecedorModel fornecedorModel;

	private String titulo;

	private String descricao;

	private Date inicio;

	private Date fim;

	private Double precoOriginal;

	private Double precoPromocional;

	private List<ImagemModel> imagensPromocoes;

	private Integer indicacoes;

	private String imagemThumb;

	private String imagemPromocao;

	private Timestamp dataFim;

	private List<ComentarioPromocaoModel> comentarios;

	public Long getId() {
		return TSUtil.tratarLong(id);
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TipoPromocaoModel getTipoPromocaoModel() {
		return tipoPromocaoModel;
	}

	public void setTipoPromocaoModel(TipoPromocaoModel tipoPromocaoModel) {
		this.tipoPromocaoModel = tipoPromocaoModel;
	}

	public FornecedorModel getFornecedorModel() {
		return fornecedorModel;
	}

	public void setFornecedorModel(FornecedorModel fornecedorModel) {
		this.fornecedorModel = fornecedorModel;
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

	public List<ImagemModel> getImagensPromocoes() {
		return imagensPromocoes;
	}

	public void setImagensPromocoes(List<ImagemModel> imagensPromocoes) {
		this.imagensPromocoes = imagensPromocoes;
	}

	public Integer getIndicacoes() {
		return indicacoes;
	}

	public void setIndicacoes(Integer indicacoes) {
		this.indicacoes = indicacoes;
	}

	public String getImagemThumb() {
		return imagemThumb;
	}

	public void setImagemThumb(String imagemThumb) {
		this.imagemThumb = imagemThumb;
	}

	public String getImagemPromocao() {
		return imagemPromocao;
	}

	public void setImagemPromocao(String imagemPromocao) {
		this.imagemPromocao = imagemPromocao;
	}

	public String getImagemThumbView() {
		return TSUtil.isEmpty(this.imagemThumb) ? this.imagemThumb : Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_PROMOCAO_THUMB + imagemThumb;
	}

	public String getImagemPromocaoFullView() {
		return TSUtil.isEmpty(this.imagemPromocao) ? this.imagemPromocao : Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_PROMOCAO_FULL + this.imagemPromocao;
	}

	public String getImagemPromocaoThumbView() {
		return TSUtil.isEmpty(this.imagemPromocao) ? this.imagemPromocao : Constantes.PASTA_DOWNLOAD + Constantes.PREFIXO_IMAGEM_PROMOCAO_THUMB + this.imagemPromocao;
	}

	public String getCssSessao() {
		return getTipoPromocaoModel().getId().equals(Constantes.TIPO_PROMOCAO_SEMANA) ? "icons daSemana" : getTipoPromocaoModel().getId().equals(Constantes.TIPO_PROMOCAO_DIA) ? "icons doDia" : "icons daHora";
	}

	public String getPrecoOriginalFormatado() {
		return ZapeatUtil.getValorFormatado(this.precoOriginal);
	}

	public String getPrecoPromocionalFormatado() {
		return ZapeatUtil.getValorFormatado(this.precoPromocional);
	}

	public int getPercentualDesconto() {
		return 100 - (int) (this.precoPromocional.doubleValue() * 100 / this.precoOriginal.doubleValue());
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
		PromocaoModel other = (PromocaoModel) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return this.fornecedorModel.toString();
	}

	public Timestamp getDataFim() {

		return dataFim;
	}

	public void setDataFim(Timestamp dataFim) {
		this.dataFim = dataFim;
	}

	public List<ComentarioPromocaoModel> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<ComentarioPromocaoModel> comentarios) {
		this.comentarios = comentarios;
	}

	public String getDataFormatada() {

		if (!TSUtil.isEmpty(this.fim)) {

			StringBuilder str = new StringBuilder();

			Calendar c = Calendar.getInstance();

			c.setTime(this.fim);

			str.append(Utilitarios.getMes(c.get(Calendar.MONTH)));
			str.append(c.get(Calendar.DAY_OF_MONTH));
			str.append(", ");
			str.append(c.get(Calendar.YEAR));
			str.append(" ");
			str.append(TSParseUtil.dateToString(this.fim, TSDateUtil.HH_MM_SS));

			return str.toString();
		}

		return null;
	}
	
	public String getDataSistema() {
		
		StringBuilder str = new StringBuilder();
		
		Calendar c = Calendar.getInstance();
		
		str.append(Utilitarios.getMes(c.get(Calendar.MONTH)));
		str.append(c.get(Calendar.DAY_OF_MONTH));
		str.append(", ");
		str.append(c.get(Calendar.YEAR));
		str.append(" ");
		str.append(TSParseUtil.dateToString(c.getTime(), TSDateUtil.HH_MM_SS));
		
		return str.toString();
	}

}
