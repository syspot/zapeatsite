<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<%@ include file="/topo.jsp" %>
<!-- TERMINA TOPO -->

<!-- 
<div id="id-Breadcrumb">
    <span class="migalha"><a href="" title="">Página Inicial</a></span>    »    
    <span class="migalha"><a href="" title="">Restaurantes</a></span>    »   
    <span class="migalha"><a href="" title="">Promoção da Hora</a></span>    »   
    <span class="migalha"><a href="" title="">Restaurante</a></span>    
    <span class="migalha"><a href="" title="">Yemanjá</a></span>    »   
    <span class="migalha"><a href="" title="">Muqueca a Moda TopSys</a></span>
</div>
 -->
<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esqInt">
        	<div id="boxSobreEstab">
            	<div class="marca"></div>
                <p>Ranking</p>
                <div id="ranking">
                	<span class="icons medalha"></span>
                    <span>${estabelecimentoFaces.ranking.posicao}º</span><br />lugar
                </div>
            </div>
            
            <c:if test="${!empty estabelecimentoFaces.fotosEstabelecimento}">
            <div class="boxSubCat ftoLocal">
            	<h2>Fotos do ambiente</h2>
            	<c:forEach items="${estabelecimentoFaces.fotosEstabelecimento}" var="item">
            	<span class="${item.css}">
            		<img src="${item.imagemThumbView}" alt="" title="" />
            	</span>
            	</c:forEach>
            </div>
            </c:if>
                	
        </div>
        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="destaque">
            	<div id="fotoDestaque">
	                <a href=""><img src="${estabelecimentoFaces.fornecedorModel.imagemFullView}" alt="" title="${estabelecimentoFaces.fornecedorModel.nomeFantasia}" /></a>
                    <div class="tituloPromo">
                        <p><span class="nomePromo">${estabelecimentoFaces.fornecedorModel.nomeFantasia}</span></p>
                    </div>
                </div>
                <div class="boxInfo">
                	<span class="icons tel"></span>${estabelecimentoFaces.fornecedorModel.telefone}
                </div>
                <blockquote class="fontYi">
                	<p>${estabelecimentoFaces.fornecedorModel.descricao}</p>
                </blockquote>
                
                <div id="outroDados">
                	<ul>
                    	<li>
                        	<p class="titOtherInfo">horário de funcionamento</p>
                            <p>${estabelecimentoFaces.fornecedorModel.horariosFuncionamento}</p>
                            
                        </li>
                        <c:if test="${!empty estabelecimentoFaces.fornecedorModel.twitter and !empty estabelecimentoFaces.fornecedorModel.facebook}">
                    	<li>
                        	<p class="titOtherInfo">Redes sociais</p>
                        	<c:if test="${!empty estabelecimentoFaces.fornecedorModel.twitter}">
                        	<p>@${estabelecimentoFaces.fornecedorModel.twitter}</p>
                            </c:if>
                            <c:if test="${!empty estabelecimentoFaces.fornecedorModel.facebook}">
                            <p><a href="http://facebook.com/${estabelecimentoFaces.fornecedorModel.facebook}" title="" target="_blank">facebook.com/${estabelecimentoFaces.fornecedorModel.facebook}</a></p>
                            
                            </c:if>
                        </li>
                        </c:if>
                        <li>
                        	<p class="titOtherInfo">Outros</p>
                            <c:if test="${!empty estabelecimentoFaces.fornecedorModel.site}">
                            <p>
                            <a href="${estabelecimentoFaces.fornecedorModel.site}" title="" target="_blank">${estabelecimentoFaces.fornecedorModel.site}</a></p>
                            </c:if>
                            <p><span class="icons indicacao"></span> ${estabelecimentoFaces.fornecedorModel.quantidadeIndicacoes} pessoas indicam o ambiente</p>
                            
                        </li>
                    </ul>
                </div>
                
                <address>${estabelecimentoFaces.fornecedorModel.logradouro} / ${estabelecimentoFaces.fornecedorModel.bairro}</address>
                <script>
				  var map;
				  var lat = ${estabelecimentoFaces.fornecedorModel.latitude}
				  var lng = ${estabelecimentoFaces.fornecedorModel.longitude}
				  function initialize() {
					// Creating a map
					var latlng = new google.maps.LatLng(lat, lng); 
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
</html></f:view>