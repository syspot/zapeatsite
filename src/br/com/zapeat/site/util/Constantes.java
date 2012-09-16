package br.com.zapeat.site.util;

import java.io.File;

public class Constantes {

	public static final String PASTA_UPLOAD_TEMP = "e:" + File.separator + "img_zapeat" + File.separator;
	public static final String PASTA_UPLOAD = "e:" + File.separator + "img_zapeat" + File.separator;

	public static final String PASTA_DOWNLOAD_TEMP = "http://localhost:8080/img_zapeat/";
	public static final String PASTA_DOWNLOAD = "http://localhost:8080/img_zapeat/";
	public static final String PASTA_DOWNLOAD_FORNECEDOR = "http://localhost:8080/img_zapeat/fornecedor/";
	
	public static final String PREFIXO_IMAGEM_PROMOCAO_FULL = "590x260_";
	public static final String PREFIXO_IMAGEM_PROMOCAO_THUMB = "180x79_";
	public static final String PREFIXO_PROMOCAO_THUMB = "80x80_";
	public static final String PREFIXO_IMAGEM_FORNECEDOR_FULL = "590x260_";
	public static final String PREFIXO_IMAGEM_FORNECEDOR_THUMB = "180x79_";
	public static final String PREFIXO_IMAGEM_CARRO_CHEFE_FULL = "590x260_";
	public static final String PREFIXO_IMAGEM_CARRO_CHEFE_THUMB = "180x79_";
	public static final String PREFIXO_IMAGEM_FORNECEDOR_LOGOMARCA = "80x80_";
	public static final String PREFIXO_IMAGEM_BANNER_FULL = "728x90_";
	public static final String PREFIXO_IMAGEM_BANNER_THUMB = "260x170_";
	
	public static Long TIPO_PROMOCAO_HORA = 1L;
	public static Long TIPO_PROMOCAO_DIA = 2L;
	public static Long TIPO_PROMOCAO_SEMANA = 3L;
	
	public static Long TIPO_LISTAGEM_PROMOCAO_DA_SEMANA = 3L;
	public static Long TIPO_LISTAGEM_PROMOCAO_DA_HORA = 2L;
	public static Long TIPO_LISTAGEM_PROMOCAO_DO_DIA = 1L;
	public static Long TIPO_LISTAGEM_CARRO_CHEFE = 5L;
	
	public static final String USUARIO_LOGADO = "usuarioLogado";
}
