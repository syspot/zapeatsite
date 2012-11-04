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
	
	<div id="id-Breadcrumb">
	
	    <span class="migalha"><a href="index.jsf?cidade=${cidadeFaces.cidadeSelecionada}" title="">Página Inicial</a></span>    »
	    
		<span class="migalha"><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${estabelecimentoFaces.fornecedorModel.categoriaPrincipal.id}" title="">${estabelecimentoFaces.fornecedorModel.categoriaPrincipal.descricao}</a></span>    »   
	    <span class="migalha">${estabelecimentoFaces.fornecedorModel.nomeFantasia}</span>
    
	</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esqInt">
        	<div id="boxSobreEstab">
            	<div class="marca"><a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${estabelecimentoFaces.fornecedorModel.id}" title="${estabelecimentoFaces.fornecedorModel.nomeFantasia}"><img src="${estabelecimentoFaces.ranking.fornecedorModel.logoMarcaView}" height="117" width="117" /></a></div>
                <p>Ranking</p>
                <div id="ranking">
                	<span class="icons medalha"></span>
                    <span>${estabelecimentoFaces.ranking.posicao}º</span><br />lugar
                </div>
            </div>
            
            <c:if test="${!empty estabelecimentoFaces.fornecedorModel.imagensFornecedorModel}">
	            <div class="boxSubCat ftoLocal">
	            	<h2>Fotos do ambiente</h2>
	            	<c:forEach items="${estabelecimentoFaces.fornecedorModel.imagensFornecedorModel}" var="item">
	            		<span class="floatLeft">
	            			<a class="fotoEstab" href="${item.imagemFullView}">
	            				<img src="${item.imagemThumbView}" alt="" title="" />
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
	                <img src="${estabelecimentoFaces.fornecedorModel.imagemFullView}" alt="" title="${estabelecimentoFaces.fornecedorModel.nomeFantasia}" />
                    <div class="tituloPromo">
                        <p><span class="nomePromo">${estabelecimentoFaces.fornecedorModel.nomeFantasia}</span></p>
                    </div>
                </div>
                <div class="boxInfo">
                	<a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${estabelecimentoFaces.fornecedorModel.categoriaPrincipal.id}" title="" class="floatLeft"><div class="floatLeft"><img src="${estabelecimentoFaces.fornecedorModel.categoriaPrincipal.imagemView}" alt="" title="${estabelecimentoFaces.fornecedorModel.categoriaPrincipal.descricao}" class="floatLeftMargin4" />Categoria: <c:out value="${estabelecimentoFaces.fornecedorModel.categoriaPrincipal.descricao}" /></div></a>
                	<span class="floatLeft" style="margin-left: 20px"><span class="icons tel"></span>${estabelecimentoFaces.fornecedorModel.telefone}</span>
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
                        <c:if test="${not empty estabelecimentoFaces.fornecedorModel.twitter and not empty estabelecimentoFaces.fornecedorModel.facebook}">
                    	<li>
                        	<p class="titOtherInfo">Redes sociais</p>
                        	<c:if test="${not empty estabelecimentoFaces.fornecedorModel.twitter}">
                        		<p>${estabelecimentoFaces.fornecedorModel.twitter}</p>
                            </c:if>
                            <c:if test="${not empty estabelecimentoFaces.fornecedorModel.facebook}">
                            	<p><a href="http://facebook.com/${estabelecimentoFaces.fornecedorModel.facebook}" title="" target="_blank">facebook.com/${estabelecimentoFaces.fornecedorModel.facebook}</a></p>
                            </c:if>
                        </li>
                        </c:if>
                        <li>
                        	<p class="titOtherInfo">Outros</p>
                            <c:if test="${not empty estabelecimentoFaces.fornecedorModel.site}">
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
                            
                        </li>
                    </ul>
                    
                    <ul>
                    	<li>
                    	
                    		<h:form>
                    		
                    			<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />
                    			<input type="hidden" name="id" value="${estabelecimentoFaces.fornecedorModel.id}" />
                    		
	                    		<c:if test="${estabelecimentoFaces.fornecedorModel.quantidadeIndicacoes == 1}">
	                    			<p> ${estabelecimentoFaces.fornecedorModel.quantidadeIndicacoes} pessoa indica</p>
	                    		</c:if>
	                    		<c:if test="${estabelecimentoFaces.fornecedorModel.quantidadeIndicacoes > 1}">
	                    			<p> ${estabelecimentoFaces.fornecedorModel.quantidadeIndicacoes} pessoas indicam</p>
	                    		</c:if>
		                		<div class="votacao">
		                			
		                			<a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${estabelecimentoFaces.fornecedorModel.id}&indicacao=true" class="floatLeft" ><span class="icons indicacao"></span>Indico</a>
						       		<a id="teste" title="Não indicar" onclick="nao_indicar(${estabelecimentoFaces.fornecedorModel.id})" class="linkRanking floatRight"><span class="icons naoindicacaoRed"></span> Não indico</a>
							       
								</div>
							
							</h:form>
							
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
                	<div class="recomende"><a href="http://www.facebook.com/sharer.php?u=URL_da_materia" target="_blank" title="Facebook"><img src="img/btnFb.jpg" title="Recomendar" /></a></div>
                    <div class="fb-like" data-href="http://www.zapeat.com.br" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>
                </div>
                
                <script type="text/javascript">
                
	                $('#target').submit(function() {
                	  alert('Handler for .submit() called.');
                	  return false;
                	});
                
                </script>
                
                <!-- COMENTÁRIOS FACEBOOK -->
                <div id="comentarioFb">
                
                	<p class="tituloComent">Deixe seu comentário</p>
                	
                	
                	<script type="text/javascript">
                	
	                	$('#btnComentar').live('click', function () {
	                	    return !isEmpty(new Array("#descricao"));
	                	});
	                	
					</script>
                	
                	<c:choose>
                	
                		<c:when test="${not empty estabelecimentoFaces.usuarioLogado.id}">
                			<h:form id="formComentario" prependId="false">
			                	<input type="hidden" id="id" name="id" value="${estabelecimentoFaces.fornecedorModel.id}">
			                	<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}">
			                     <fieldset>
			                        <h:inputTextarea id="descricao" value="#{estabelecimentoFaces.comentarioFornecedorModel.descricao}" required="true" />
			                        <h:commandButton id="btnComentar" action="#{estabelecimentoFaces.comentar}" value="comentar"></h:commandButton>
			                    </fieldset>
		                 	</h:form>
                		</c:when>
                		<c:otherwise>
                			<br/>
                			<div class="comment" style="margin-bottom: 30px;">
                				<p>Você precisa estar logado para comentar.</p>
                			</div>
                		</c:otherwise>
                	</c:choose>
	                
	                <c:if test="${not empty estabelecimentoFaces.fornecedorModel.comentarios}">
	                	
                		<c:forEach items="${estabelecimentoFaces.fornecedorModel.comentarios}" var="comentario">
	                	
		                	<div class="boxComentario">
	                	
			                    <span class="aspas"></span>
			                    <div class="comment">
			                         <p>${comentario.descricao}</p>
			                         <p class="autor">${comentario.usuarioModel.nome}</p>
			                    </div>
	                	
		                	</div>
	                	
                		</c:forEach>
		                
	                </c:if>
                </div>
            </div>
            
        </div>
        
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        
        	<%@ include file="/include_promocao_do_dia_estabelecimento_lateral.jsp" %>
            
            <%@ include file="/include_promocao_da_semana_estabelecimento_lateral.jsp" %>
            
            <%@ include file="/include_carro_chefe_estabelecimento_lateral.jsp" %>
            
           	<%@ include file="/include_banner_lateral.jsp" %>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>

	<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>
	<%@ include file="/include_modal_foto.jsp" %>
	
</body>
</html></f:view>
