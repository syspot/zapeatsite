package br.com.zapeat.site.faces;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import br.com.topsys.util.TSCryptoUtil;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.EnviarEmail;

public class Teste {

	public static void main(String[] args) throws InvalidKeyException, UnsupportedEncodingException, NoSuchPaddingException, BadPaddingException, NoSuchAlgorithmException, IllegalBlockSizeException {

		System.out.println(TSCryptoUtil.criptografar("102030"));

		StringBuilder corpo = new StringBuilder();

		corpo.append("Olá" + "Moisés");

		corpo.append("<br>");

		corpo.append("Para confirmar seu cadastro no nosso site clique no link abaixo:");

		corpo.append("<br><br>");

		corpo.append("<a href='' >Confirme</a>");

		EnviarEmail.enviar(Constantes.ZAPEAT_GMAIL, "moisessrocha@gmail.com", "Zapeat - Confirmação de Cadastro", corpo.toString());

	}

}
