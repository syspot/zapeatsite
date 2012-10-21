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
            	<span class="icons maisIndicados"></span>
            	<h2>Ranking</h2>
                <p>Mais Indicados</p>
            </div>
            
            <c:if test="${!empty rankingFaces.melhorComida}">
        	<div class="coluna">
            	<h2>Melhor Comida</h2>
            	<c:forEach var="item" items="${rankingFaces.melhorComida}">
            	<div class="boxRanking">
                	<span class="${item.css}"></span>
                	<blockquote>
                    	<a href="estabelecimento.jsf?id=${item.id}" title="${item.nomeFantasia}">
                            <span class="imgRank">
                            	<img src="${item.logoMarca18079}" alt="" title="${item.nomeFantasia}" />
                            </span>
                            <div class="info">
                                <p class="titulo">${item.nomeFantasia}</p>
                                <p class="dados">${item.categoriaPrincipal.descricao}</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<p><a href="ranking.jsf?categoriaId=${item.categoriaPrincipal.id}&estabelecimentoId=${item.id}&indico=1" title=""><span class="icons indicacaoRed"></span> Indico [${item.quantidadeIndicacoes}]</a></p>
                    	<p><a href="ranking.jsf?categoriaId=${item.categoriaPrincipal.id}&estabelecimentoId=${item.id}&indico=2" title=""><span class="icons naoindicacaoRed"></span> Não indico</a></p>
                    </div>
                </div>
                </c:forEach>
            </div>
            </c:if>
            
            <c:if test="${!empty rankingFaces.melhorAmbiente}">
            <div class="coluna">
            	<h2>Ambiente</h2>
            	<c:forEach var="item" items="${rankingFaces.melhorAmbiente}">
                <div class="boxRanking">
                	<span class="${item.css}"></span>
                	<blockquote>
                    	<a href="estabelecimento.jsf?id=${item.id}" title="${item.nomeFantasia}">
                            <span class="imgRank"><img src="${item.logoMarca18079}" alt="" title="${item.nomeFantasia}" /></span>
                            <div class="info">
                                <p class="titulo">${item.nomeFantasia}</p>
                                <p class="dados">${item.categoriaPrincipal.descricao}</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="ranking.jsf?categoriaId=${item.categoriaPrincipal.id}&estabelecimentoId=${item.id}&indico=3" title=""><span class="icons indicacaoRed"></span> Eu indico [${item.quantidadeIndicacoes}]</a>
                    </div>
                </div>
                </c:forEach>
            </div>
            </c:if>
                    
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        
        	<%@ include file="/include_promocao_do_dia_lateral.jsp" %>
            
        	<%@ include file="/include_promocao_da_semana_lateral.jsp" %>
            
            <%@ include file="/include_carro_chefe_lateral.jsp" %>
            
           	<%@ include file="/include_banner_lateral.jsp" %>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
	
	<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>

</body>
</html>
</f:view>