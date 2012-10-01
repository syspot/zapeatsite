<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<meta property="og:site_name" content="Zapeat">
<meta property="og:image" content="http://img.zapeat.com/icon/icone-68px.png">
<meta property="geo.position" content="-13.548547000;-38.638272000">
<meta property="geo.position" conterty="ICBM" content="-13.548547000,-38.638272000">
<meta property="geo.region" content="BR-BA">
<meta property="geo.placename" content="Salvador">                                                                

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"> </script>
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
<script src="js/jquery-latest.js"></script>
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

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>

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
<f:view>
<body onload="initialize()">


<!-- COMECA TOPO -->
	<%@ include file="/topo.jsp" %>
<!-- TERMINA TOPO -->

<div id="id-Breadcrumb">
    <span class="migalha"><a href="listagem.jsf" title="">Página Inicial</a></span>    »    
    <span class="migalha"><a href="listagem.jsf?categoriaId=${listagemFaces.categoria.id}" title="">${listagemFaces.categoria.descricao}</a></span>    »   
    <span class="migalha">${listagemFaces.nomeTipo}</span>       
</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="tituloSessao">
            	<span class="${listagemFaces.categoria.css}"></span>
            	<h2>${listagemFaces.categoria.descricao}</h2>
                <!--==
                <p>Promoção da hora</p>
                <p>Promoção do dia</p>
                <p>Promoção da semana</p>                
                <p>Carro-chefe</p>
                ==-->
                <p>${listagemFaces.nomeTipo}</p>
            </div>
            <ul id="listagem">
            		<!-- SE LISTAGEM POR PROMOÇÃO -->
            		<c:forEach items="${listagemFaces.promocoes}" var="promocao">
	                	<li>
		                    <a href="promocao.jsf?id=${promocao.id}" title="">
		                    	<div class="marca floatLeft"><img src="${promocao.fornecedorModel.logoMarcaView}" alt="${promocao.titulo}" title="${promocao.fornecedorModel.nomeFantasia}" /></div>
		                        <!-- SE PROMOÇÃO EM PRODUTO -->
		                        <div class="info">
		                        	<p class="titulo"><c:out value="${promocao.fornecedorModel.nomeFantasia}"/>  </p>
		                            <p class="item"><c:out value="${promocao.titulo}" /></p>                            
		                            <p class="resumo fontYi">
		                            <c:out value="${promocao.descricao}"/>
		                            </p>
		                        </div>
		                    </a>
	                        <!-- SE LISTAGEM POR PROMOÇÃO, RETIRA DIV A SEGUIR -->
	                        <div class="sessao"><span class="${promocao.cssSessao}"></span><c:out value="${promocao.tipoPromocaoModel.descricao}" /></div>
	                        
	                        <br clear="all" />
	                        <div class="boxInfo">
	                            <div class="floatLeft"><span class="icons iconRestaurante"></span>Categoria: <c:out value="${promocao.fornecedorModel.categoriaPrincipal.descricao}" /></div>
	                            <div class="floatLeft marginLeft"><span class="icons tel"></span><c:out value="${promocao.fornecedorModel.telefone}" /></div>
	                            
	                            <c:if test="${not empty promocao.fornecedorModel.site}">
	                            	<div class="floatLeft marginLeft"><span class="icons site"></span> <a href="${promocao.fornecedorModel.site}" target="_blank" title="${promocao.fornecedorModel.site}">Visite o site</a> </div>
			           			</c:if>
			           			
	                            <div class="floatLeft marginLeft"><span class="icons indicacao"></span><c:out value="${promocao.indicacoes}"/> indicam</div>
	                        </div>
	                    </li>
                    </c:forEach>
                    
            		<c:forEach items="${listagemFaces.carrosChefes}" var="carroChefe">
	                	<li>
		                    <a href="estabelecimento.jsf?id=${carroChefe.fornecedorModel.id}" title="">
		                    	<div class="marca floatLeft"><img src="${carroChefe.fornecedorModel.logoMarcaView}" alt="Marca 80x80px" title="${carroChefe.fornecedorModel.nomeFantasia}" /></div>
		                        <!-- SE PROMOÇÃO EM PRODUTO -->
		                        <div class="info">
		                        	<p class="titulo"><c:out value="${carroChefe.fornecedorModel.nomeFantasia}"/>  </p>
		                            <p class="item"><c:out value="${carroChefe.titulo}" /></p>                            
		                            <p class="resumo fontYi">
		                            <c:out value="${carroChefe.descricao}"/>
		                            </p>
		                        </div>
		                    </a>
	                        <!-- SE LISTAGEM POR PROMOÇÃO, RETIRA DIV A SEGUIR -->
	                        <!-- <div class="sessao"><span class="${promocao.cssSessao}"></span><c:out value="${promocao.tipoPromocaoModel.descricao}" /></div> -->
	                        
	                        <br clear="all" />
	                        <div class="boxInfo">
	                            <div class="floatLeft"><span class="icons iconRestaurante"></span>Categoria: <c:out value="${carroChefe.fornecedorModel.categoriaPrincipal.descricao}" /></div>
	                            <div class="floatLeft marginLeft"><span class="icons tel"></span><c:out value="${carroChefe.fornecedorModel.telefone}" /></div>
	                            
	                            <c:if test="${not empty carroChefe.fornecedorModel.site}">
	                            	<div class="floatLeft marginLeft"><span class="icons site"></span> <a href="${carroChefe.fornecedorModel.site}" target="_blank" title="${carroChefe.fornecedorModel.site}">Visite o site</a> </div>
			           			</c:if>
			           			
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
                
                <ul id="paginacao">
           			
           			<c:if test="${listagemFaces.qtdPaginas > 1}">
           			
           				<c:choose>
               				<c:when test="${not empty buscaFaces.page and buscaFaces.page != 1}">
               					<li class="inicio"><a href="listagem.jsf?page=${listagemFaces.page - 1}" title=""><span class="icons pagInicio"></span></a></li>
               				</c:when>
               				<c:otherwise>
               					<li class="inicio"><span class="icons pagInicio"></span></li>
               				</c:otherwise>
               			</c:choose>
               			
           			</c:if>
                
                	<c:if test="${listagemFaces.qtdPaginas > 1}">
           			
	               		<c:forEach begin="1" end="${listagemFaces.qtdPaginas}" var="pagina">
		                    <li class="pagina"><a href="listagem.jsf?page=${pagina}" title="">${pagina}</a></li>
		                </c:forEach>
	                
	                </c:if>
	                
	                <c:if test="${listagemFaces.qtdPaginas > 1}">
	                
	           			<c:choose>
								
							<c:when test="${not empty listagemFaces.page}">
								<c:choose>
			          				<c:when test="${listagemFaces.page != listagemFaces.qtdPaginas}">
			          					<li class="fim"><a href="listagem.jsf?page=${listagemFaces.page + 1}" title=""><span class="icons pagFim"></span></a></li>
			          				</c:when>
			          				<c:otherwise>
			          					<li class="inicio"><span class="icons pagFim"></span></li>
			          				</c:otherwise>
	          					</c:choose>
							</c:when>
							
							<c:otherwise>
								<li class="fim"><a href="listagem.jsf?page=${listagemFaces.page + 1}" title=""><span class="icons pagFim"></span></a></li>
							</c:otherwise>
							
						</c:choose>
						
	                </c:if>
	                
                </ul>

        </div>
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="colunaMapa">
        	  <div id="map" style="width: 350px; height: 700px;"></div>
              <script type="text/javascript">
              	
              	var locations = ${listagemFaces.posicoesMaps};
			
				var map = new google.maps.Map(document.getElementById('map'), {
				  zoom: 10,
				  center: new google.maps.LatLng(${listagemFaces.posicaoCentralMaps}),
				  mapTypeId: google.maps.MapTypeId.ROADMAP
				});
			
				var infowindow = new google.maps.InfoWindow();
			
				var marker, i;
			
				for (i = 0; i < locations.length; i++) {  
				  marker = new google.maps.Marker({
					position: new google.maps.LatLng(locations[i][1], locations[i][2]),
					map: map
				  });
			
				  google.maps.event.addListener(marker, 'click', (function(marker, i) {
					return function() {
					  infowindow.setContent(locations[i][0]);
					  infowindow.open(map, marker);
					}
				  })(marker, i));
				}
				
			  </script>
			  
			  <script type="text/javascript"> 
					$(document).ready(function() { 
						$("ul.paginacao").quickPagination({pagerLocation:"both",pageSize:"2"}); 
					}); 
			  </script> 

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
</f:view>
</html>
