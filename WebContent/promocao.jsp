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
<link href="css/interna.css" rel="stylesheet" type="text/css" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/fontface.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"> </script>
<script src="js/jquery-latest.js"></script>
<script type="text/javascript" src="js/geometa.js"></script>
<script type="text/javascript">
      $(document).ready(function() {
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

<body onload="initialize()">

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- COMECA TOPO -->
	<%@ include file="/topo.jsp" %>
<!-- TERMINA TOPO -->

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
</div>

<div id="id-Breadcrumb">
    <span class="migalha"><a href="index.jsf" title="">Página Inicial</a></span>    »    
    <span class="migalha"><a href="listagem.jsf?categoriaId=${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.id}" title="">${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.descricao}</a></span>    »   
    <span class="migalha"><a href="estabelecimento.jsf?id=${promocaoFaces.promocao.fornecedorModel.id}" title="">${promocaoFaces.promocao.fornecedorModel.nomeFantasia}</a></span>    »   
    <span class="migalha"><a href="listagem.jsf?categoriaId=${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.id}&tipo=${promocaoFaces.promocao.tipoPromocaoModel.id}" title="">${promocaoFaces.promocao.tipoPromocaoModel.descricao}</a></span>    »   
    <span class="migalha">${promocaoFaces.promocao.titulo}</span>
</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esqInt">
        	<div id="boxSobreEstab">
        		<a href="estabelecimento.jsf?id=${promocaoFaces.promocao.fornecedorModel.id}">
	            	<div class="marca"><img src="${promocaoFaces.promocao.fornecedorModel.logoMarcaView}" width="117" height="117" alt="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" title="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" /></div>
	                <p class="titulo marginBottom15px">${promocaoFaces.promocao.fornecedorModel.nomeFantasia} - ${promocaoFaces.promocao.fornecedorModel.bairro}</p>
	                <!--<div class="marginBottom5px">
	                	 <a href="" title="Indico"><span class="icons indicacaoAzul"></span>Eu Indico [100]</a>  
	                </div> -->
	                <div><span class="icons telAzul"></span>${promocaoFaces.promocao.fornecedorModel.telefone}</div>
                </a>
            </div>
                	
        </div>

        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="destaque">
            	<div id="fotoDestaque">
	                <a href=""><img src="${promocaoFaces.promocao.imagemPromocaoFullView}" alt="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" title="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" /></a>
                    <div class="tituloPromo">
                    	<p><span class="tipoPromo">${promocaoFaces.promocao.tipoPromocaoModel.descricao}</span></p>
                        <p><span class="nomePromo">${promocaoFaces.promocao.titulo}</span></p>
                    </div>
                </div>
                <div id="faixa">
                	<p class="precoDe">De: R$ ${promocaoFaces.promocao.precoOriginalFormatado}</p>
                    <p class="precoPor">Por: R$ ${promocaoFaces.promocao.precoPromocionalFormatado}</p>
                   	<p class="percentual">${promocaoFaces.promocao.percentualDesconto}%</p>
                   	<p class="fontYi font10px">desconto</p>
                </div>
                <div class="boxInfo">
                	<a href="listagem.jsf?categoriaId=${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.id}" title="" class="floatLeft"><span class="${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.css}"></span>Categoria: ${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.descricao}</a>
                </div>
                <blockquote class="fontYi">
                	<p>${promocaoFaces.promocao.descricao}</p>
                </blockquote>
                <div class="clear"></div>
                <div class="barraCompartilhamento">
	                <a href="http://www.facebook.com/sharer.php?u=URL_da_promocao" target="_blank" title="Facebook"><img src="img/btnFb.jpg" title="Recomendar" /></a>
                    <div class="fb-like" data-href="http://www.zapeat.com.br" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>
                </div> 
                <div id="outroDados">
                	<ul>
                    	<li>
                        	<p class="titOtherInfo">horário da promoção</p>
                            <p>${promocaoFaces.promocao.fornecedorModel.horariosFuncionamento}</p>
                        </li>
                    	<li>
                        	<p class="titOtherInfo">O local</p>
                            <p>${promocaoFaces.promocao.fornecedorModel.logradouro}, ${promocaoFaces.promocao.fornecedorModel.bairro}</p>
                        </li>
                        <li>
                        	<p class="titOtherInfo">Outros</p>
                            <p>Formas de Pagamento</p>
                            <p>
                                <span class="iconCard iconVisa"></span>
                                <span class="iconCard iconAmex"></span>
                                <span class="iconCard iconDiners"></span>
                                <span class="iconCard iconMaster"></span>
                            </p>
                        </li>
                    </ul>
                </div>
                
                <address>${promocaoFaces.promocao.fornecedorModel.logradouro}, nº ${promocaoFaces.promocao.fornecedorModel.numero} - ${promocaoFaces.promocao.fornecedorModel.bairro}</address>
                
                <script>
				  var map;
				  function initialize() {
					// Creating a map
					var latlng = new google.maps.LatLng(${promocaoFaces.promocao.fornecedorModel.latitude}, ${promocaoFaces.promocao.fornecedorModel.longitude}); 
					var map = new google.maps.Map(document.getElementById('map_canvas_estab'), {  
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
			
				  google.maps.event.addDomListener(window, 'load', initialize);
				</script>
                <div id="map_canvas_estab"></div>
            </div>

                
                <!-- COMENTÁRIOS FACEBOOK -->
                <div id="comentarioFb">
                <p class="tituloComent">Deixe seu comentário</p>
	                <div class="fb-comments" data-href="http://example.com" data-num-posts="5" data-width="600"></div>
                </div>
            </div>
            
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<div class="boxSubCat">
        		<a href="promocao.jsf?id=${promocaoFaces.promocaoDia.id}">
	            	<h2>Promoção do dia</h2>
	                <img src="${promocaoFaces.promocaoDia.imagemPromocaoThumbView}" alt="" title="" />
	                <p class="titulo">${promocaoFaces.promocaoDia.titulo}</p>
	                <!-- SE PROMOÇÃO EM DESCONTO -->
	                <p><span class="precoDe">De: R$ ${promocaoFaces.promocaoDia.precoOriginalFormatado}</span>&nbsp;&nbsp;<span class="precoPor">Por: R$ ${promocaoFaces.promocaoDia.precoPromocionalFormatado}</span>
                </a> 
            </div>
        	<div class="boxSubCat">
        		<a href="promocao.jsf?id=${promocaoFaces.promocaoSemana.id}">
	            	<h2>Promoção da semana</h2>
	                <img src="${promocaoFaces.promocaoSemana.imagemPromocaoThumbView}" alt="" title="" />
	                <p class="titulo">${promocaoFaces.promocaoSemana.titulo}</p>
	                <!-- SE PROMOÇÃO EM PRODUTO -->
	                <p><span class="fontYi">${promocaoFaces.promocaoSemana.descricao}</span></p>
                </a>
            </div>
            <div class="boxSubCat">
            	<a href="estabelecimento.jsf?id=${promocaoFaces.carroChefeModel.fornecedorModel.id}">
	            	<h2>Carro-chefe</h2>
	                <img src="${promocaoFaces.carroChefeModel.imagemThumbView}" alt="" title="" />
	                <p class="titulo">${promocaoFaces.carroChefeModel.fornecedorModel.nomeFantasia}</p>
	                <p class="categoria">${promocaoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.descricao}</p>
	                <p class="item">${promocaoFaces.carroChefeModel.titulo}</p>
	                <!-- <p><span class="precoDe">De: R$789,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$254,00</span>  -->
                </a> 
            </div>
            
            <div class="boxSubCat">
            	<%@ include file="/include_banner_lateral.jsp" %>
            </div>
            
            
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
<!-- TERMINA CENTRAL -->
<div id="rodape">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<form>
        	<label>Buscar<input type="text" /></label>
            <label>em<input type="text" value="" id="info" /><span id="btnInit" class="icons" ></span></label>
            <input type="submit" value="" />
        </form>
    </div>
    <!-- TERMINA BUSCA -->
	<div id="infos">
    	<div class="fb-like-box" data-href="http://www.facebook.com/fanpageTigurio" data-width="292" data-height="330" data-show-faces="true" data-border-color="#D9A300" data-stream="false" data-header="false"></div>
    </div>
    <div id="copy">Zapeat 2012 - O Zapeat não é autor e não endossa nenhuma das opiniões e/ou comentários. Eles são de exclusiva responsabilidade dos respectivos autores.</div>
</div>
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
