<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty estabelecimentoFaces.promocaoDoDia}">

	<div class="boxSubCat">
	   	<h2>Promoção do dia</h2>
	       <a href="promocao.jsf?id=${estabelecimentoFaces.promocaoDoDia.id}" title="${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}">
	    	<img src="${estabelecimentoFaces.promocaoDoDia.imagemPromocaoThumbView}" alt="${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" title="${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" />
	        <p class="titulo">${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}</p>
	        <p><span class="precoDe">
	        De: <h:outputText value="#{estabelecimentoFaces.promocaoDoDia.precoOriginal}">
	        		<f:convertNumber type="currency" currencySymbol="R$"/>
	        	</h:outputText></span>&nbsp;&nbsp;
	        	<span class="precoPor">
	        Por: 
	        	<h:outputText value="#{estabelecimentoFaces.promocaoDoDia.precoPromocional}">
	        		<f:convertNumber type="currency" currencySymbol="R$"/>
	        	</h:outputText></span>
	        	
	        	<p><span class="fontYi">${estabelecimentoFaces.promocaoDoDia.descricao}</span></p>
	      </a>   
	</div>
	
</c:if>