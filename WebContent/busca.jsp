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
<div id="topo">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
		<%@ include file="/include_busca_topo.jsp" %>
    </div>
    <!-- TERMINA BUSCA -->
    <!-- COMECA PUBLICIDADE/MARCA -->
    <div id="marcaPublicidade">
    	<h1>
    	<h:outputLink value="#{facesContext.externalContext.requestContextPath}/index.jsf" title="Página Inicial">
    		<h:graphicImage value="img/marca.png" />
    	</h:outputLink>	
    	</h1>
        <div class="superbanner"></div>
    </div>
    <!-- TERMINA PUBLICIDADE/MARCA -->    
    <!-- COMECA MENU -->
    <div id="menu">
            <nav id="categorias">
            	<div id="cadastro">
            		<div id="facebook">
						
					  <h:outputLink value="#{faceBookFaces.url}" rendered="#{empty sessionScope.usuarioLogado.id}">
						<h:graphicImage value="img/facebook.gif" />
					  </h:outputLink>
					  <h:outputLink value="#{faceBookFaces.logout}" rendered="#{!empty sessionScope.usuarioLogado.id}">
					  	Sair
					  </h:outputLink>
					  
                    </div>
                    
                    <c:if test="${empty sessionScope.usuarioLogado.id}">
                    <div id="local">
                        <span class="chamadaCadastro">Não tem Facebook?</span>
                        <div><a class="modal" title="Cadastrar" rel="modal" href="<%= request.getContextPath() %>/inc/cadastro.jsf"><span class="icons iconCadastrar"></span>cadastrar</a></div>
                        <div><a id="modal" href="<%= request.getContextPath() %>/inc/login.jsf" class="modal" rel="modal" title="Login"><span class="icons iconLogin"></span>login</a></div>
                    </div>
                    </c:if>
            	</div>
                
                <%@ include file="/categorias.jsp" %>
            </nav>
        </div>
    <!-- TERMINA MENU -->
</div>
<!-- TERMINA TOPO -->

<div id="id-Breadcrumb">
    <span class="migalha"><a href="" title="">Página Inicial</a></span>    »    
    <span class="migalha">Busca</span>    »   
    <span class="migalha">${buscaFaces.termoBuscado}</span>
</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="tituloSessao">
            	<span class="icons iconBusca"></span>
            	<h2>Resultado da Busca</h2>
                <p>${buscaFaces.termoBuscado}</p>
            </div>
            <ul id="listagem">
            		<!-- SE LISTAGEM POR PROMOÇÃO -->
            		
            		<c:forEach items="${buscaFaces.listagem}" var="result">
            		
	                	<li>
	                    <a href="" title="">
	                    	<div class="marca floatLeft"><img src="${result.imagemView}" alt="" title="${result.titulo}" /></div>
	                        <!-- SE PROMOÇÃO EM PRODUTO -->
	                        <div class="info">
	                        	<p class="titulo">${result.titulo}</p>
	                            <!-- SE ESTABELECIMENTO, ENDEREÇO -->
	                            <p class="item">${result.nome}</p>                            
	                            <!-- SE PROMOÇÃO OU CARRO-CHEFE
	                            <p class="item">NOME DA PROMOÇÃO OU CARRO-CHEFE</p>
	                            -->
	                            <p class="resumo fontYi">${result.descricao}</p>
	                        </div>
	                    </a>
	                        
	                        <br clear="all" />
	                        <div class="boxInfo">
	                            <div class="floatLeft"><span class="icons iconRestaurante"></span>Categoria: ${result.categoria}</div>
	                            <div class="floatLeft marginLeft"><span class="icons tel"></span>${result.telefone}</div>
	                            
	                            <c:if test="${not empty result.site}">
	                            	<div class="floatLeft marginLeft"><span class="icons site"></span> <a href="${result.site}" target="_blank" title="${result.site}">Visite o site</a> </div>
			           			</c:if>
			           			
	                            <div class="floatLeft marginLeft"><span class="icons indicacao"></span>${result.indicacoes} indicam</div>
	                        </div>
	                    </li>
                	</c:forEach>
                    
                </ul>
                
                <div id="paginacao">
                
					<c:if test="${buscaFaces.qtdPaginas > 1}">
                		<li class="inicio"><a href="busca.jsf?page=${buscaFaces.page - 1}" title=""><span class="icons pagInicio"></span></a></li>
           			</c:if>
                
               		<c:forEach begin="1" end="${buscaFaces.qtdPaginas}" var="pagina">
	                    <li class="pagina"><a href="busca.jsf?page=${pagina}" title="">${pagina}</a></li>
	                </c:forEach>
	                
					<c:if test="${buscaFaces.qtdPaginas > 1}">
						<li class="fim"><a href="busca.jsf?page=${buscaFaces.page + 1}" title=""><span class="icons pagFim"></span></a></li>
           			</c:if>
           			
                </div>

        </div>
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="colunaMapa">
        	  <div id="map" style="width: 350px; height: 700px;"></div>
              <script type="text/javascript">
				var locations = [
				  ['DaBox PIzzaria', -33.890542, 151.274856, 4],
				  ['Restaurante Yemanjá', -33.923036, 151.259052, 5],
				  ['Porto Brasil', -34.028249, 151.157507, 3],
				  ['DOC', -33.80010128657071, 151.28747820854187, 2],
				  ['071 Music Bar', -33.950198, 151.259302, 1]
				];
			
				var map = new google.maps.Map(document.getElementById('map'), {
				  zoom: 10,
				  center: new google.maps.LatLng(-33.92, 151.25),
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
