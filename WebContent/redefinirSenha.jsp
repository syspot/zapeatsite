<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <%@ include file="/head.jsp" %>
</head>

<body>

    <!-- COMECA TOPO -->
    <%@ include file="/topo.jsp" %>

<!-- COMECA CENTRAL -->
<div id="central">
    <!-- COMECA CONTEUDO -->
        <div id="conteudo">
            <!-- COMECA COLUNA PRINCIPAL  -->
            <div id="conteudoRanking">
                <div id="tituloSessao">
            	   <img src="" class="floatLeftMargin4" />
            	   <h2>Redefina de Senha</h2>
                </div>
                <div class="conteudoSobre">
                    Preencha os campos abaixo:
    	   <div id="signup4">
            	   <h:form prependId="false" id="signup5">		    		
                            <div class="inputs">
                                <h:inputSecret tabindex="1" id="a1" maxlength="100" value="#{alteracaoSenhaFaces.usuarioModel.senha}" redisplay="true"/><br />
                                <h:inputSecret tabindex="2" id="a2" maxlength="100" value="#{alteracaoSenhaFaces.usuarioModel.confirmaSenha}" redisplay="true"/>
                                <h:commandButton tabindex="3" styleClass="submit" action="#{alteracaoSenhaFaces.alterarSenha}" id="submit3" value="ALTERAR SENHA" />
                            </div>
                            <input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />
                            <input type="hidden" name="token" value="${alteracaoSenhaFaces.usuarioModel.token}" />
                        </h:form>
                         <script type="text/javascript">
                            $('#a1').attr('placeholder','Senha');
                            $('#a2').attr('placeholder','Confirme a Senha');
                            
                            $('#submit3').live('click', function () {
                                return !isEmpty(new Array("#a1", "#a2"));
                            });
                        </script>
                    </div>
                </div>
                <!-- COMECA COLUNA DIREITA -->
                
            </div>
            <div id="dir">
                <div class="boxSubCat">
                    <img src="img/app.jpg" alt="banner para download app" title="Baixe o Aplicativo" />
                </div>
            </div>
            <!-- TERMINA CONTEUDO -->
        </div>
        
        <!-- TERMINA CENTRAL -->
        <%@ include file="/rodape.jsp" %>
</body>
</html>
</f:view>
