<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"%>

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
			nome:{
				// campoNome será obrigatório (required) e terá tamanho mínimo (minLength)
				required: true
			},
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
			nome:{
				required: "Nome: Obrigatório",
				
			},
			email:{
				required: "E-mail: Obrigatório",
				email: "E-mail inválido"
					
			},
			
			senha:{
				required: "Senha: Obrigatório",
				minlength: "Sua senha deve ter no mínimo, 6 caracteres"
			}
		},
		
	});
});
</script>
</head>
<body>
<div class="container">
<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="Botão Fechar" class="btnFechar"></a>

	<h:form id="signup" enctype="multipart/form-data" prependId="false">
    
        <div class="header">
        
            <h3>Cadastro</h3>
            
            <p>Preencha os dados abaixo para cadastro</p>
            
            <h:messages showSummary="false" showDetail="true" globalOnly="true"/>
            
        </div>
        
        <div class="sep"></div>

        	<div class="inputs">
				
				<h:inputText required="true" id="nome" maxlength="100" value="#{cadastroFaces.usuarioModel.nome}"/>
				
				<h:inputText required="true" id="email" maxlength="100" value="#{cadastroFaces.usuarioModel.email}"/>
				
				<h:inputSecret required="true" id="senha" maxlength="100" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>
				 
	             <script type="text/javascript">
	             		$('#nome').attr('placeholder','Nome').attr('autofocus','');
	             		$('#email').attr('placeholder','E-mail');
	             		$('#senha').attr('placeholder','Senha');
						
	            </script>
	            
        	</div>
        	
            
            <div class="custom_file_upload">
            	
                <t:inputFileUpload storage="file" value="#{cadastroFaces.arquivo}" id="file"/>
                
            </div>

        <div class="inputs">   
        	
        	<h:commandButton styleClass="submit" id="submit" value="CADASTRAR" action="#{cadastroFaces.insertEvent}"/>
            
        </div>

    </h:form>

</div>
</body>
</html>
</f:view>