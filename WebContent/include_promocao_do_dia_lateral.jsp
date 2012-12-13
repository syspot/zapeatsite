<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty indexFaces.promocaoDoDia}">

	<div class="boxSubCat">
	   	<h2>Zapeat do dia</h2>
	       <a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${indexFaces.promocaoDoDia.id}&estabelecimento_id=${indexFaces.promocaoDoDia.fornecedorModel.id}" title="${indexFaces.promocaoDoDia.fornecedorModel.nomeFantasia}">
	    	<img src="${indexFaces.promocaoDoDia.imagemPromocaoThumbView}" alt="${indexFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" title="${indexFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" />
	        <p class="titulo">${indexFaces.promocaoDoDia.fornecedorModel.nomeFantasia}</p>
	        <c:if test="${not empty indexFaces.promocaoDoDia.precoOriginal}">
		        <span class="precoDe">
		        	De: 
		        	<h:outputText value="#{indexFaces.promocaoDoDia.precoOriginal}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>&nbsp;&nbsp;
        	</c:if>
        	<c:if test="${not empty indexFaces.promocaoDoDia.precoPromocional}">
	        	<span class="precoPor">
	        		Por: 
		        	<h:outputText value="#{indexFaces.promocaoDoDia.precoPromocional}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>
        	</c:if>
	        	<p><span class="fontYi">${indexFaces.promocaoDoDia.descricao}</span></p>
	      </a>   
	</div>
	
</c:if>