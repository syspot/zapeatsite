package br.com.zapeat.site.util;

import br.com.topsys.util.TSUtil;
import br.com.zapeat.site.model.Usuario;
import br.com.zapeat.site.model.UsuarioModel;

import com.restfb.DefaultFacebookClient;

public class UsuarioService {

	public UsuarioModel authFacebookLogin(String accessToken, int expires) {

		UsuarioModel model = null;

		try {

			DefaultFacebookClient fb = new DefaultFacebookClient(accessToken);

			Usuario user = fb.fetchObject("me", Usuario.class);
			
			if (!TSUtil.isEmpty(user) && !TSUtil.isEmpty(user.getId())) {

				model = new UsuarioModel();

				model.setId(new Long(user.getId()));

				model.setNome(user.getName());

				model.setEmail(user.getEmail());
				
				model.setFlagAtivo(Boolean.TRUE);
			}

		} catch (Throwable ex) {

			throw new RuntimeException("failed login", ex);
		}

		return model;
	}
}
