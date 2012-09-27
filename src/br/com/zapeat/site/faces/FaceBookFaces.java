package br.com.zapeat.site.faces;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

import javax.faces.bean.ManagedBean;

import br.com.topsys.exception.TSApplicationException;
import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;
import br.com.zapeat.site.dao.UsuarioDAO;
import br.com.zapeat.site.model.UsuarioModel;
import br.com.zapeat.site.util.Constantes;
import br.com.zapeat.site.util.FacebookClient;
import br.com.zapeat.site.util.UsuarioService;

@ManagedBean(name = "faceBookFaces")
public class FaceBookFaces {

	private String url;
	
	private String logout;

	public FaceBookFaces() throws MalformedURLException {
		
		this.url = FacebookClient.getLoginRedirectURL();

		this.logout = FacebookClient.getLogoutUrl();

		String code = TSFacesUtil.getRequestParameter("code");

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

						this.redirect();

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

								e.printStackTrace();
							}
						}

						TSFacesUtil.addObjectInSession("accessToken", accessToken);

						TSFacesUtil.addObjectInSession(Constantes.USUARIO_LOGADO, model);

						this.redirect();
					}

				} else {

					this.redirect();
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

	@SuppressWarnings("static-access")
	private void redirect() {

		try {

			TSFacesUtil.getFacesContext().getCurrentInstance().getExternalContext().redirect("index.jsf");

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLogout() {
		return logout;
	}

	public void setLogout(String logout) {
		this.logout = logout;
	}

}
