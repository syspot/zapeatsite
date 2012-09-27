package br.com.zapeat.site.model;


public class FacebookModel {
	
	// get these from your FB Dev App
    private static final String api_key = "444305308941322";     
    private static final String secret = "bd452d9359ebe75370c39cf50b09dd40";
    private static final String client_id = "444305308941322";  

    // set this to your servlet URL for the authentication servlet/filter
    private static final String redirect_uri = "http://www.onmydoorstep.com.au/fbauth"; 
    /// set this to the list of extended permissions you want
    
    public static String getAPIKey() {
        return api_key;
    }

    public static String getSecret() {
        return secret;
    }

    public static String getLoginRedirectURL() {
        return "https://graph.facebook.com/oauth/authorize?client_id=" + 
            client_id + "&display=page&redirect_uri=" + 
            redirect_uri+"&scope=email";
    }

    public static String getAuthURL(String authCode) {
        return "https://graph.facebook.com/oauth/access_token?client_id=" + 
            client_id+"&redirect_uri=" + 
            redirect_uri+"&client_secret="+secret+"&code="+authCode;
    }

}
