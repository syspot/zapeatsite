<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="p" uri="http://primefaces.prime.com.tr/ui"%>

<f:view>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Zapeat</title>
<link href="css/padrao.css" rel="stylesheet" type="text/css" />
<link href="css/home.css" rel="stylesheet" type="text/css" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/fontface.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-latest.js"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready( function() {
	$("#signup").validate({
		// Define as regras
		rules:{
			
			email:{
				// campoEmail será obrigatório (required) e precisará ser um e-mail válido (email)
				required: true, email: true
			},
			senha:{
				// campoMensagem será obrigatório (required) e terá tamanho mínimo (minLength)
				required: true, minlength: 6
			}
		},
		// Define as mensagens de erro para cada regra
		messages:{
			
			email:{
				required: "E-mail: Obrigatório",
				email: "E-mail inválido"
			},
			
			senha:{
				required: "Senha: Obrigatório",
				minlength: "Sua senha deve ter no mínimo, 6 caracteres"
			}
		}
	});
});
</script>

</head>
<body>

<div class="container">
<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="BotÃ£o Fechar" class="btnFechar"></a>
    
    <h:form id="signup" enctype="multipart/form-data" prependId="false">
    
        <div class="header">
        
            <h3>Login</h3>
            
            <p>Preencha os dados abaixo para acessar</p>
            
        </div>
        
        <div class="sep"></div>
		
		<div align="center">
        	<h:messages globalOnly="false" errorStyle="color:red;" fatalStyle="color:red;" showDetail="true" showSummary="false" fatalClass="error" errorClass="error" id="msg"/>
        </div>
            
        <div class="inputs">
        	
        	<h:inputText title="E-mail" id="email" value="#{loginFaces.usuarioModel.email}" required="true" requiredMessage="Email: Obrigatório" tabindex="1" maxlength="100"/>
            
            <h:inputSecret required="true" id="senha" maxlength="100" value="#{loginFaces.usuarioModel.senha}" requiredMessage="Senha: Obrigatório" redisplay="true"/>
            
            <script type="text/javascript">
	             		$('#email').attr('placeholder','E-mail').attr('autofocus','');
	             		$('#senha').attr('placeholder','Senha');
						
	        </script>
	        
	        <h:commandButton value="ACESSAR" id="submit" action="#{loginFaces.autenticar}"/>
	        
        </div>

    </h:form>

</div>
</body>
</html>
</f:view>