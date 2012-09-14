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
                        <div><a class="modal" title="Cadastrar" rel="modal" href="<%= request.getContextPath() %>/inc/cadastro.jsf"><span class="icons iconCadastrar"></span>cadastrar</a></div>
                        <div><a id="modal" href="<%= request.getContextPath() %>/inc/login.jsf" class="modal" rel="modal" title="Login"><span class="icons iconLogin"></span>login</a></div>
                    </div>
            	</div>
                
                <%@ include file="/categorias.jsp" %>
            </nav>
        </div>
    <!-- TERMINA MENU -->
</div>
<!-- TERMINA TOPO -->

<div id="id-Breadcrumb">
    <span class="migalha"><a href="index.html" title="">Página Inicial</a></span>    »    
    <span class="migalha">Mais Indicados</span>    »   
    <span class="migalha"><a href="categoria/ranking.html" title="">Ranking	</a></span>   
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                	<span class="position2"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
            
            
            <div class="coluna">
            	<h2>Carro-chefe</h2>
                <div class="boxRanking">
                	<span class="position1"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                	<span class="position2"></span>
                	<blockquote>
                    	<a href="" title="">
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
                            <span class="imgRank"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></span>
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
