<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>

 	<%@ include file="/head.jsp" %>

</head>

<body>

<!-- COMECA TOPO -->

	<%@ include file="/topo.jsp" %>
	
<!-- COMECA CENTRAL -->
<div id="central">
	
	<div align="center">
	
	<h:form>
	 
	<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />
	<t:inputHidden value="#{termoUsoFaces.id}" id="token" forceId="true"/>
	
	<h:selectBooleanCheckbox value="#{termoUsoFaces.flagAceito}"/>
	<h:outputText value="Li e aceito os " styleClass="header"/>
	<a href="files/TermosCondicoesGeraisUsoSiteZapeat.pdf" target="_blank">Termos e Condições Gerais de Uso</a>
	
	<h:commandButton value="Confirmar" action="#{termoUsoFaces.confirmarTermo}" />
	 
	</h:form>
	
	</div>
	
	
</div>
<!-- TERMINA CENTRAL -->

	<!-- COMECA RODAPE -->
	<%@ include file="/rodape.jsp" %>

	
</body>

</html>
</f:view>