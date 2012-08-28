<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Zapeat</title>
<link href="../css/padrao.css" rel="stylesheet" type="text/css" />
<link href="../css/interna.css" rel="stylesheet" type="text/css" />
<link href="../css/cssReset.css" rel="stylesheet" type="text/css" />
<link href="../css/fontface.css" rel="stylesheet" type="text/css" />

<meta property="og:site_name" content="Zapeat">
<meta property="og:image" content="http://img.zapeat.com/icon/icone-68px.png">
<meta property="geo.position" content="-13.548547000;-38.638272000">
<meta property="geo.position" conterty="ICBM" content="-13.548547000,-38.638272000">
<meta property="geo.region" content="BR-BA">
<meta property="geo.placename" content="Salvador">                                                                

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"> </script>
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
<script src="../js/jquery-latest.js"></script>
<script type="text/javascript" src="../js/geometa.js"></script>
<script type="text/javascript">
      $(document).ready(function() {
		$('#principal ul:eq(0)').css('left','0px');
		$('#principal ul:eq(1)').css('left','-75px');
		$('#principal ul:eq(2)').css('left','-150px');
		$('#principal ul:eq(3)').css('left','-225px');
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
<div id="topo">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    
    	<form>
        	<label>Buscar<input type="text" /></label>
            <label>em<input type="text" value="" /><span class="geomap"></span></label>
            <input type="submit" />
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
                        <div class="fb-login-button" data-show-faces="false" data-width="200" data-max-rows="1"></div>
                    </div>
                    <div id="local">
                        <span class="chamadaCadastro">Não tem Facebook?</span>
                        <div><a href="" title="Cadastrar"><span class="icons iconCadastrar"></span>cadastrar</a></div>
                        <div><a id="modal" href="../inc/login.html" class="modal" rel="modal" title="Cadastrar"><span class="icons iconLogin"></span>login</a></div>
                    </div>
            	</div>
                <ul id="principal">
                    <li>
                        <span class="icons maisIndicados"></span>
                        <span class="titMenu">mais indicados</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconBaladas"></span>
                        <span class="titMenu">baladas</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconBares"></span>
                        <span class="titMenu">bares</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconDelivery"></span>
                        <span class="titMenu">delivery</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconLanchonete"></span>
                        <span class="titMenu">lanchonetes</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconPizzaria"></span>
                        <span class="titMenu">pizzarias</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconRestaurante"></span>
                        <span class="titMenu">restaurantes</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons outrasCat"></span>
                        <span class="titMenu">outras categorias</span>
                        <ul id="sub">
                            <li><a href="../listagem/index.html" title="promoção da semana1">promoção da semana</a></li>
                            <li><a href="../listagem/index.html" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="../listagem/index.html" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="../listagem/index.html" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="../estabelecimentos/index.html" title="estabelecimentos">estabelecimentos</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    <!-- TERMINA MENU -->
</div>
<!-- TERMINA TOPO -->

<div id="id-Breadcrumb">Página Inicial    »    Restaurantes    »   Promoção da Hora    »   Restaurante Yemanjá    »   Muqueca a Moda TopSys</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA ESQUERDA -->
        <div id="meio">
        	
            <ul id="listagem">
                	<li>
                    	<div class="marca floatLeft"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></div>
                        <!-- SE PROMOÇÃO EM PRODUTO -->
                        <div class="info">
                        	<p class="titulo">Rodízio dos Amantes</p>
                            <p class="resumo fontYi">
                            Casais de namorados tem promoção especial. Venha comemorar aniversário de namoro e a companheira não paga o rodízio.
                            </p>
                        </div>
                        <div class="dados">
                            <p>
                            	<span class="icons tel"></span>(71) 9876-5432
                            </p>
                            <p>
                            	<span class="icons site"></span>site.com.br
                            </p>
                            <p>
                            	<span class="icons indicacao"></span>10 indicam
                            </p>
                        </div>
                    </li>
                    <li>
                    	<div class="marca floatLeft"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></div>
                        <!-- SE PROMOÇÃO EM DESCONTO -->
                        <div class="info">
                        	<p class="titulo">DaBox Pizzaria</p>
                            <p class="resumo fontYi">Pizzaria</p>
                            <p class="item">Pizza E.C Bahia</p>
                            <p><span class="precoDe">De: R$789,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$254,00</span> 
                        </div>
                        <div class="dados">
                            <p>
                            	<span class="icons tel"></span>(71) 3379.3663
                            </p>
                            <p>
                            	<span class="icons site"></span>daboxpizza.com.br
                            </p>
                            <p>
                            	<span class="icons indicacao"></span>10 indicam
                            </p>
                        </div>

                    </li>
                    <li>
                    	<div class="marca floatLeft"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></div>
                        <div class="info">
                        	<p class="titulo">.titulo</p>
                            <p class="resumo">.resumo</p>
                        </div>
                        <div class="dados">
                            <p>
                            	<span class="icons tel"></span>(71) 9876-5432
                            </p>
                            <p>
                            	<span class="icons site"></span>site.com.br
                            </p>
                            <p>
                            	<span class="icons indicacao"></span>10 indicam
                            </p>
                        </div>

                    </li>
                    <li>
                    	<div class="marca floatLeft"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></div>
                        <div class="info">
                        	<p class="titulo">.titulo</p>
                            <p class="resumo">.resumo</p>
                        </div>
                        <div class="dados">
                            <p>
                            	<span class="icons tel"></span>(71) 9876-5432
                            </p>
                            <p>
                            	<span class="icons site"></span>site.com.br
                            </p>
                            <p>
                            	<span class="icons indicacao"></span>10 indicam
                            </p>
                        </div>

                    </li>
                    <li>
                    	<div class="marca floatLeft"><img src="img/model/80x80.jpg" alt="Marca 80x80px" title="Nome do estabelecimento" /></div>
                        <div class="info">
                        	<p class="titulo">.titulo</p>
                            <p class="resumo">.resumo</p>
                        </div>
                        <div class="dados">
                            <p>
                            	<span class="icons tel"></span>(71) 9876-5432
                            </p>
                            <p>
                            	<span class="icons site"></span>site.com.br
                            </p>
                            <p>
                            	<span class="icons indicacao"></span>10 indicam
                            </p>
                        </div>

                    </li>
                </ul>

        </div>
            
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	<div class="boxSubCat">
            	<h2>Promoção do dia</h2>
                <img src="../img/model/180x79.jpg" alt="" title="" />
                <p class="titulo">Nome da promo</p>
                <!-- SE PROMOÇÃO EM DESCONTO -->
                <p><span class="precoDe">De: R$700,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$500,00</span> 
            </div>
        	<div class="boxSubCat">
            	<h2>Promoção da semana</h2>
                <img src="../img/model/180x79.jpg" alt="" title="" />
                <p class="titulo">Nome da promo</p>
                <!-- SE PROMOÇÃO EM PRODUTO -->
                <p><span class="fontYi">Na Cheiro de Pizza comprando uma pizza grande você leva outra pizza do mesmo tamanho e sabor totalmente grátis.</span></p>
            </div>
            <div class="boxSubCat">
            	<h2>Carro-chefe</h2>
                <img src="../img/model/180x79.jpg" alt="" title="" />
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
<!-- COMECA RODAPE -->
<div id="rodape">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<form>
        	<label>buscar<input type="text" /></label>
            <label>em<input type="text" /><span class="geomap"></span></label>
            <input type="submit" />
        </form>
    </div>
    <!-- TERMINA BUSCA -->
	<div id="infos"></div>
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
}(document, 'script', 'facebook-jssdk'));</script>

</body>
</html>
