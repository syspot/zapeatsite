<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#" >
<f:view>
<head>
	<%@ include file="/head.jsp" %>
</head>
<body onload="initialize()">


	<!-- COMECA TOPO -->
	<%@ include file="/topo.jsp" %>

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
	                    <a href="${result.link}" title="">
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
					
						<c:choose>
               				<c:when test="${not empty buscaFaces.page and buscaFaces.page != 1}">
               					<li class="inicio"><a href="busca.jsf?page=${buscaFaces.page - 1}" title=""><span class="icons pagInicio"></span></a></li>
               				</c:when>
               				<c:otherwise>
               					<li class="inicio"><span class="icons pagInicio"></span></li>
               				</c:otherwise>
               			</c:choose>
						
	               		<c:forEach begin="1" end="${buscaFaces.qtdPaginas}" var="pagina">
		                    <li class="pagina"><a href="busca.jsf?page=${pagina}" title="">${pagina}</a></li>
		                </c:forEach>
	                
						<c:choose>
	          				<c:when test="${buscaFaces.page != buscaFaces.qtdPaginas}">
	          					<li class="fim"><a href="busca.jsf?page=${buscaFaces.page + 1}" title=""><span class="icons pagFim"></span></a></li>
	          				</c:when>
	          				<c:otherwise>
	          					<li class="inicio"><span class="icons pagFim"></span></li>
	          				</c:otherwise>
						</c:choose>
           			
           			</c:if>
           			
                </div>

        </div>
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="colunaMapa">
        	  <div id="map" style="width: 350px; height: 700px;"></div>
              <script type="text/javascript">
              var locations = ${buscaFaces.listagem};
			
				var map = new google.maps.Map(document.getElementById('map'), {
				  zoom: 10,
				  center: new google.maps.LatLng(${buscaFaces.posicaoCentralMaps}),
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
	<%@ include file="/rodape.jsp" %>
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
