package br.com.zapeat.site.util;

import java.text.Normalizer;
import java.util.Calendar;

import br.com.topsys.util.TSCryptoUtil;
import br.com.topsys.util.TSUtil;

public final class Utilitarios {

	private Utilitarios() {

	}

	public static String tratarString(String valor) {
		if (!TSUtil.isEmpty(valor)) {
			valor = valor.trim().replaceAll("  ", " ");
		}

		return valor;
	}

	public static Long tratarLong(Long valor) {
		if ((!TSUtil.isEmpty(valor)) && (valor.equals(Long.valueOf(0L)))) {
			valor = null;
		}

		return valor;
	}

	public static String removerAcentos(String palavra) {
		if (TSUtil.isEmpty(palavra)) {
			return null;
		}

		return Normalizer.normalize(new StringBuilder(palavra), Normalizer.Form.NFKD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
	}

	public static String gerarHash(String valor) {
		if (!TSUtil.isEmpty(valor)) {
			valor = TSCryptoUtil.gerarHash(valor, "md5");
		}

		return valor;
	}

	public static String gerarSenha() {
		Calendar rightNow = Calendar.getInstance();

		int diaAtual = rightNow.get(5);
		int mesAtual = rightNow.get(2) + 1;
		int anoAtual = rightNow.get(1);
		int horaAtual = rightNow.get(11);
		int minutoAtual = rightNow.get(12);
		int segAtual = rightNow.get(13);
		int miliAtual = rightNow.get(14);

		String senha = anoAtual + mesAtual + diaAtual + horaAtual + minutoAtual + segAtual + miliAtual + "";

		return senha;
	}

	public static String getSituacao(Boolean flagAtivo) {
		if ((!TSUtil.isEmpty(flagAtivo)) && (flagAtivo.booleanValue())) {
			return "Ativo";
		}

		return "Inativo";
	}

	public static String getMes(int mes) {

		switch (mes) {

		case 0:
			return "january ";

		case 1:
			return "february ";

		case 2:
			return "march ";

		case 3:
			return "april ";

		case 4:
			return "may ";

		case 5:
			return "june ";

		case 6:
			return "july ";

		case 7:
			return "august ";

		case 8:
			return "september ";

		case 9:
			return "october ";

		case 10:
			return "november ";

		case 11:
			return "december ";

		default:
			return null;
		}
	}
}