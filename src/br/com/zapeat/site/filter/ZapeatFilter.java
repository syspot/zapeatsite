package br.com.zapeat.site.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.model.Usuario;
import br.com.zapeat.site.util.FacebookClient;
import br.com.zapeat.site.util.UsuarioService;

/**
 * Servlet Filter implementation class ZapeatFilter
 */
@WebFilter("/ZapeatFilter")
public class ZapeatFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public ZapeatFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	@Override
	public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) sr;
		HttpServletResponse res = (HttpServletResponse) sr1;
		String code = sr.getParameter("code");

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

					Usuario u = new Usuario();
					UsuarioService us = new UsuarioService();
					us.authFacebookLogin(accessToken, expires);
					res.sendRedirect("http://localhost:8080/zapeatsite/index.jsf");
				} else {
					throw new RuntimeException("Access token and expires not found");

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

	@Override
	public void destroy() {
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
