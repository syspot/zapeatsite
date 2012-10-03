<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Zapeat</title>
<link href="css/padrao.css" rel="stylesheet" type="text/css" />
<link href="css/home.css" rel="stylesheet" type="text/css" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/fontface.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"> </script>
<script src="js/jquery-latest.js"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
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
		$('#principal ul:eq(7)').css('right','-0px');
	  })
</script>

<!--=============MODAL=============-->
	<script type="text/javascript" src="js/modal.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
		$('a.modal').modal({
			closeClickOut:true,
			backgroundColor:"#fff"
	});
	</script>
<!--=============GEOLOCATION=============--> 
<script type="text/javascript">
		//função para botão de acionar geolocation
 		jQuery(window).ready(function(){  
            jQuery("#btnInit").click(function(){
				$('#info').val(initialize);
				}); 			
        })
		
		//inicia o geolocation
		function initialize() {
			// teste para a presença do geolocation
			if (navigator && navigator.geolocation) {
				// faz a requisição da posição do usuário
				navigator.geolocation.getCurrentPosition(geo_success, geo_error);
			} else {
				// use MaxMind IP to location API fallback
				printAddress(geoip_latitude(), geoip_longitude(), true);
			}
		}
	


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

<body onload="initialize()">

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
    			
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esq">
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
        </div>
        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="destaque">
            	<div id="fotoDestaque">
	                <a href="promocao.jsf?id=${indexFaces.promocaoHora.id}">
	                	<img src="${indexFaces.promocaoHora.imagemPromocaoFullView}" alt="" title="" />
	                </a>
                    <div class="tituloPromo">
                    	<p><span class="tipoPromo">Promoção da hora</span></p>
                        <p><span class="nomePromo"><c:out value="${indexFaces.promocaoHora.titulo}"/>/${indexFaces.promocaoHora.fornecedorModel.nomeFantasia}</span></p>
                    </div>
                </div>
                <div id="faixa">
 	               <div class="marca">
 	               	<img src="${indexFaces.promocaoHora.fornecedorModel.logoMarcaView}" alt="" title="${indexFaces.promocaoHora.fornecedorModel.nomeFantasia}" />
 	               </div>
                   <p class="percentual">${indexFaces.promocaoHora.percentualDesconto}%</p>
                   <p class="fontYi font10px">desconto</p>
                </div>
                <blockquote class="fontYi">
                	<p>${indexFaces.promocaoHora.descricao}</p>
                </blockquote>
                <div class="map">
                	<script>
					  var map;
					  
					  function initializeMap() {
						// Creating a map
						var lat = ${indexFaces.promocaoHora.fornecedorModel.latitude}
						var lng = ${indexFaces.promocaoHora.fornecedorModel.longitude}
						var latlng = new google.maps.LatLng(lat, lng); 
						var map = new google.maps.Map(document.getElementById('map_canvas'), {  
						  zoom: 17,
						  center: latlng,
						  mapTypeId: google.maps.MapTypeId.ROADMAP
						});
						
						// Creating a marker and positioning it on the map
						var marker = new google.maps.Marker({
						  position: latlng, 
						  map: map,
						  clickable: false,
						  icon: 'img/markerAzul.png'
						});
					  }
				
					  google.maps.event.addDomListener(window, 'load', initializeMap);
				</script>
                	<div id="map_canvas"></div>
                    <div class="shadow1"></div>
                    <div class="shadow2"></div>
                    <div class="shadow3"></div>
                    <div class="shadow4"></div>
                </div>
                <div class="clear"></div>
                <div class="barraCompartilhamento">
	                <a href="http://www.facebook.com/sharer.php?u=URL_da_materia" target="_blank" title="Facebook"><img src="img/btnFb.jpg" title="Recomendar" /></a>
                    <div class="fb-like" data-href="http://www.zapeat.com.br" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>
                </div> 
            </div>
            <div id="outrosDestaques">
            	<h2>Outras Promoções da Hora</h2>
            		
                   <ul id="listagem">
                   
                   <c:forEach var="promocao" items="${indexFaces.promocoesHora}">
                	<li>
                		<a href="promocao.jsf?id=${promocao.id}" title="">
                            <div class="marca floatLeft">
                            	<img src="${promocao.imagemPromocaoThumbView}" alt="" title="${promocao.fornecedorModel.nomeFantasia}" />
                           </div>
                            <!-- SE PROMOÇÃO EM PRODUTO -->
                            <div class="info">
                                <p class="titulo">${promocao.titulo}</p>
                                <p class="resumo fontYi">
                                ${promocao.descricao}
                                </p>
                            </div>
                        </a>
                        <div class="dados">
                            <p>
                            	<span class="icons tel"></span>${promocao.fornecedorModel.telefone}
                            </p>
                            <p>
                            	<c:if test="${not empty promocao.fornecedorModel.site}">
	                            	<div ><span class="icons site"></span> <a href="${promocao.fornecedorModel.site}" target="_blank" title="${promocao.fornecedorModel.site}">Visite o site</a> </div>
			           			</c:if>
                            	
                            </p>
                            <p>
                            	<span class="icons indicacao"></span>${promocao.indicacoes}
                            </p>
                        </div>
                    </li>
                    
                </c:forEach>
                </ul>
            	
            </div>
        
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<c:if test="${!empty indexFaces.topGeral}">
        	<div class="boxSubCat">
            	<h2>Top Geral</h2>
                <ul id="topGeral">
                	<c:forEach items="${indexFaces.topGeral}" var="top">
                    <li class="${top.css}">
                    	<a href="estabelecimento.jsf?id=${top.id}" title="${top.nomeFantasia}">
                            <p class="titulo">${top.nomeFantasia}</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            
            <c:if test="${!empty indexFaces.bannerModel.imagem}">
            <div class="boxSubCat">
            	<%@ include file="/include_banner_lateral.jsp" %>
            </div>
            </c:if>
            
            <c:if test="${!empty indexFaces.estabelecimentos}">
            <div class="boxSubCat">
            	<h2>Estabelecimentos</h2>
            	<c:forEach items="${indexFaces.estabelecimentos}" var="estabelecimento">
                	<div class="marca floatLeft">
                		<a href="estabelecimento.jsf?id=${estabelecimento.id}" title="${estabelecimento.nomeFantasia}">
                			<img src="${estabelecimento.logoMarcaView}" alt="" title="${estabelecimento.nomeFantasia}" />
                		</a>
                	</div>
                </c:forEach>
            </div>
            </c:if>
            
            <c:if test="${!empty indexFaces.comentarioModel.id}">
            <div class="boxSubCat">
            	<h2>Quem Indica</h2>
                <span class="imgDestaque-peq posRel">
                	<a href="estabelecimento.jsf?id=${indexFaces.comentarioModel.fornecedorModel.id}" title="">
                        <img src="${indexFaces.comentarioModel.fornecedorModel.logoMarcaView}" alt="" title="" />
                        <p class="tituloIndica">${indexFaces.comentarioModel.fornecedorModel.nomeFantasia}</p>
                    </a>
                </span>
                <c:if test="${!empty indexFaces.comentarioModel.id}">
                <p class="comment">${indexFaces.comentarioModel.descricao}</p>
                </c:if>
                <p class="autor">${indexFaces.comentarioModel.usuarioModel.nome}</p>
            </div>
            </c:if>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
<!-- TERMINA CENTRAL -->
<!-- COMECA RODAPE -->
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