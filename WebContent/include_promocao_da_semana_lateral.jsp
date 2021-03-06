<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty indexFaces.promocaoDaSemana}">

	<div class="boxSubCat">
	   	<h2>Zapeat da semana</h2>
	       <a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${indexFaces.promocaoDaSemana.id}&estabelecimento_id=${indexFaces.promocaoDaSemana.fornecedorModel.id}" title="${indexFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}">
	    	<img src="${indexFaces.promocaoDaSemana.imagemPromocaoThumbView}" alt="${indexFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}" title="${indexFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}" width="180" height="109" />
	        <p class="titulo">${indexFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}</p>
	        <c:if test="${not empty indexFaces.promocaoDaSemana.precoOriginal}">
		        <span class="precoDe">
		        	De: 
		        	<h:outputText value="#{indexFaces.promocaoDaSemana.precoOriginal}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>&nbsp;&nbsp;
        	</c:if>
        	<c:if test="${not empty indexFaces.promocaoDaSemana.precoPromocional}">
	        	<span class="precoPor">
	        		Por: 
		        	<h:outputText value="#{indexFaces.promocaoDaSemana.precoPromocional}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>
        	</c:if>
	        	<p><span class="fontYi">${indexFaces.promocaoDaSemana.descricao}</span></p>
	      </a>   
	</div>
	
</c:if>