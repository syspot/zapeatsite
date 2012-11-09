package br.com.zapeat.site.util;

import br.com.topsys.util.TSUtil;
import br.com.topsys.web.util.TSFacesUtil;

public final class FacebookClient {

	public static String API_KEY = "288597137908601";
	public static String SECRET = "209751614b750506d68b915721a27119";
	private static final String client_id = "288597137908601";
	private static final String redirect_uri = "http://" + TSFacesUtil.getRequest().getServerName() + ":" + TSFacesUtil.getRequest().getServerPort() + TSFacesUtil.getRequest().getContextPath() + "/checarLoginFacebook.jsf";
	private static final String redirect_uri_logout = "http://" + TSFacesUtil.getRequest().getServerName() + ":" + TSFacesUtil.getRequest().getServerPort() + TSFacesUtil.getRequest().getContextPath() + "/logout.jsf";
	private static final String[] perms = new String[] { "publish_stream", "email" };
	private static String cidade;

	public static String getAPIKey() {
		return API_KEY;
	}

	public static String getSecret() {
		return SECRET;
	}

	public static String getLoginRedirectURL() {

//		String city = TSFacesUtil.getRequestParameter("cidade");
//
//		if (!TSUtil.isEmpty(city)) {
//
//			cidade = city.trim().replaceAll(" ", "_");
//
//			return "https://graph.facebook.com/oauth/authorize?client_id=" + API_KEY + "&display=page&redirect_uri=" + redirect_uri + "?cidade=" + cidade + "&scope=" + com.restfb.util.StringUtils.join(perms);
//
//		} else {
//
//			return "https://graph.facebook.com/oauth/authorize?client_id=" + API_KEY + "&display=page&redirect_uri=" + redirect_uri + "&scope=" + com.restfb.util.StringUtils.join(perms);
//		}
		
		return "https://graph.facebook.com/oauth/authorize?client_id=" + API_KEY + "&display=page&redirect_uri=" + redirect_uri + "&scope=" + com.restfb.util.StringUtils.join(perms);

	}

	public static String getAuthURL(String authCode) {
//
//		String city = TSFacesUtil.getRequestParameter("cidade");
//
//		if (!TSUtil.isEmpty(city)) {
//
//			cidade = city.trim().replaceAll(" ", "_");
//
//			return "https://graph.facebook.com/oauth/access_token?client_id=" + API_KEY + "&redirect_uri=" + redirect_uri + "?cidade=" + cidade + "&client_secret=" + SECRET + "&code=" + authCode;
//
//		} else {
//
//			return "https://graph.facebook.com/oauth/access_token?client_id=" + API_KEY + "&redirect_uri=" + redirect_uri + "&client_secret=" + SECRET + "&code=" + authCode;
//		}
//		
		return "https://graph.facebook.com/oauth/access_token?client_id=" + API_KEY + "&redirect_uri=" + redirect_uri + "&client_secret=" + SECRET + "&code=" + authCode;

	}

	public static String getAuthURL() {

//		String city = TSFacesUtil.getRequestParameter("cidade");
//
//		if (!TSUtil.isEmpty(city)) {
//
//			cidade = city.trim().replaceAll(" ", "_");
//
//			return "https://www.facebook.com/dialog/oauth?client_id=" + API_KEY + "&redirect_uri=" + redirect_uri + "?cidade=" + cidade + "&scope=" + com.restfb.util.StringUtils.join(perms);
//
//		} else {
//
//			return "https://www.facebook.com/dialog/oauth?client_id=" + API_KEY + "&redirect_uri=" + redirect_uri + "&scope=" + com.restfb.util.StringUtils.join(perms);
//		}
		
		return "https://www.facebook.com/dialog/oauth?client_id=" + API_KEY + "&redirect_uri=" + redirect_uri + "&scope=" + com.restfb.util.StringUtils.join(perms);
	}

	public static String getLogoutUrl() {

		String accessToken = (String) TSFacesUtil.getObjectInSession("accessToken");
		
//		String city = TSFacesUtil.getRequestParameter("cidade");
//
//		if (!TSUtil.isEmpty(city)) {
//
//			cidade = city.trim().replaceAll(" ", "_");
//
//			return "https://www.facebook.com/logout.php?next=" + redirect_uri_logout + "?cidade=" + cidade + "&access_token=" + accessToken;
//
//		} else {
//
//			return "https://www.facebook.com/logout.php?next=" + redirect_uri_logout + "&access_token=" + accessToken;
//		}
		
		return "https://www.facebook.com/logout.php?next=" + redirect_uri_logout + "&access_token=" + accessToken;

	}

	public static String getAPI_KEY() {
		return API_KEY;
	}

	public static void setAPI_KEY(String aPI_KEY) {
		API_KEY = aPI_KEY;
	}

	public static String getSECRET() {
		return SECRET;
	}

	public static void setSECRET(String sECRET) {
		SECRET = sECRET;
	}

	public static String getClientId() {
		return client_id;
	}

	public static String getRedirectUri() {
		return redirect_uri;
	}

	public static String[] getPerms() {
		return perms;
	}

	public String getCidade() {
		return cidade;
	}

}
