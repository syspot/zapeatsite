<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty promocaoFaces.promocaoDaSemana}">

	<div class="boxSubCat">
	   	<h2>Zapeat da semana</h2>
	       <a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocaoFaces.promocaoDaSemana.id}&estabelecimento_id=${promocaoFaces.promocaoDaSemana.fornecedorModel.id}" title="${promocaoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}">
	    	<img src="${promocaoFaces.promocaoDaSemana.imagemPromocaoThumbView}" alt="${promocaoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}" title="${promocaoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}" width="180" height="109"/>
	        <p class="titulo">${promocaoFaces.promocaoDaSemana.fornecedorModel.nomeFantasia}</p>
	        <c:if test="${not empty promocaoFaces.promocaoDaSemana.precoOriginal}">
	        	<span class="precoDe">
	        		De: 
	        		<h:outputText value="#{promocaoFaces.promocaoDaSemana.precoOriginal}">
	        			<f:convertNumber type="currency" currencySymbol="R$"/>
        			</h:outputText></span>&nbsp;&nbsp;
   			</c:if>
   			<c:if test="${not empty promocaoFaces.promocaoDaSemana.precoPromocional}">
	        	<span class="precoPor">
	        		Por: 
		        	<h:outputText value="#{promocaoFaces.promocaoDaSemana.precoPromocional}">
		        		<f:convertNumber type="currency" currencySymbol="R$"/>
		        	</h:outputText></span>
        	</c:if>
	        	<p><span class="fontYi">${promocaoFaces.promocaoDaSemana.descricao}</span></p>
	      </a>   
	</div>
	
</c:if>