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

<body>

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
        
        	<%@ include file="/include_destaque_promocao.jsp" %>
        
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<c:if test="${!empty indexFaces.topGeral}">
        	<div class="boxSubCat">
            	<h2>Top Geral</h2>
                <ul id="topGeral">
                	<c:forEach items="${indexFaces.topGeral}" var="top">
                    <li class="${top.css}">
                    	<a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${top.id}" title="${top.nomeFantasia}">
                            <p class="titulo">${top.nomeFantasia}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            
           	<%@ include file="/include_banner_lateral.jsp" %>
            
            <%@ include file="/include_estabelecimentos_lateral.jsp" %>
            
<%--             <%@ include file="/include_quem_indica_lateral.jsp" %> --%>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
<!-- TERMINA CENTRAL -->

	<!-- COMECA RODAPE -->
	<%@ include file="/rodape.jsp" %>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/jquery.jcountdown1.3.js" type="text/javascript"></script>

	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#tempo").countdown({
				date: "${indexFaces.promocao.dataFormatada}", //Counting TO a date
				htmlTemplate: "%{h} <span class='time'>:</span> %{m} <span class='time'>:</span> %{s} <span class='time'></span>",
				
				dataSistema: "${indexFaces.promocao.dataSistema}",
				
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