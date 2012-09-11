<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>

<f:view>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:p="http://primefaces.prime.com.tr/ui">

<body>

<div class="container">
<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="BotÃ£o Fechar" class="btnFechar"></a>
    
    <h:form id="signup">
    
        <div class="header">
        
            <h3>Login</h3>
            
            <p>Preencha os dados abaixo para acessar</p>
            
            <h:messages showDetail="true" showSummary="false" globalOnly="true"/>
            
        </div>
        
        <div class="sep"></div>

        <div class="inputs">
        	
        	<!-- <input type="email" placeholder="E-mail" autofocus /> -->
        	
        	<p:inputText id="email"></p:inputText>
        	<p:watermark value="Email" for="email"></p:watermark>
            
        	<h:inputSecret title="Senha" redisplay="true" value="#{loginFaces.usuarioModel.senha}" maxlength="100" tabindex="2"/>
            
            <!-- <input type="password" placeholder="Password" /> -->
            
            <!--<div class="checkboxy">
                <input name="cecky" id="checky" value="1" type="checkbox" /><label class="terms">I accept the terms of use</label>
            </div>-->
            <h:commandButton value="ACESSAR" id="submit" action="#{loginFaces.autenticar}"/>
            
            <!-- <a id="submit" href="#">ACESSAR</a> -->
        
        </div>

    </h:form>

</div>
</body>
</html>
</f:view>
