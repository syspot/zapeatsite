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
	
	<input type="hidden" id="id" name="id" value="${promocaoFaces.promocao.id}">
	<input type="hidden" id="carroChefeId" name="id" value="${promocaoFaces.carroChefe.id}">

<div id="id-Breadcrumb">

    <span class="migalha"><a href="index.jsf?cidade=${cidadeFaces.cidadeSelecionada}" title="">Página Inicial</a></span>    »
    
    <c:choose>
    
    	<c:when test="${promocaoFaces.tipoPromocao}">
    	
    		<span class="migalha"><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.id}" title="">${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.descricao}</a></span>    »   
		    <span class="migalha"><a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocaoFaces.promocao.fornecedorModel.id}" title="">${promocaoFaces.promocao.fornecedorModel.nomeFantasia}</a></span>    »   
		    <span class="migalha"><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.id}&tipo=${promocaoFaces.promocao.tipoPromocaoModel.id}" title="">${promocaoFaces.promocao.tipoPromocaoModel.descricao}</a></span>    »   
		    <span class="migalha">${promocaoFaces.promocao.titulo}</span>
    
    	</c:when>
    	
    	<c:otherwise>
    	
    		<span class="migalha"><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${promocaoFaces.carroChefe.fornecedorModel.categoriaPrincipal.id}" title="">${promocaoFaces.carroChefe.fornecedorModel.categoriaPrincipal.descricao}</a></span>    »   
		    <span class="migalha"><a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocaoFaces.carroChefe.fornecedorModel.id}" title="">${promocaoFaces.carroChefe.fornecedorModel.nomeFantasia}</a></span>    »   
		    <span class="migalha">${promocaoFaces.carroChefe.titulo}</span>
    	
    	</c:otherwise>
    
    </c:choose>
    
</div>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA ESQUERDA -->
    	<div id="esqInt">
    	
    		<c:choose>
    			<c:when test="${promocaoFaces.tipoPromocao}">
    				<div id="boxSobreEstab">
		        		<a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocaoFaces.promocao.fornecedorModel.id}">
			            	<div class="marca"><img src="${promocaoFaces.promocao.fornecedorModel.logoMarcaView}" width="117" height="117" alt="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" title="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" /></div>
			                <p class="titulo marginBottom15px">${promocaoFaces.promocao.fornecedorModel.nomeFantasia} - ${promocaoFaces.promocao.fornecedorModel.bairro}</p>
			                <!--<div class="marginBottom5px">
			                	 <a href="" title="Indico"><span class="icons indicacaoAzul"></span>Eu Indico [100]</a>  
			                </div> -->
			                <div><span class="icons telAzul"></span>${promocaoFaces.promocao.fornecedorModel.telefone}</div>
		                </a>
		            </div>
		            <c:if test="${not empty promocaoFaces.promocao.imagensPromocoes}">
			            <div class="boxSubCat ftoLocal">
			            	<h2>Fotos da promoção</h2>
			            	<c:forEach items="${promocaoFaces.promocao.imagensPromocoes}" var="item">
				            	<span class="floatLeft">
				            		<a class="fotoEstab" href="${item.imagemFullView}">
				            			<img src="${item.imagemThumbView}" alt="" title="" />
			            			</a>
				            	</span>
			            	</c:forEach>
			            </div>
		            </c:if>
    			</c:when>
    			<c:otherwise>
    				<div id="boxSobreEstab">
		        		<a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocaoFaces.carroChefe.fornecedorModel.id}">
			            	<div class="marca"><img src="${promocaoFaces.carroChefe.fornecedorModel.logoMarcaView}" width="117" height="117" alt="${promocaoFaces.carroChefe.fornecedorModel.nomeFantasia}" title="${promocaoFaces.carroChefe.fornecedorModel.nomeFantasia}" /></div>
			                <p class="titulo marginBottom15px">${promocaoFaces.carroChefe.fornecedorModel.nomeFantasia} - ${promocaoFaces.carroChefe.fornecedorModel.bairro}</p>
			                <!--<div class="marginBottom5px">
			                	 <a href="" title="Indico"><span class="icons indicacaoAzul"></span>Eu Indico [100]</a>  
			                </div> -->
			                <div><span class="icons telAzul"></span>${promocaoFaces.carroChefe.fornecedorModel.telefone}</div>
		                </a>
		            </div>
		             <c:if test="${not empty promocaoFaces.carroChefe.imagensCarroChefe}">
			            <div class="boxSubCat ftoLocal">
			            	<h2>Fotos do Carro-Chefe</h2>
			            	<c:forEach items="${promocaoFaces.carroChefe.imagensCarroChefe}" var="item">
				            	<span class="floatLeft">
				            		<a class="fotoEstab" href="${item.imagemFullView}">
				            			<img src="${item.imagemThumbView}" alt="" title="" />
			            			</a>
				            	</span>
			            	</c:forEach>
			            </div>
		            </c:if>
    			</c:otherwise>
    		</c:choose>
        </div>

        
        <!-- COMECA COLUNA MEIO -->
        <div id="meio">
        	<div id="destaque">
        		
        		<c:choose>
    		
	    			<c:when test="${promocaoFaces.tipoPromocao}">
	    			
	    				<div id="fotoDestaque">
			                <a href=""><img src="${promocaoFaces.promocao.imagemPromocaoFullView}" alt="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" title="${promocaoFaces.promocao.fornecedorModel.nomeFantasia}" /></a>
		                    <div class="tituloPromo">
		                    	<p><span class="tipoPromo">${promocaoFaces.promocao.tipoPromocaoModel.descricao}</span></p>
		                        <p><span class="nomePromo">${promocaoFaces.promocao.titulo}</span></p>
		                    </div>
		                </div>
		                <c:if test="${not empty promocaoFaces.promocao.precoOriginal and not empty promocaoFaces.promocao.precoPromocional}">
			                <div id="faixa">
			                	<p class="precoDe">De: R$ ${promocaoFaces.promocao.precoOriginalFormatado}</p>
			                    <p class="precoPor">Por: R$ ${promocaoFaces.promocao.precoPromocionalFormatado}</p>
			                   	<p class="percentual">${promocaoFaces.promocao.percentualDesconto}%</p>
			                   	<p class="fontYi font10px">desconto</p>
			                </div>
		                </c:if>
		                <div class="boxInfo">
		                	<a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.id}" title="" class="floatLeft"><div class="floatLeft"><img src="${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.imagemView}" alt="" title="${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.descricao}" class="floatLeftMargin4" />Categoria: <c:out value="${promocaoFaces.promocao.fornecedorModel.categoriaPrincipal.descricao}" /></div></a>
		                </div>
		                <blockquote class="fontYi">
		                	<p>${promocaoFaces.promocao.descricao}</p>
		                </blockquote>
		            
	    			</c:when>
	    			
	    			<c:otherwise>
	    			
	    				<div id="fotoDestaque">
			                <a href=""><img src="${promocaoFaces.carroChefe.imagemFullView}" alt="${promocaoFaces.carroChefe.fornecedorModel.nomeFantasia}" title="${promocaoFaces.carroChefe.fornecedorModel.nomeFantasia}" /></a>
		                    <div class="tituloPromo">
		                    	<p><span class="tipoPromo">Carro chefe</span></p>
		                        <p><span class="nomePromo">${promocaoFaces.carroChefe.titulo}</span></p>
		                    </div>
		                </div>
		                <div class="boxInfo">
		                	<a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${promocaoFaces.carroChefe.fornecedorModel.categoriaPrincipal.id}" title="" class="floatLeft"><div class="floatLeft"><img src="${promocaoFaces.carroChefe.fornecedorModel.categoriaPrincipal.imagemView}" alt="" title="${promocaoFaces.carroChefe.fornecedorModel.categoriaPrincipal.descricao}" class="floatLeftMargin4" />Categoria: <c:out value="${promocaoFaces.carroChefe.fornecedorModel.categoriaPrincipal.descricao}" /></div></a>
		                </div>
		                <blockquote class="fontYi">
		                	<p>${promocaoFaces.carroChefe.descricao}</p>
		                </blockquote>
	    			
	    			</c:otherwise>
	    		
	    		</c:choose>
            	
                <div class="clear"></div>
                <div class="barraCompartilhamento">
	                <div class="recomende">
	                	<a href="http://www.facebook.com/sharer.php?u=http://www.zapeat.com" target="_blank" title="Facebook">
	                		<img src="img/btnFb.jpg" title="Recomendar" />
                		</a>
               		</div>
                    <div class="fb-like" data-href="http://www.zapeat.com.br" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>
                </div> 
                
                <c:choose>
    		
	    			<c:when test="${promocaoFaces.tipoPromocao}">
	    			
	    				<div id="outroDados">
		                	<ul>
		                    	<li>
		                        	<p class="titOtherInfo">Hora de funcionamento</p>
		                            <p>${promocaoFaces.promocao.fornecedorModel.horariosFuncionamento}</p>
		                        </li>
		                    	<li>
		                        	<p class="titOtherInfo">O local</p>
		                            <p>${promocaoFaces.promocao.fornecedorModel.logradouro}, ${promocaoFaces.promocao.fornecedorModel.bairro}</p>
		                        </li>
		                        <li>
		                        	<p class="titOtherInfo">Outros</p>
		                            <p>Formas de Pagamento</p>
		                            <p>
		                            	<c:forEach items="${promocaoFaces.promocao.fornecedorModel.formasPagamentos}" var="formaPagamento">
			                                <span class="iconCard">
				                                <img src="${formaPagamento.imagemView}" alt="" title="${formaPagamento.descricao}" class="floatLeftMargin4" />
			                                </span>
		                            	</c:forEach>
		                            </p>
		                        </li>
		                    </ul>
		                </div>
		                
		                <address>${promocaoFaces.promocao.fornecedorModel.logradouro}, nº ${promocaoFaces.promocao.fornecedorModel.numero} - ${promocaoFaces.promocao.fornecedorModel.bairro}</address>
		                
		                <script>
							  var map;
							  function initialize2() {
								// Creating a map
								var latlng = new google.maps.LatLng(${promocaoFaces.promocao.fornecedorModel.latitude}, ${promocaoFaces.promocao.fornecedorModel.longitude}); 
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
						
							  google.maps.event.addDomListener(window, 'load', initialize2);
							</script>
		            
	    			</c:when>
	    			
	    			<c:otherwise>
	    			
	    				<div id="outroDados">
		                	<ul>
		                    	<li>
		                        	<p class="titOtherInfo">O local</p>
		                            <p>${promocaoFaces.carroChefe.fornecedorModel.logradouro}, ${promocaoFaces.carroChefe.fornecedorModel.bairro}</p>
		                        </li>
		                        <li>
		                        	<p class="titOtherInfo">Outros</p>
		                            <p>Formas de Pagamento</p>
		                            <p>
		                            	<c:forEach items="${promocaoFaces.carroChefe.fornecedorModel.formasPagamentos}" var="formaPagamento">
			                                <span class="iconCard">
				                                <img src="${formaPagamento.imagemView}" alt="" title="${formaPagamento.descricao}" class="floatLeftMargin4" />
			                                </span>
		                            	</c:forEach>
		                            </p>
		                        </li>
		                    </ul>
		                </div>
		                
		                <address>${promocaoFaces.carroChefe.fornecedorModel.logradouro}, nº ${promocaoFaces.carroChefe.fornecedorModel.numero} - ${promocaoFaces.carroChefe.fornecedorModel.bairro}</address>
		                
		                <script>
							  var map;
							  function initialize2() {
								// Creating a map
								var latlng = new google.maps.LatLng(${promocaoFaces.carroChefe.fornecedorModel.latitude}, ${promocaoFaces.carroChefe.fornecedorModel.longitude}); 
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
						
							  google.maps.event.addDomListener(window, 'load', initialize2);
							</script>
	    			
	    			</c:otherwise>
	    		
	    		</c:choose>
	    		
			<div id="map_canvas_estab"></div>
			
		</div>

                
                <!-- COMENTÁRIOS FACEBOOK -->
                <div id="comentarioFb">
                	
                	<p class="tituloComent">Deixe seu comentário</p>
                	
	                <script type="text/javascript">
                	
	                	$('#btnComentar').live('click', function () {
	                	    return !isEmpty(new Array("#descricao"));
	                	});
	                	
					</script>
                	
                	<c:choose>
                	
                		<c:when test="${not empty promocaoFaces.usuarioLogado.id}">
                		
                			<h:form id="formComentario" prependId="false">

                				<c:choose>
                					<c:when test="${promocaoFaces.tipoPromocao}">
	                					<input type="hidden" id="id" name="id" value="${promocaoFaces.promocao.id}">
	                					<input type="hidden" id="estabelecimento_id" name="estabelecimento_id" value="${promocaoFaces.promocao.fornecedorModel.id}">
                					</c:when>
                					<c:otherwise>
                						<input type="hidden" id="carroChefeId" name="carroChefeId" value="${promocaoFaces.carroChefe.id}">
                						<input type="hidden" id="estabelecimento_id" name="estabelecimento_id" value="${promocaoFaces.carroChefe.fornecedorModel.id}">
                					</c:otherwise>
                				</c:choose>
			                	
			                	<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}">
			                	
			                     <fieldset>
			                     	
			                     	<c:choose>
	                					<c:when test="${promocaoFaces.tipoPromocao}">
		                					<h:inputTextarea id="descricao" value="#{promocaoFaces.comentarioPromocaoModel.descricao}" required="true" />
	                					</c:when>
	                					<c:otherwise>
	                						<h:inputTextarea id="descricao" value="#{promocaoFaces.comentarioCarroChefeModel.descricao}" required="true" />
	                					</c:otherwise>
	                				</c:choose>
			                        
			                        <h:commandButton id="btnComentar" action="#{promocaoFaces.comentar}" value="comentar"></h:commandButton>
			                        
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
	                
	                <c:choose>
       					<c:when test="${promocaoFaces.tipoPromocao}">
        					
        					<c:if test="${not empty promocaoFaces.promocao.comentarios}">
		                		<c:forEach items="${promocaoFaces.promocao.comentarios}" var="comentario">
				                	<div class="boxComentario">
					                    <span class="aspas"></span>
					                    <div class="comment">
					                         <p>${comentario.descricao}</p>
					                         <p class="autor">${comentario.usuarioModel.nome}</p>
					                    </div>
				                	</div>
		                		</c:forEach>
			                </c:if>
			                
       					</c:when>
       					<c:otherwise>
       						
       						<c:if test="${not empty promocaoFaces.carroChefe.comentarios}">
		                		<c:forEach items="${promocaoFaces.carroChefe.comentarios}" var="comentario">
				                	<div class="boxComentario">
					                    <span class="aspas"></span>
					                    <div class="comment">
					                         <p>${comentario.descricao}</p>
					                         <p class="autor">${comentario.usuarioModel.nome}</p>
					                    </div>
				                	</div>
		                		</c:forEach>
			                </c:if>
			                
       					</c:otherwise>
       				</c:choose>
	                				
                </div>
            </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        	
			<%@ include file="/include_promocao_do_dia_promocao_lateral.jsp" %>
            
			<%@ include file="/include_promocao_da_semana_promocao_lateral.jsp" %>
			
<%--             <%@ include file="/include_quem_indica_promocao_lateral.jsp" %> --%>

           	<%@ include file="/include_banner_lateral.jsp" %>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>

	<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>
	<%@ include file="/include_modal_foto.jsp" %>
	
</body>
</html>
</f:view>