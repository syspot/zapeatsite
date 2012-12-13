<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty estabelecimentoFaces.promocaoDoDia}">

	<div class="boxSubCat">
	   	<h2>Zapeat do dia</h2>
	       <a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${estabelecimentoFaces.promocaoDoDia.id}&estabelecimento_id=${estabelecimentoFaces.promocaoDoDia.fornecedorModel.id}" title="${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}">
	    	<img src="${estabelecimentoFaces.promocaoDoDia.imagemPromocaoThumbView}" alt="${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" title="${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" />
	        <p class="titulo">${estabelecimentoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}</p>
	        <c:if test="${not empty estabelecimentoFaces.promocaoDoDia.precoOriginal}">
		        <span class="precoDe">
		        	De: 
		        	<h:outputText value="#{estabelecimentoFaces.promocaoDoDia.precoOriginal}">
	        			<f:convertNumber type="currency" currencySymbol="R$"/>
	        		</h:outputText></span>&nbsp;&nbsp;
       		</c:if>
       		<c:if test="${not empty estabelecimentoFaces.promocaoDoDia.precoPromocional}">
	        	<span class="precoPor">
	        		Por: 
		        	<h:outputText value="#{estabelecimentoFaces.promocaoDoDia.precoPromocional}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>
        	</c:if>
	        	<p><span class="fontYi">${estabelecimentoFaces.promocaoDoDia.descricao}</span></p>
	      </a>   
	</div>
	
</c:if>