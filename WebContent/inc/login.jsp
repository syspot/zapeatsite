<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<f:view>

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
        	
        	<h:inputText title="E-mail" value="#{loginFaces.usuarioModel.email}" tabindex="1" maxlength="100"/>
            
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

</f:view>