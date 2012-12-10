<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty estabelecimentoFaces.promocaoDaSemana}">

	<div class="boxSubCat">
	   	<h2>Promoção da semana</h2>
	       <a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${estabelecimentoFaces.promocaoDaSemana.id}&estabelecimento_id=${estabelecimentoFaces.promocaoDaSemana.fornecedorModel.id}" title="${estabelecimentoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}">
	    	<img src="${estabelecimentoFaces.promocaoDaSemana.imagemPromocaoThumbView}" alt="${estabelecimentoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}" title="${estabelecimentoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}" />
	        <p class="titulo">${estabelecimentoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}</p>
	        <c:if test="${not empty estabelecimentoFaces.promocaoDaSemana.precoOriginal}">
		        <span class="precoDe">
		        	De: 
		        	<h:outputText value="#{estabelecimentoFaces.promocaoDaSemana.precoOriginal}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>&nbsp;&nbsp;
        	</c:if>
        	<c:if test="${not empty estabelecimentoFaces.promocaoDaSemana.precoPromocional}">
	        	<span class="precoPor">
	        		Por: 
		        	<h:outputText value="#{estabelecimentoFaces.promocaoDaSemana.precoPromocional}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>
        	</c:if>
	        	
	        	<p><span class="fontYi">${estabelecimentoFaces.promocaoDaSemana.descricao}</span></p>
	      </a>   
	</div>
	
</c:if>