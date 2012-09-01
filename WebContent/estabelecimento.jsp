<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

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

<!--<meta property="og:site_name" content="Zapeat">
<meta property="og:image" content="http://img.zapeat.com/icon/icone-68px.png">
<meta property="geo.position" content="-13.548547000;-38.638272000">
<meta property="geo.position" conterty="ICBM" content="-13.548547000,-38.638272000">
<meta property="geo.region" content="BR-BA">
<meta property="geo.placename" content="Salvador">  -->                                                              
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"> </script>
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
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
	<script type="text/javascript" src="js/modal.js">
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

<div id="id-Breadcrumb">
    <span class="migalha"><a href="" title="">Página Inicial</a></span>    »    
    <span class="migalha"><a href="" title="">Restaurantes</a></span>    »   
    <span class="migalha"><a href="" title="">Promoção da Hora</a></span>    »   
    <span class="migalha"><a href="" title="">Restaurante</a></span>    
    <span class="migalha"><a href="" title="">Yemanjá</a></span>    »   
    <span class="migalha"><a href="" title="">Muqueca a Moda TopSys</a></span>
</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esqInt">
        	<div id="boxSobreEstab">
            	<div class="marca"></div>
                <p>Ranking na categoria</p>
                <div id="ranking">
                	<span class="icons medalha"></span>
                    <span>473º</span><br />lugar
                </div>
            </div>
            <div class="boxSubCat ftoLocal">
            	<h2>Fotos do ambiente</h2>
                <span class="ftoGrande"><img src="estabelecimento/img/model/180x79.jpg" alt="" title="" /></span>
                <span class="ftoPeq floatLeft"><img src="estabelecimento/img/model/180x79.jpg" alt="" title="" /></span>
                <span class="ftoPeq floatRight"><img src="estabelecimento/img/model/180x79.jpg" alt="" title="" /></span>
            </div>
                	
        </div>

        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="destaque">
            	<div id="fotoDestaque">
	                <a href=""><img src="img/model/590x260.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></a>
                    <div class="tituloPromo">
                        <p><span class="nomePromo">Nome do estabelecimento</span></p>
                    </div>
                </div>
                <div class="boxInfo">
                	<a href="estabelecimento/LINK RESTAURANTE > ESTABELECIMENTO" title="" class="floatLeft"><span class="icons iconRestaurante"></span>Categoria: Restaurante</a>
                    <a href="estabelecimento/LINK RESTAURANTE > ESTABELECIMENTO" title="" class="floatLeft marginLeft"><span class="icons tel"></span>(71) 9876.5432</a>
                </div>
                <blockquote class="fontYi">
                	<p>Rod&iacute;zio de carnes com grande variedade de Frutos do Mar como: Camar&atilde;o &agrave; Paulista, Ostras, Lula, Polvo, Salm&atilde;o Defumado e Marinado, Bacalhau Gratinado, Paella e outros. Buffet de saladas, Sushis e Recheauds repletos de variedades, aliados ao conforto e requinte de um ambiente climatizado. O que &eacute; bom est&aacute; aqui!</p>
                </blockquote>
                
                <div id="outroDados">
                	<ul>
                    	<li>
                        	<p class="titOtherInfo">horário de funcionamento</p>
                            <p>Terça a Quinta das 19h às 2 horas</p>
                            
                            <p>Sexta e Sábado das 18h às 3 horas</p>
                            
                            <p>Domingo das 18h as 00 horas</p>
                        </li>
                    	<li>
                        	<p class="titOtherInfo">Redes sociais</p>
                            <p>@estabelecimento</p>
                            <p>facebook.com/fanpage</p>
                        </li>
                        <li>
                        	<p class="titOtherInfo">Outros</p>
                            <p>www.seusite.com.br</p>
                            <p>Formas de Pagamento:</p>
                            <p>
                                <span class="iconCard iconVisa"></span>
                                <span class="iconCard iconAmex"></span>
                                <span class="iconCard iconDiners"></span>
                                <span class="iconCard iconMaster"></span>
                            </p>
                            <p><span class="icons indicacao"></span> 100 pessoas indicam o ambiente</p>
                            <p><span class="icons indicacao"></span> 70 pessoas indicam a comida</p>
                        </li>
                    </ul>
                </div>
                
                <address>Aqui entra o endereço do estabelecimento</address>
                <script>
				  var map;
				  function initialize() {
					// Creating a map
					var latlng = new google.maps.LatLng(-12.973393753658488, -38.51103549999999); 
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
                
                <div class="clear"></div>
                <div class="barraCompartilhamento">
	                <a href="http://www.facebook.com/sharer.php?u=URL_da_materia" target="_blank" title="Facebook"><img src="img/btnFb.jpg" title="Recomendar" /></a>
                    <div class="fb-like" data-href="http://www.zapeat.com.br" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>
                </div>
                
                <!-- COMENTÁRIOS FACEBOOK -->
                <div id="comentarioFb">
                <p class="tituloComent">Deixe seu comentário</p>
	                <div class="fb-comments" data-href="http://example.com" data-num-posts="5" data-width="600"></div>
                </div>
            </div>
            
        
        </div>
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<div class="boxSubCat">
            	<h2>Promoção do dia</h2>
                <img src="img/model/180x79.jpg" alt="" title="" />
                <p class="titulo">Nome da promo</p>
                <!-- SE PROMOÇÃO EM DESCONTO -->
                <p><span class="precoDe">De: R$700,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$500,00</span> 
            </div>
        	<div class="boxSubCat">
            	<h2>Promoção da semana</h2>
                <img src="img/model/180x79.jpg" alt="" title="" />
                <p class="titulo">Nome da promo</p>
                <!-- SE PROMOÇÃO EM PRODUTO -->
                <p><span class="fontYi">Na Cheiro de Pizza comprando uma pizza grande você leva outra pizza do mesmo tamanho e sabor totalmente grátis.</span></p>
            </div>
            <div class="boxSubCat">
            	<h2>Carro-chefe</h2>
                <img src="img/model/180x79.jpg" alt="" title="" />
                <p class="titulo">Nome do estab</p>
                <p class="categoria">categoria</p>
                <p class="item">nome do prod</p>
                <p><span class="precoDe">De: R$789,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$254,00</span> 
            </div>
            
            <div class="boxSubCat">
            	<div class="banner">banner</div>
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
</html></f:view>