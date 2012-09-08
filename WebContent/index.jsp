<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<f:view>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#" xmlns:p="http://primefaces.org/ui">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Zapeat</title>
<link href="css/padrao.css" rel="stylesheet" type="text/css" />
<link href="css/home.css" rel="stylesheet" type="text/css" />
<link href="css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="css/fontface.css" rel="stylesheet" type="text/css" />

<!--<meta property="og:site_name" content="Zapeat">
<meta property="og:image" content="http://img.zapeat.com/icon/icone-68px.png">
<meta property="geo.position" content="-13.548547000;-38.638272000">
<meta property="geo.position" conterty="ICBM" content="-13.548547000,-38.638272000">
<meta property="geo.region" content="BR-BA">
<meta property="geo.placename" content="Salvador">-->                                                                

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"> </script>
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


<!-- COMECA TOPO -->
<div id="topo">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<form>
        	<label>Buscar<input type="text" /></label>
            <label>em<input type="text" value="" id="info" /><span id="btnInit" class="icons" ></span></label>
            <input type="submit" value="" />
        </form>
    </div>
    <!-- TERMINA BUSCA -->
    <!-- COMECA PUBLICIDADE/MARCA -->
    <div id="marcaPublicidade">
    	<h1></h1>
        <div class="superbanner"></div>
    </div>
    <!-- TERMINA PUBLICIDADE/MARCA -->    
    <!-- COMECA MENU -->
    <div id="menu">
            <nav id="categorias">
            	<div id="cadastro">
            		<div id="facebook">
                        <div class="fb-login-button" data-show-faces="false" data-width="200" data-max-rows="1">Entrar usando Facebook</div>
                    </div>
                    
                    <div id="local">
                        <span class="chamadaCadastro">Não tem Facebook?</span>
                        <div><a href="" class="modal" rel="modal" title="Cadastrar"><span class="icons iconCadastrar"></span>cadastrar</a></div>
                        <div><a id="modal" href="inc/login.jsf" class="modal" rel="modal" title="Cadastrar"><span class="icons iconLogin"></span>login</a></div>
                    </div>
            	</div>
                
                <%@ include file="/categorias.jsp" %>
            </nav>
        </div>
    <!-- TERMINA MENU -->
</div>
<!-- TERMINA TOPO -->

<div id="id-Breadcrumb"><span id="status"></span></div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    			
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esq">
        	<div class="boxSubCat">
            	<h2>Promoção do dia</h2>
            	
            	<a href="promocao.jsf" title="">
                    <img src="img/model/180x79.jpg" alt="" title="" />
                    <p class="titulo">${indexFaces.promocaoDia.fornecedor.nomeFantasia}</p>
                    <!-- <p class="categoria">categoria</p>-->
                    <p class="item">${indexFaces.promocaoDia.descricao}</p>
                    <!-- SE PROMOÇÃO EM DESCONTO -->
                    <p><span class="precoDe">De: R$700,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$500,00</span> 
                </a>
            </div>
        	<div class="boxSubCat">
            	<h2>Promoção da semana</h2>
                <a href="promocao.jsf" title=""><img src="img/model/180x79.jpg" alt="" title="" /></a>
                    <p class="titulo">Cheiro de Pizza</p>
                    <p class="categoria">Pizzaria</p>
                    <p class="item">Pague 1 leve 2</p>
                    <!-- SE PROMOÇÃO EM PRODUTO -->
                    <p><span class="fontYi">Na Cheiro de Pizza comprando uma pizza grande você leva outra pizza do mesmo tamanho e sabor totalmente grátis.</span></p>
                </a>
            </div>
            <div class="boxSubCat">
            	<h2>Carro-chefe</h2>
                <a href="promocao.jsf" title=""><img src="img/model/180x79.jpg" alt="" title="" /></a>
                    <p class="titulo">Nome do estab</p>
                    <p class="categoria">categoria</p>
                    <p class="item">nome do prod</p>
                    <p><span class="precoDe">De: R$789,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$254,00</span> 
                </a>
            </div>
        </div>
        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="destaque">
            	<div id="fotoDestaque">
	                <a href="promocao.jsf"><img src="img/model/590x260.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a>
                    <div class="tituloPromo">
                    	<p><span class="tipoPromo">Promoção da hora</span></p>
                        <p><span class="nomePromo">Nome da Promoção/estabelecimento</span></p>
                    </div>
                </div>
                <div id="faixa">
 	               <div class="marca"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></div>
                   <p class="percentual">40%</p>
                   <p class="fontYi font10px">desconto</p>
                </div>
                <blockquote class="fontYi">
                	<p>Casais de namorados tem promoção especial. Venha comemorar aniversário de namoro e a companheira não paga o rodízio.</p>
                </blockquote>
                <div class="map">
                	<script>
					  var map;
					  function initializeMap() {
						// Creating a map
						var latlng = new google.maps.LatLng(37.771008, -122.41175); 
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
                	
	                	<li>
	                    	<a href="promocao.jsf" title="">
	                            <div class="marca floatLeft"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></div>
	                            <!-- SE PROMOÇÃO EM PRODUTO -->
	                            <div class="info">
	                                <p class="titulo">Rodízio dos Amantes</p>
	                                <p class="resumo fontYi">
	                                Casais de namorados tem promoção especial. Venha comemorar aniversário de namoro e a companheira não paga o rodízio.
	                                </p>
	                            </div>
	                        </a>
	                        <div class="dados">
	                            <p>
	                            	<span class="icons tel"></span>(71) 9876-5432
	                            </p>
	                            <p>
	                            	<a href="link para o site do cliente" title="" target="_blank"><span class="icons site"></span>site.com.br</a>
	                            </p>
	                            <p>
	                            	<span class="icons indicacao"></span>10 indicam
	                            </p>
	                        </div>
	                    </li>
                
                </ul>
            </div>
        
        </div>
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<div class="boxSubCat">
            	<h2>Top Geral</h2>
                <ul id="topGeral">
                    <li class="hum">
                    	<a href="estabelecimento.jsf" title="">
                            <p class="titulo">Nome do estab</p>
                            <p class="categoria">categoria</p>
                        </a>
                    </li>
                    <li class="dois">
                    	<a href="estabelecimento.jsf" title="">
                            <p class="titulo">Nome do estab</p>
                            <p class="categoria">categoria</p>
                        </a>
                    </li>
                    <li class="tres">
                    	<a href="estabelecimento.jsf" title="">
                            <p class="titulo">Nome do estab</p>
                            <p class="categoria">categoria</p>
                        </a>
                    </li>
                    <li class="quatro">
                    	<a href="estabelecimento.jsf" title="">
                            <p class="titulo">Nome do estab</p>
                            <p class="categoria">categoria</p>
                        </a>
                    </li>
                    <li class="cinco">
                    	<a href="estabelecimento.jsf" title="">
                            <p class="titulo">Nome do estab</p>
                            <p class="categoria">categoria</p>
                        </a>
                    </li>
                </ul>
            </div>
            
            <div class="boxSubCat">
            	<div class="banner">banner</div>
            </div>
            
            <div class="boxSubCat">
            	<h2>Estabelecimentos</h2>
                <div class="marca floatLeft"><a href="estabelecimento.jsf" title=""><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a></div>
                <div class="marca floatLeft"><a href="estabelecimento.jsf" title=""><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a></div>
                <div class="marca floatLeft"><a href="estabelecimento.jsf" title=""><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a></div>
                <div class="marca floatLeft"><a href="estabelecimento.jsf" title=""><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a></div>
                <div class="marca floatLeft"><a href="estabelecimento.jsf" title=""><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a></div>
                <div class="marca floatLeft"><a href="estabelecimento.jsf" title=""><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a></div>
            </div>
            
            <div class="boxSubCat">
            	<h2>Quem Indica</h2>
                <span class="imgDestaque-peq posRel">
                	<a href="estabelecimento.jsf" title="">
                        <img src="img/model/180x79.jpg" alt="" title="" />
                        <p class="tituloIndica">Nome do estabelecimento</p>
                    </a>
                </span>
                <p class="comment">O lugar é espaçoso e tem uma decoração temática muito bem feita. Não fica muito cheia e todas as sextas que fui a música estava excelente. As bebidas são boas e o atendimento é muito bom.</p>
                <p class="autor">Fulana de Tal</p>
            </div>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
<!-- TERMINA CENTRAL -->
<!-- COMECA RODAPE -->
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
