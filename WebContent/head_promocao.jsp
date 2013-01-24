<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--start Facebook Open Graph Protocol-->
<link rel="shortcut icon" href="img/favicon.ico" />
<meta property="og:site_name" content="Zapeat" />
<meta property="og:title" content="${promocaoFaces.titulo}" />
<meta property="og:description" content="${promocaoFaces.descricao}"/>
<meta property="og:url" content="${promocaoFaces.url}"/>
<meta property="og:image" content="http://www.tigurio.com.br/cliente/topsys/zapeat/final/img/marca.png"/>
<meta property="fb:app_id" content="${promocaoFaces.facebookId}"/>
<!--end Facebook Open Graph Protocol--> 

<%@ include file="/head.jsp"%>