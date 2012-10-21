<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>

 	<%@ include file="/head.jsp" %>

</head>

<body onload="initialize()">

<!-- COMECA TOPO -->

	<%@ include file="/topo.jsp" %>
	
<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    			
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esq">
    		
    		<%@ include file="/include_promocao_do_dia_lateral.jsp" %>
            
            <%@ include file="/include_promocao_da_semana_lateral.jsp" %>
            
            <%@ include file="/include_carro_chefe_lateral.jsp" %>
            
        </div>
        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        
        	
        
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<c:if test="${!empty indexFaces.topGeral}">
        	<div class="boxSubCat">
            	<h2>Top Geral</h2>
                <ul id="topGeral">
                	<c:forEach items="${indexFaces.topGeral}" var="top">
                    <li class="${top.css}">
                    	<a href="estabelecimento.jsf?id=${top.id}" title="${top.nomeFantasia}">
                            <p class="titulo">${top.nomeFantasia}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            
           	<%@ include file="/include_banner_lateral.jsp" %>
            
            <%@ include file="/include_estabelecimentos_lateral.jsp" %>
            
            <c:if test="${!empty indexFaces.comentarioModel.id}">
            <div class="boxSubCat">
            	<h2>Quem Indica</h2>
                <span class="imgDestaque-peq posRel">
                	<a href="estabelecimento.jsf?id=${indexFaces.comentarioModel.fornecedorModel.id}" title="">
                        <img src="${indexFaces.comentarioModel.fornecedorModel.imagemThumbView}" alt="" title="" />
                        <p class="tituloIndica">${indexFaces.comentarioModel.fornecedorModel.nomeFantasia}</p>
                    </a>
                </span>
                <c:if test="${!empty indexFaces.comentarioModel.id}">
                <p class="comment">${indexFaces.comentarioModel.descricao}</p>
                </c:if>
                <p class="autor">${indexFaces.comentarioModel.usuarioModel.nome}</p>
            </div>
            </c:if>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
<!-- TERMINA CENTRAL -->
<!-- COMECA RODAPE -->
	<%@ include file="/rodape.jsp" %>
<!-- TERMINA RODAPE -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://pluginjquery.com.br/labs/countdown1.3/script/jquery.jcountdown1.3.js" type="text/javascript"></script>
<script src="js/jquery.countdown-pt-BR.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#tempo").countdown({
		date: "${indexFaces.promocaoHora.dataFormatada}", //Counting TO a date
		htmlTemplate: "%{h} <span class=\"time\">:</span> %{m} <span class=\"time\">:</span> %{s} <span class=\"time\"></span>",
		
		onChange: function( event, timer ){

		},
		onComplete: function( event ){

			$(this).html("Finalizado");
		},
		onPause: function( event, timer ){

			$(this).html("Pause");
		},
		onResume: function( event ){

			$(this).html("Resumed");
		},
		leadingZero: true
	});

});
</script>
</body>

</html>
</f:view>