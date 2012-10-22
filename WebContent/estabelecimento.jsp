<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<%@ include file="/head.jsp" %>
</head>

<body>



	<!-- COMECA TOPO -->
	<%@ include file="/topo.jsp" %>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esqInt">
        	<div id="boxSobreEstab">
            	<div class="marca"><img src="${estabelecimentoFaces.ranking.fornecedorModel.logoMarcaView}" height="117" width="117" /></div>
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
	            	<span class="ftoGrande">
	            		<a class="fotoEstab" href="${item.imagemFullView}">
	            			<img src="${item.imagemThumbView}" alt="" title=""/>
	            		</a>
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
                            <p>Formas de Pagamento</p>
                            <p>
	                            <c:forEach items="${estabelecimentoFaces.fornecedorModel.formasPagamentos}" var="formaPagamento">
	                                <span class="iconCard">
		                                <img src="${formaPagamento.imagemView}" alt="" title="${formaPagamento.descricao}" class="floatLeftMargin4" />
	                                </span>
	                           	</c:forEach>
                           	</p>
                            <p><span class="icons indicacao"></span> ${estabelecimentoFaces.fornecedorModel.quantidadeIndicacoes} pessoa(s) indicam o ambiente</p>
                            
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
        
        	<%@ include file="/include_promocao_do_dia_lateral.jsp" %>
            
            <%@ include file="/include_promocao_da_semana_lateral.jsp" %>
            
            <%@ include file="/include_carro_chefe_lateral.jsp" %>
            
           	<%@ include file="/include_banner_lateral.jsp" %>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>

	<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>
	
	<script type="text/javascript" src="js/jquery.fancybox.pack.js?v=2.1.2"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css?v=2.1.2" media="screen" />
<script type="text/javascript">
$(document).ready(function() {
$(".fotoEstab").fancybox({
			padding: 0,
			openEffect : 'elastic',
			openSpeed  : 150,
			closeEffect : 'elastic',
			closeSpeed  : 150,
			closeClick : true,
			helpers : {
				overlay : null
			}
		});
})
</script>

</body>
</html></f:view>