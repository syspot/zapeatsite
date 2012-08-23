package br.com.zapeat.site.util;

import java.io.File;
import java.io.InputStream;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.apache.commons.io.FileUtils;

import br.com.topsys.exception.TSSystemException;
import br.com.topsys.util.TSUtil;

public class ZapeatUtil {

	private ZapeatUtil() {

	}

	public static String[] getVetor(String... parameters) {

		String[] vetor = null;

		if (!TSUtil.isEmpty(parameters)) {

			vetor = new String[parameters.length];
			int i = 0;

			for (String str : parameters) {

				vetor[i] = str;
				i++;

			}

		}

		return vetor;

	}

	public static void addErrorMessage(String msg) {
		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "ERRO", msg));
	}

	public static void addInfoMessage(String msg) {
		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "INFO", msg));
	}

	public static void addWarnMessage(String msg) {
		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "AVISO", msg));
	}

	public static String tratarString(String str) {
		return (str == null) ? "%" : "%" + str.toLowerCase() + "%";
	}

	public static String semAcento(String campo) {
		return "translate(lower(trim(".concat(campo).concat(")), '·ÈÌÛ˙‡ËÏÚ˘„ı‚ÍÓÙÙ‰ÎÔˆ¸Á¡…Õ”⁄¿»Ã“Ÿ√’¬ Œ‘€ƒÀœ÷‹«', 'aeiouaeiouaoaeiooaeioucAEIOUAEIOUAOAEIOOAEIOUC')");
	}

	public static void criaArquivo(InputStream file, String arquivo) {

		try {
			FileUtils.copyInputStreamToFile(file, new File(arquivo));
		} catch (Exception ex) {
			throw new TSSystemException(ex);
		}

	}

	public static long gerarNumeroAleatorio() {
		return (long) ((10000 * Math.random()) * (100 * Math.random()));
	}

}
