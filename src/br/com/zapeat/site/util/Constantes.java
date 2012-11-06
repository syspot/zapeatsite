package br.com.zapeat.site.util;

import java.io.File;

import br.com.topsys.web.util.TSFacesUtil;

public final class Constantes {
	
	public static final String URL_APLICACAO = "http://" + TSFacesUtil.getRequest().getServerName() + ":"+ TSFacesUtil.getRequest().getServerPort() + TSFacesUtil.getRequest().getContextPath() + "/";

	public static final String PASTA_UPLOAD_TEMP = "e:" + File.separator + "img_zapeat" + File.separator;
	public static final String PASTA_UPLOAD = "e:" + File.separator + "img_zapeat" + File.separator;

	public static final String PASTA_DOWNLOAD_TEMP = "http://"+TSFacesUtil.getRequest().getServerName() + ":" + TSFacesUtil.getRequest().getServerPort() + "/img_zapeat/";
	public static final String PASTA_DOWNLOAD = "http://"+TSFacesUtil.getRequest().getServerName() + ":" + TSFacesUtil.getRequest().getServerPort() + "/img_zapeat/";
	public static final String PASTA_DOWNLOAD_FORNECEDOR = "http://"+TSFacesUtil.getRequest().getServerName() + ":" + TSFacesUtil.getRequest().getServerPort() + "/img_zapeat/fornecedor/";
	
	public static final String PREFIXO_IMAGEM_CATEGORIA = "20x20_";
	public static final String PREFIXO_IMAGEM_FORMA_PAGAMENTO = "25x18_";
	public static final String PREFIXO_IMAGEM_PROMOCAO_FULL = "590x260_";
	public static final String PREFIXO_IMAGEM_PROMOCAO_THUMB = "180x79_";
	public static final String PREFIXO_PROMOCAO_THUMB = "80x80_";
	public static final String PREFIXO_IMAGEM_FORNECEDOR_FULL = "590x260_";
	public static final String PREFIXO_IMAGEM_FORNECEDOR_THUMB = "180x79_";
	public static final String PREFIXO_IMAGEM_CARRO_CHEFE_FULL = "590x260_";
	public static final String PREFIXO_IMAGEM_CARRO_CHEFE_THUMB = "180x79_";
	public static final String PREFIXO_IMAGEM_FORNECEDOR_LOGOMARCA = "80x80_";
	public static final String PREFIXO_IMAGEM_BANNER_SUPERIOR_GRANDE = "728x90_";
	public static final String PREFIXO_IMAGEM_BANNER_LATERAL = "170x260_";
	public static final String PREFIXO_IMAGEM_BANNER_SUPERIOR_PEQUENO = "210x110_";
	
	public static Long TIPO_PROMOCAO_HORA = 1L;
	public static Long TIPO_PROMOCAO_DIA = 2L;
	public static Long TIPO_PROMOCAO_SEMANA = 3L;
	
	public static Long TIPO_LISTAGEM_PROMOCAO_DA_SEMANA = 3L;
	public static Long TIPO_LISTAGEM_PROMOCAO_DA_HORA = 2L;
	public static Long TIPO_LISTAGEM_PROMOCAO_DO_DIA = 1L;
	public static Long TIPO_LISTAGEM_CARRO_CHEFE = 5L;
	public static Long TIPO_LISTAGEM_ESTABELECIMENTO = 6L;
	
	public static final String ID_USUARIO_LOGADO = "idUsuarioLogado";
	public static final String NOME_USUARIO_LOGADO = "nomeUsuarioLogado";
	public static final String LOGIN_APLICACAO = "loginAplicacao";
	public static final String INDEX = "index";
	public static final String SEQUENCE_USUARIO_SITE = "usuarios_id_seq";
	public static final String MIME_TYPE_TEXT = "text/plain";
	public static final String MIME_TYPE_HTML = "text/html";
	
	public static final String SMTP_GMAIL = "smtp.gmail.com";
	public static final String PORTAL_GMAIL = "465";
	public static final String ZAPEAT_GMAIL = "zapeatx@gmail.com";
	public static final String ZAPEAT_SENHA_GMAIL = "zapeat123";
	
	public static Long CATEGORIA_MAIS_INDICADOS = 7L;
	public static Long CATEGORIA_OUTRAS_CATEGORIAS = 8L;
	
}
