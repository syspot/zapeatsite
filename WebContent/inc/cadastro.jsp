<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>
<%@ taglib uri="http://primefaces.prime.com.tr/ui" prefix="p"%>

<f:view>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:p="http://primefaces.org/ui">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Zapeat</title>
<link href="css/padrao.css" rel="stylesheet" type="text/css" />
<link href="css/home.css" rel="stylesheet" type="text/css" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/fontface.css" rel="stylesheet" type="text/css" />
<p:resources/>
</head>
<body>
<div class="container">
<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="Botão Fechar" class="btnFechar"></a>

	<h:form id="signup" enctype="multipart/form-data">
    
        <div class="header">
        
            <h3>Cadastro</h3>
            
            <p>Preencha os dados abaixo para cadastro</p>
            
            <h:messages showSummary="false" showDetail="true" globalOnly="true"/>
            
        </div>
        
        <div class="sep"></div>

        	<div class="inputs">

				<h:inputText id="nome" value="#{cadastroFaces.usuarioModel.nome}"/>
				<p:watermark value="Nome" for="nome"/>
				
				<h:inputText id="email" value="#{cadastroFaces.usuarioModel.email}"/>
				<p:watermark value="E-mail" for="email"/>
				
				<h:inputSecret id="senha" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>
				<p:watermark value="Senha" for="senha"/>
				
				<!-- 
	            <div class="checkboxy">
	            	
	            	<h:selectBooleanCheckbox id="checky"/>
	            	<h:outputLabel for="checky" styleClass="terms" value="Estou de acordo com o termo de uso."/>
	            	
	            </div>
	             -->
	            
        	</div>
            
            <div class="custom_file_upload">
            	
                <t:inputFileUpload storage="file" value="#{cadastroFaces.arquivo}"/>
            </div>

        <div class="inputs">   
        	
        	<h:commandButton value="CADASTRAR" action="#{cadastroFaces.insertEvent}"/>
            
        </div>

    </h:form>

</div>
</body>
</html>
</f:view>