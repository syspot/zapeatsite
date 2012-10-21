<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<%@ include file="/head.jsp" %>
</head>
<f:view>
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
            	<img src="${listagemFaces.categoria.imagemView}" class="floatLeftMargin4" />
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
                    
                    <!-- SE LISTAGEM POR CARRO-CHEFE -->
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
                    
                    <!-- SE LISTAGEM POR FORNECEDOR -->
            		<c:forEach items="${listagemFaces.fornecedores}" var="fornecedor">
	                	<li>
		                    <a href="estabelecimento.jsf?id=${fornecedor.id}" title="">
		                    	<div class="marca floatLeft"><img src="${fornecedor.logoMarcaView}" alt="${fornecedor.nomeFantasia}" title="${fornecedor.nomeFantasia}" /></div>
		                        <!-- SE PROMOÇÃO EM PRODUTO -->
		                        <div class="info">
		                        	<p class="titulo"><c:out value="${fornecedor.nomeFantasia}"/>  </p>
		                            <p class="resumo fontYi">
		                            <c:out value="${fornecedor.descricao}"/>
		                            </p>
		                        </div>
		                    </a>
	                        
	                        <br clear="all" />
	                        <div class="boxInfo">
	                            <div class="floatLeft"><img src="${fornecedor.categoriaPrincipal.imagemView}" alt="" title="${fornecedor.categoriaPrincipal.descricao}" class="floatLeftMargin4" />Categoria: <c:out value="${fornecedor.categoriaPrincipal.descricao}" /></div>
	                            <div class="floatLeft marginLeft"><span class="icons tel"></span><c:out value="${fornecedor.telefone}" /></div>
	                            
	                            <c:if test="${not empty fornecedor.site}">
	                            	<div class="floatLeft marginLeft"><span class="icons site"></span> <a href="${fornecedor.site}" target="_blank" title="${fornecedor.site}">Visite o site</a> </div>
			           			</c:if>
			           			
	                            <div class="floatLeft marginLeft"><span class="icons indicacao"></span><c:out value="${fornecedor.quantidadeIndicacoes}"/> indicam</div>
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
                
                <ul id="paginacao">
           			
           			<c:if test="${listagemFaces.qtdPaginas > 1}">
           			
           				<c:choose>
               				<c:when test="${not empty buscaFaces.page and buscaFaces.page != 1}">
               					<li class="inicio"><a href="listagem.jsf?categoriaId=${listagemFaces.categoria.id}&tipo=${listagemFaces.tipo}&page=${listagemFaces.page - 1}" title=""><span class="icons pagInicio"></span></a></li>
               				</c:when>
               				<c:otherwise>
               					<li class="inicio"><span class="icons pagInicio"></span></li>
               				</c:otherwise>
               			</c:choose>
               			
	               		<c:forEach begin="1" end="${listagemFaces.qtdPaginas}" var="pagina">
		                    <li class="pagina"><a href="listagem.jsf?categoriaId=${listagemFaces.categoria.id}&tipo=${listagemFaces.tipo}&page=${pagina}" title="">${pagina}</a></li>
		                </c:forEach>
	                
						<c:choose>
	          				<c:when test="${listagemFaces.page != listagemFaces.qtdPaginas}">
	          					<li class="fim"><a href="listagem.jsf?categoriaId=${listagemFaces.categoria.id}&tipo=${listagemFaces.tipo}&page=${listagemFaces.page + 1}" title=""><span class="icons pagFim"></span></a></li>
	          				</c:when>
	          				<c:otherwise>
	          					<li class="inicio"><span class="icons pagFim"></span></li>
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
