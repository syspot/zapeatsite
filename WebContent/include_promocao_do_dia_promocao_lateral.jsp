<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty promocaoFaces.promocaoDoDia}">

	<div class="boxSubCat">
	   	<h2>Zapeat do dia</h2>
	       <a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocaoFaces.promocaoDoDia.id}&estabelecimento_id=${promocaoFaces.promocaoDoDia.fornecedorModel.id}" title="${promocaoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}">
	    	<img src="${promocaoFaces.promocaoDoDia.imagemPromocaoThumbView}" alt="${promocaoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" title="${promocaoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}" width="180" height="109" />
	        <p class="titulo">${promocaoFaces.promocaoDoDia.fornecedorModel.nomeFantasia}</p>
	        <c:if test="${not empty promocaoFaces.promocaoDoDia.precoOriginal}">
		        <span class="precoDe">
		        	De: 
		        	<h:outputText value="#{promocaoFaces.promocaoDoDia.precoOriginal}">
	        			<f:convertNumber type="currency" currencySymbol="R$"/>
	        		</h:outputText></span>&nbsp;&nbsp;
       		</c:if>
       		<c:if test="${not empty promocaoFaces.promocaoDoDia.precoPromocional}">
	        	<span class="precoPor">
	        		Por: 
		        	<h:outputText value="#{promocaoFaces.promocaoDoDia.precoPromocional}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>
        	</c:if>
	        	
	        	<p><span class="fontYi">${promocaoFaces.promocaoDoDia.descricao}</span></p>
	      </a>   
	</div>
	
</c:if>