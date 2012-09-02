package br.com.zapeat.site.util;

import java.io.File;

public class Constantes {

	public static final String PASTA_UPLOAD_TEMP = "e:" + File.separator + "img_zapeat" + File.separator;
	public static final String PASTA_UPLOAD = "e:" + File.separator + "img_zapeat" + File.separator;

	public static final String PASTA_DOWNLOAD_TEMP = "http://localhost:8080/img_zapeat/";
	public static final String PASTA_DOWNLOAD = "http://localhost:8080/img_zapeat/";
	public static final String PASTA_DOWNLOAD_FORNECEDOR = "http://localhost:8080/img_zapeat/fornecedor/";
	
	public static final String PREFIXO_IMAGEM_FORNECEDOR_THUMB = "80x80_";
	
	public static Long TIPO_PROMOCAO_HORA = 1L;
	public static Long TIPO_PROMOCAO_DIA = 2L;
	public static Long TIPO_PROMOCAO_SEMANA = 3L;

}
