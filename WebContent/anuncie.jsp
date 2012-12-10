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

            	<img src="${rankingFaces.categoriaModel.imagemView}" class="floatLeftMargin4" />
            	<h2>Anuncie no site</h2>
                <!-- <p>Promova-se</p> -->
            </div>
            
            <div class="conteudoSobre">
                <p>Anuncie em nosso site! Milhões de pessoas acessando promoções em sua cidade. Sua empresa pode ser em outro ramo de atividade, não importa. O que vale é sua visibilidade. Entre em contato conosco para negociação. Não perca esta oportunidade!

				<p>Fale com o zapeat:</p>

				<p>Mande sua mensagem, tire suas dúvidas e entre em contato conosco pelo e-mail: contato@zapeat.com</p>
            
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
