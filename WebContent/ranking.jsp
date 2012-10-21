<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Zapeat</title>
<link href="css/padrao.css" rel="stylesheet" type="text/css" />
<link href="css/interna.css" rel="stylesheet" type="text/css" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/fontface.css" rel="stylesheet" type="text/css" />
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=329697663791960";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"> </script>
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
<script src="js/jquery-latest.js"></script>
<script type="text/javascript" src="js/geometa.js"></script>
<script type="text/javascript">
      $(document).ready(function() {
		$('#outrosDestaques > #listagem > li:even').css('background', '#CCE5FF');
		$('#principal ul:eq(0)').css('left','-45px');
		$('#principal ul:eq(1)').css('left','-120px');
		$('#principal ul:eq(2)').css('left','-195px');
		$('#principal ul:eq(3)').css('left','-270px');
		$('#principal ul:eq(4)').css('right','-225px');
		$('#principal ul:eq(5)').css('right','-150px');
		$('#principal ul:eq(6)').css('right','-75px');
		$('#principal ul:eq(7)').css('right','0px');
	  })
</script>
<!--=============MODAL=============-->
	<script type="text/javascript" src="http://fw2.atarde.com.br/fw/js/modal.js">
    $(document).ready(function(){
		$('a.modal').modal({
			closeClickOut:true,
			backgroundColor:"#fff"
	});
	</script>
<!--=============GEOLOCATION=============--> 
<script type="text/javascript">
		//função para botão de acionar geolocation
	$(document).ready(function () {
		// wire up button click
		$('#btnInit').click(function () {
				// teste para a presença do geolocation
			if (navigator && navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(geo_success, geo_error);
			} else {
				error('Geolocation is not supported.');
			}
		});
	});	
		

	function geo_success(position) {
    	printAddress(position.coords.latitude, position.coords.longitude);
	}

	function geo_error(err) {
    	// instead of displaying an error, fall back to MaxMind IP to location library
    	printAddress(geoip_latitude(), geoip_longitude(), true);
	}

	// usa Google Maps API para reversão da sua localização do geocode
	function printAddress(latitude, longitude, isMaxMind) {
		// set up the Geocoder object
		var geocoder = new google.maps.Geocoder();
	 
		// turn coordinates into an object
		var yourLocation = new google.maps.LatLng(latitude, longitude);
		
		// find out info about our location
		geocoder.geocode({ 'latLng': yourLocation }, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {
					
					//--
					//captura infomação requisitada do endereço
					for (var i=0; i<results[0].address_components.length; i++) {
					for (var b=0; b<results[0].address_components[i].types.length;b++) {
		
						if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
							state= results[0].address_components[i];
							break;
						}
						else if (results[0].address_components[i].types[b] == "locality") {
							city= results[0].address_components[i];
							break;
						}
						
					}
					}

					//---
					//aplica dados no input
					$('#info').val(city.long_name + ", " + state.long_name);
					//$('body').append('<p>Seu endereço:<br />' +
					//	city.long_name + " / " + state.long_name + '</p>');						
				} else {
					error('Nenhum resultado foi encontrado.');
				}
			} else {
				error("Reverse Geocoding failed due to: " + status);
			}
		});
			if(isMaxMind){
				$('body').append('<p>IP to Location Service Provided by MaxMind</p>');
			}
		}
		
		function error(msg){
			alert(msg);
		}
		
</script>
</head>

<body>

<script type="text/javascript">
	$(document).ready(function(e) {
		$('.linkLogin').click(function(){
			$('.formLogin').slideToggle().animate({opacity:1})
		})
		$('.linkCadastro,.close').click(function(){
			$('#mascara').slideToggle();
		})
        });
</script>
<!-- COMECA TOPO -->
	<%@ include file="/topo.jsp" %>
<div id="id-Breadcrumb">
<div class="formLogin">
    	<h:form prependId="false" id="form1">
    	<div class="inputs">
        	Preencha os dados ao lado para acessar: 
        	<h:inputText title="E-mail" id="emailLogin" value="#{loginFaces.usuarioModel.email}" required="false" requiredMessage="Email: Obrigatório" tabindex="1" maxlength="100"/>
            <h:inputSecret required="false" id="senhaLogin" maxlength="100" value="#{loginFaces.usuarioModel.senha}" requiredMessage="Senha: Obrigatório" redisplay="true"/>
			<h:commandButton styleClass="submit" action="#{loginFaces.autenticar}" id="submit2" value="ACESSAR"></h:commandButton>
			<script type="text/javascript">
	             		$('#emailLogin').attr('placeholder','E-mail').attr('autofocus','');
	             		$('#senhaLogin').attr('placeholder','Senha');
						
	        </script>
        </div>
        </h:form>
</div>

<c:if test="${!empty sessionScope.usuarioLogado.id}">
<span id="status">Olá, ${sessionScope.usuarioLogado.nome}</span>, temos ótimas promoções pra você!
</c:if> 

</div>

<div align="center">
	<h:messages errorClass="erros msg erro" infoClass="infos msg ok" fatalClass="erros msg erro" showDetail="true"/>
</div>

<div id="mascara">    
<div class="container">
<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="Botão Fechar" class="btnFechar"></a>

	<h:form id="signup" enctype="multipart/form-data" prependId="false">
    
        <div class="header">
        
            <h3>Cadastro</h3>
            
            <p>Preencha os dados abaixo para cadastro</p>
            
        </div>
        
        <div class="sep"></div>

        	<div class="inputs">
				
				<h:inputText required="false" id="nome" maxlength="100" value="#{cadastroFaces.usuarioModel.nome}"/>
				
				<h:inputText required="false" id="email" maxlength="100" value="#{cadastroFaces.usuarioModel.email}"/>
				
				<h:inputSecret required="false" id="senha" maxlength="100" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>
				 
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
</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA PRINCIPAL  -->
    	<div id="conteudoRanking">
        	<div id="tituloSessao">
            	<span class="icons maisIndicados"></span>
            	<h2>Ranking</h2>
                <p>Mais Indicados</p>
            </div>
            
            <c:if test="${!empty rankingFaces.melhorComida}">
        	<div class="coluna">
            	<h2>Melhor Comida</h2>
            	<c:forEach var="item" items="${rankingFaces.melhorComida}">
            	<div class="boxRanking">
                	<span class="${item.css}"></span>
                	<blockquote>
                    	<a href="estabelecimento.jsf?id=${item.id}" title="${item.nomeFantasia}">
                            <span class="imgRank">
                            	<img src="${item.logoMarca18079}" alt="" title="${item.nomeFantasia}" />
                            </span>
                            <div class="info">
                                <p class="titulo">${item.nomeFantasia}</p>
                                <p class="dados">${item.categoriaPrincipal.descricao}</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<p><a href="ranking.jsf?categoriaId=${item.categoriaPrincipal.id}&estabelecimentoId=${item.id}&indico=1" title=""><span class="icons indicacaoRed"></span> Indico [${item.quantidadeIndicacoes}]</a></p>
                    	<p><a href="ranking.jsf?categoriaId=${item.categoriaPrincipal.id}&estabelecimentoId=${item.id}&indico=2" title=""><span class="icons naoindicacaoRed"></span> Não indico</a></p>
                    </div>
                </div>
                </c:forEach>
            </div>
            </c:if>
            
            <c:if test="${!empty rankingFaces.melhorAmbiente}">
            <div class="coluna">
            	<h2>Ambiente</h2>
            	<c:forEach var="item" items="${rankingFaces.melhorAmbiente}">
                <div class="boxRanking">
                	<span class="${item.css}"></span>
                	<blockquote>
                    	<a href="estabelecimento.jsf?id=${item.id}" title="${item.nomeFantasia}">
                            <span class="imgRank"><img src="${item.logoMarca18079}" alt="" title="${item.nomeFantasia}" /></span>
                            <div class="info">
                                <p class="titulo">${item.nomeFantasia}</p>
                                <p class="dados">${item.categoriaPrincipal.descricao}</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="ranking.jsf?categoriaId=${item.categoriaPrincipal.id}&estabelecimentoId=${item.id}&indico=3" title=""><span class="icons indicacaoRed"></span> Eu indico [${item.quantidadeIndicacoes}]</a>
                    </div>
                </div>
                </c:forEach>
            </div>
            </c:if>
                    
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<c:if test="${not empty indexFaces.promocaoDia.id}">
        	<div class="boxSubCat">
            	<h2>Promoção do dia</h2>
            	<a href="promocao.jsf?id=${indexFaces.promocaoDia.id}" title="">
                    <img src="${indexFaces.promocaoDia.imagemPromocaoThumbView}" alt="" title="" />
                    <p class="titulo">${indexFaces.promocaoDia.fornecedorModel.nomeFantasia}</p>
                    <p class="item">
                    ${indexFaces.promocaoDia.descricao}</p>
                    <!-- SE PROMOÇÃO EM DESCONTO -->
                    <p><span class="precoDe">
                    De: <h:outputText value="#{indexFaces.promocaoDia.precoOriginal}">
                    		<f:convertNumber type="currency" currencySymbol="R$"/>
                    	</h:outputText></span>&nbsp;&nbsp;
                    	<span class="precoPor">
                    Por: 
                    	<h:outputText value="#{indexFaces.promocaoDia.precoPromocional}">
                    		<f:convertNumber type="currency" currencySymbol="R$"/>
                    	</h:outputText></span>
                    	<p><span class="fontYi">${indexFaces.promocaoDia.descricao}</span></p>
                </a>
            </div>
            </c:if>
            
        	<c:if test="${not empty indexFaces.promocaoSemana.id}">
        	<div class="boxSubCat">
            	<h2>Promoção da semana</h2>
                <a href="promocao.jsf?id=${indexFaces.promocaoSemana.id}" title="">
                	<img src="${indexFaces.promocaoSemana.imagemPromocaoThumbView}" alt="" title="" />
                    <p class="titulo">${indexFaces.promocaoSemana.fornecedorModel.nomeFantasia}</p>
                    <p><span class="precoDe">
                    De: <h:outputText value="#{indexFaces.promocaoSemana.precoOriginal}">
                    		<f:convertNumber type="currency" currencySymbol="R$"/>
                    	</h:outputText></span>&nbsp;&nbsp;
                    	<span class="precoPor">
                    Por: 
                    	<h:outputText value="#{indexFaces.promocaoSemana.precoPromocional}">
                    		<f:convertNumber type="currency" currencySymbol="R$"/>
                    	</h:outputText></span>
                    	
                    	<p><span class="fontYi">${indexFaces.promocaoSemana.descricao}</span></p>
                  </a>   
            </div>
            </c:if>
            
            <c:if test="${not empty indexFaces.carroChefeModel.id}">
            <div class="boxSubCat">
            	<h2>Carro-chefe</h2>
                <a href="promocao.jsf?carroChefeId=${indexFaces.carroChefeModel.id}" title="">
                	<img src="${indexFaces.carroChefeModel.imagemThumbView}" alt="" title="" /></a>
                <p class="titulo">${indexFaces.carroChefeModel.fornecedorModel.nomeFantasia}</p>
                <p><span class="item">${indexFaces.carroChefeModel.descricao}</span></p>
                </a>
            </div>
            </c:if>
            
           	<%@ include file="/include_banner_lateral.jsp" %>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>
<!-- TERMINA RODAPE -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
</body>
</html>
</f:view>