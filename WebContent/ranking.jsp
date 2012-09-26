<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>
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
		$('#outrosDestaques > #listagem > li:even').css('background', '#CCE5FF');
		$('#principal ul:eq(0)').css('left','-50px');
		$('#principal ul:eq(1)').css('left','-135px');
		$('#principal ul:eq(2)').css('left','-220px');
		$('#principal ul:eq(3)').css('left','-305px');
		$('#principal ul:eq(4)').css('right','-170px');
		$('#principal ul:eq(5)').css('right','-85px');
		$('#principal ul:eq(6)').css('right','0px');
		//$('#principal ul:eq(7)').css('right','0px');
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
    	<h1><img src="img/marca.png" title="Página Inicial" alt="Marca Zapeat" /></h1>
        <div class="superbanner"></div>
    </div>
    <!-- TERMINA PUBLICIDADE/MARCA -->    
    <!-- COMECA MENU -->
    <div id="menu">
            <nav id="categorias">
            	<div id="cadastro">
            		<div id="facebook">
						<div id="fb-root"></div>
					    <script>
					      // Load the SDK Asynchronously
					      (function(d){
					         var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
					         if (d.getElementById(id)) {return;}
					         js = d.createElement('script'); js.id = id; js.async = true;
					         js.src = "//connect.facebook.net/en_US/all.js";
					         ref.parentNode.insertBefore(js, ref);
					       }(document));
					
					      // Init the SDK upon load
					      window.fbAsyncInit = function() {
					        FB.init({
					          appId      : '444305308941322', // App ID
					          channelUrl : 'http://localhost:8080/zapeatsite/index.jsf', // Path to your Channel File
					          status     : true, // check login status
					          cookie     : true, // enable cookies to allow the server to access the session
					          xfbml      : true  // parse XFBML
					        });
					
					        // listen for and handle auth.statusChange events
					        FB.Event.subscribe('auth.statusChange', function(response) {
						        
					          if (response.authResponse) {
						        
					            FB.api('/me', function(me){
					              if (me.name) {
						            document.getElementById('nome').innerHTML = me.name;
					                document.getElementById('faceId').value= me.id;
					                document.getElementById('faceNome').value= me.name;
					                document.getElementById('faceEmail').value= me.email;
					              }
					            })
					            document.getElementById('auth-loggedout').style.display = 'none';
					            document.getElementById('modal').style.display = 'none';
					            document.getElementById('auth-loggedin').style.display = 'block';
					            document.getElementById('auth-loggedin').style.display = 'block';
					            document.getElementById('botao').style.display = 'none';
					            
					          } else {
					            // user has not auth'd your app, or is not logged into Facebook
					            document.getElementById('auth-loggedout').style.display = 'block';
					            document.getElementById('modal').style.display = 'block';
					            document.getElementById('botao').style.display = 'block';
					            
					          }
					        });
					
					        // respond to clicks on the login and logout links
					        document.getElementById('auth-loginlink').addEventListener('click', function(){
					          FB.login();
					        });
					        document.getElementById('auth-logoutlink').addEventListener('click', function(){
					          FB.logout();
					        }); 
					      } 
					    </script>
					      <div id="auth-status">
					        <div id="auth-loggedout" class="fb-login-button">Entrar com Facebook</div>
					        
					    </div>
                    </div>
                    
                    <div id="local">
                        <span class="chamadaCadastro">Não tem Facebook?</span>
                        <div><a class="modal" title="Cadastrar" rel="modal" href="<%= request.getContextPath() %>/inc/cadastro.jsf"><span class="icons iconCadastrar"></span>cadastrar</a></div>
                        <div><a id="modal" href="<%= request.getContextPath() %>/inc/login.jsf" class="modal" rel="modal" title="Login"><span class="icons iconLogin"></span>login</a></div>
                        
                    </div>
                    
            	</div>
                
                <%@ include file="/categorias.jsp" %>
            </nav>
        </div>
    <!-- TERMINA MENU -->
</div>

<h:form id="form">
    <t:inputHidden forceId="true" value="#{faceBookFaces.id}" id="faceId" />
    <t:inputHidden forceId="true" value="#{faceBookFaces.nome}" id="faceNome" />
    <t:inputHidden forceId="true" value="#{faceBookFaces.email}" id="faceEmail" />
</h:form>
<div id="div999">
<div id="id-Breadcrumb"><span id="status">Olá, <span id="nome"></span>, temos ótimas promoções pra você!</span></div>
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
                <!--==
                <p>Promoção da hora</p>
                <p>Promoção do dia</p>
                <p>Promoção da semana</p>                
                <p>Carro-chefe</p>
                ==-->
                <p>Mais Indicados</p>
            </div>
        	<div class="coluna">
            	<h2>Melhor Comida</h2>
                <div class="boxRanking">
                	<span class="position1"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome da comida</p>
                                <p class="dados">Nome do estabelecimento</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<p><a id="modal" href="inc/indicacao.html" title="" class="modal" rel="modal"><span class="icons indicacaoRed"></span> Indico [100]</a></p>
                    	<p><a id="modal" href="inc/indicacao.html" title="" class="modal" rel="modal"><span class="icons naoindicacaoRed"></span> Não indico</a></p>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<span class="position2"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome da comida</p>
                                <p class="dados">Nome do estabelecimento</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<span class="position3"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome da comida</p>
                                <p class="dados">Nome do estabelecimento</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<span class="position4"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome da comida</p>
                                <p class="dados">Nome do estabelecimento</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<span class="position5"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome da comida</p>
                                <p class="dados">Nome do estabelecimento</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
            </div>
            
            
            <div class="coluna">
            	<h2>Ambiente</h2>
                <div class="boxRanking">
                	<span class="position1"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome do estabelecimento</p>
                                <p class="dados">Categoria</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<span class="position2"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome do estabelecimento</p>
                                <p class="dados">Categoria</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<span class="position3"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome do estabelecimento</p>
                                <p class="dados">Categoria</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome do estabelecimento</p>
                                <p class="dados">Categoria</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
                
                <div class="boxRanking">
                	<span class="position5"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/180x79.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
                            <div class="info">
                                <p class="titulo">Nome do estabelecimento</p>
                                <p class="dados">Categoria</p>
                            </div>
                        </a>
                    </blockquote>
                    <div class="indico">
                    	<a href="" title=""><span class="icons indicacaoRed"></span> Eu indico [100]</a>
                    </div>
                </div>
            </div>
            
            
            

        
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<div class="boxSubCat">
            	<h2>Promoção do dia</h2>
                <a href="" title="">
                    <img src="img/model/180x79.jpg" alt="" title="" />
                    <p class="titulo">Nome da promo</p>
                    <!-- SE PROMOÇÃO EM DESCONTO -->
                    <p><span class="precoDe">De: R$700,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$500,00</span> </p>
                </a>
            </div>
        	<div class="boxSubCat">
            	<h2>Promoção da semana</h2>
                <a href="" title="">
                    <img src="img/model/180x79.jpg" alt="" title="" />
                    <p class="titulo">Nome da promo</p>
                    <!-- SE PROMOÇÃO EM PRODUTO -->
                    <p><span class="fontYi">Na Cheiro de Pizza comprando uma pizza grande você leva outra pizza do mesmo tamanho e sabor totalmente grátis.</span></p>
                </a>
            </div>
            <div class="boxSubCat">
            	<h2>Carro-chefe</h2>
                <a href="" title="">
                    <img src="img/model/180x79.jpg" alt="" title="" />
                    <p class="titulo">Nome do estab</p>
                    <p class="categoria">categoria</p>
                    <p class="item">nome do prod</p>
                    <p><span class="precoDe">De: R$789,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$254,00</span> </p>
                </a>
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
</html>
</f:view>