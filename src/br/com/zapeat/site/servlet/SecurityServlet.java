package br.com.zapeat.site.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.FacebookClient;
import br.com.zapeat.site.util.UsuarioService;

@WebServlet("*.sec")
public class SecurityServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public SecurityServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String code = req.getParameter("code");

		if (!TSUtil.isEmpty(code)) {

			String authURL = FacebookClient.getAuthURL(code);

			URL url = new URL(authURL);

			try {

				String result = readURL(url);

				String accessToken = null;

				Integer expires = null;

				String[] pairs = result.split("&");

				for (String pair : pairs) {

					String[] kv = pair.split("=");

					if (kv.length != 2) {

						res.sendRedirect("http://localhost:8080/zapeatsite/index.jsf");

						throw new RuntimeException("Unexpected auth response");

					} else {

						if (kv[0].equals("access_token")) {
							accessToken = kv[1];
						}

						if (kv[0].equals("expires")) {
							expires = Integer.valueOf(kv[1]);
						}
					}
				}

				if (accessToken != null && expires != null) {

					UsuarioService us = new UsuarioService();

					UsuarioModel model = us.authFacebookLogin(accessToken, expires);

					if (!TSUtil.isEmpty(model) && !TSUtil.isEmpty(model.getId())) {

						UsuarioModel usuario = new UsuarioDAO().obter(model);

						if (TSUtil.isEmpty(usuario)) {

							try {

								new UsuarioDAO().inserir(model);

							} catch (TSApplicationException e) {

								e.printStackTrace();
							}

						} else {

							try {

								usuario.setNome(model.getNome());

								new UsuarioDAO().alterar(usuario);

							} catch (TSApplicationException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						
						req.getSession().setAttribute("accessToken", accessToken);

						req.getSession().setAttribute(Constantes.USUARIO_LOGADO, model);

						res.sendRedirect("http://localhost:8080/zapeatsite/index.jsf");
					}

				} else {

					res.sendRedirect("http://localhost:8080/zapeatsite/index.jsf");
				}

			} catch (IOException e) {

				throw new RuntimeException(e);
			}
		}
	}

	private String readURL(URL url) throws IOException {

		ByteArrayOutputStream baos = new ByteArrayOutputStream();

		InputStream is = url.openStream();

		int r;

		while ((r = is.read()) != -1) {

			baos.write(r);
		}

		return new String(baos.toByteArray());
	}

}
