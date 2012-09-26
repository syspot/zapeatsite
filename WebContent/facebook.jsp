<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<f:view>
<script type="text/javascript">

window.onbeforeunload = function() {
    window.opener.reload(true);
    window.close();
};

</script>
<a onclick="window.open('https://www.facebook.com/dialog/oauth?display=popup&amp;client_id=444305308941322&amp;scope=read_friendlists,publish_stream,offline_access,publish_checkins,user_checkins,publish_actions,user_likes,email&amp;redirect_uri=http://localhost:8080/zapeatsite/index.sec', 'fblogin', 'location=1,status=1,scrollbars=1, width=350,height=400');return false;" title="Entrar usando o Facebook">
                                                                <span>Entrar usando o Facebook</span>
                                                            </a>
	<h:outputLink value="#{faceBookFaces.url}">
		Login com FaceBook
	</h:outputLink>
</f:view>
</body>
</html>