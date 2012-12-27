<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<%@ include file="/head.jsp" %>
</head>
<f:view>
<body >

	<!-- COMECA TOPO -->
	<%@ include file="/topo.jsp" %>

<!-- COMECA CENTRAL -->
<div id="central">
	
	<div id="conteudo">
        
        <!-- COMECA COLUNA MEIO -->
        <div id="contCategoria">
        	<div id="tituloSessao">
            	<span class="icons outrasCat"></span>
            	<h2>Outras categorias</h2>
            </div>
            
            <ul id="listagemCat">

				<c:forEach items="${listagemCategoriaFaces.outrasCategorias}" var="categoria">

					<li>
                    	<div class="boxInfoCat">
                   			<p class="titulo"><img src="${categoria.imagemView}" alt="${categoria.descricao}" title="${categoria.descricao}" class="floatLeftMargin4" />${categoria.descricao}</p>
                           	<ul>
                           		<li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${categoria.id}&tipo=3" title="promoção da semana">zapeat da semana</a></li>
                            	<li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${categoria.id}&tipo=2" title="promoção do dia">zapeat do dia</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${categoria.id}&tipo=1" title="promoção da hora">zapeat da hora</a></li>
	                            <li><a href="ranking.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${categoria.id}" title="ranking">ranking</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${categoria.id}&tipo=5" title="carro-chefe">carro-chefe</a></li>
                            	<li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${categoria.id}&tipo=6" title="estabelecimento">estabelecimento</a></li>
                           	</ul>
                       	</div>
                   	</li>
                   	
           		</c:forEach>
                   
			</ul>
                
            <div id="paginacao">
            
            	<c:if test="${listagemCategoriaFaces.qtdPaginas > 1}">
           			
           				<c:choose>
               				<c:when test="${not empty listagemCategoriaFaces.page and listagemCategoriaFaces.page != 1}">
               					<li class="inicio"><a href="outrasCat.jsf?cidade=${cidadeFaces.cidadeSelecionada}&page=${listagemCategoriaFaces.page - 1}" title=""><span class="icons pagInicio"></span></a></li>
               				</c:when>
               				<c:otherwise>
               					<li class="inicio"><span class="icons pagInicio"></span></li>
               				</c:otherwise>
               			</c:choose>
               			
	               		<c:forEach begin="${listagemCategoriaFaces.paginaInicial}" end="${listagemCategoriaFaces.paginaFinal}" var="pagina">
		                    <li class="pagina"><a href="outrasCat.jsf?cidade=${cidadeFaces.cidadeSelecionada}&page=${pagina}" title="">${pagina}</a></li>
		                </c:forEach>
	                
						<c:choose>
	          				<c:when test="${listagemCategoriaFaces.page != listagemCategoriaFaces.qtdPaginas}">
	          					<li class="fim"><a href="outrasCat.jsf?cidade=${cidadeFaces.cidadeSelecionada}&page=${listagemCategoriaFaces.page + 1}" title=""><span class="icons pagFim"></span></a></li>
	          				</c:when>
	          				<c:otherwise>
	          					<li class="inicio"><span class="icons pagFim"></span></li>
	          				</c:otherwise>
      					</c:choose>
						
                </c:if>
                
            </div>

        </div>
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	
			<%@ include file="/include_estabelecimentos_lateral.jsp" %>
			
        	<%@ include file="/include_banner_lateral.jsp" %>

        </div>
        
    </div>
    <!-- TERMINA CONTEUDO -->
    
</div>

	<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>

</body>
</f:view>
</html>
