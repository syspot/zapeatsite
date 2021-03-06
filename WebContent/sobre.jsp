<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>

<!DOCTYPE html>
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
    
    	<!-- COMECA COLUNA PRINCIPAL  -->
    	<div id="conteudoRanking">
        	<div id="tituloSessao">

            	<h2>Sobre o Zapeat</h2>
                
            </div>
            
            <div class="conteudoSobre">
                <p>Zap é o ato de mudar rapidamente o canal a procura de algo interessante para assistir, geralmente com um controle remoto. Agora imagine você com um smartphone procurando rapidamente algo interessante para comer ou se divertir? Este é o ZAP+EAT!
Aqui você encontra os melhores restaurantes, bares, baladas e afins tão rápido quanto sua vontade, e à distância de suas mãos. Veja qual a comida carro chefe de seu restaurante favorito, ou saiba qual a posição de cada estabelecimento no ranking das indicações. Opine e acesse comentários de outros zapeatianos. Curta e faça parte desta tribo. Baixe o aplicativo e zapeat pelo seu smartphone.
</p>
            
            </div>
            
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        
        	<div class="boxSubCat">
            	<img src="img/app.jpg" alt="banner para download app" title="Baixe o Aplicativo" />
            </div>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
	
	<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>


	

</body>
</html>
</f:view>
