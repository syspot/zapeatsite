package br.com.zapeat.site.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.code.facebookapi.FacebookJsonRestClient;
import com.google.code.facebookapi.FacebookXmlRestClient;

/**
 * Servlet implementation class FacebookServlet
 */
@WebServlet(urlPatterns = { "/FacebookServlet/" }, initParams = { @WebInitParam(name = "API_KEY", value = "444305308941322", description = "API_KEY"), @WebInitParam(name = "SECRET_KEY", value = "bd452d9359ebe75370c39cf50b09dd40", description = "SECRET_KEY") })
public class FacebookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String FACEBOOK_USER_CLIENT = "facebook.user.client";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FacebookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String apiKey = getServletConfig().getInitParameter("API_KEY");
		String secretKey = getServletConfig().getInitParameter("SECRET_KEY");
		HttpSession session = request.getSession();
		String sessionKey = (String) session.getAttribute("restSearchAppSession");
		String authToken = request.getParameter("auth_token");

		FacebookJsonRestClient client = null;

		if (sessionKey != null) {

			client = new FacebookJsonRestClient(apiKey, secretKey, sessionKey);

		} else if (authToken != null) {

			client = new FacebookJsonRestClient(apiKey, secretKey);

			try {

				sessionKey = client.auth_getSession(authToken);

				session.setAttribute("restSearchAppSession", sessionKey);

				Long facebookUserID = client.users_getLoggedInUser();
				
				System.out.println(facebookUserID);

				String preferences = client.data_getUserPreference(facebookUserID.intValue());
				
				System.out.println(preferences);
				
				/*Map<Integer, String> prefs = (Map<Integer, String>) client.data_getUserPreferences();

				for (Integer key : prefs.keySet()) {
					System.out.println("\tkey " + key + " = " + prefs.get(key));
				}*/

				

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

			response.sendRedirect("https://graph.facebook.com/oauth/authorize?redirect_uri=http://localhost:8080/zapeatsite/returnFacebook.jsf?&client_id=444305308941322");

			// response.sendRedirect("http://www.facebook.com/login.php?api_key="
			// + apiKey);

			return;
		}

		response.getWriter().println("HelloWorld");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public static FacebookXmlRestClient getUserClient(HttpSession session) {
		return (FacebookXmlRestClient) session.getAttribute(FACEBOOK_USER_CLIENT);
	}

}
