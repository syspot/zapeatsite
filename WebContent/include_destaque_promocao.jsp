<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>


<c:if test="${not empty indexFaces.promocao}">

	<div id="destaque">
	        	
	   	<div id="fotoDestaque">
	   	
	        <a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${indexFaces.promocao.id}&estabelecimento_id=${indexFaces.promocao.fornecedorModel.id}">
	        	<img src="${indexFaces.promocao.imagemPromocaoFullView}" alt="" title="" />
	        </a>
            
            <div class="tituloPromo">
           		<p><span class="tipoPromo"><c:out value="${indexFaces.promocao.tipoPromocaoModel.descricao}" /></span></p>
				<p><span class="nomePromo"><c:out value="${indexFaces.promocao.titulo}"/>/${indexFaces.promocao.fornecedorModel.nomeFantasia}</span></p>
			</div>
			
		</div>
	       
		<div id="faixa">
	        <div class="marca">
	        	<a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${indexFaces.promocao.fornecedorModel.id}">
	        		<img src="${indexFaces.promocao.fornecedorModel.logoMarcaView}" alt="" title="${indexFaces.promocao.fornecedorModel.nomeFantasia}" />
	        	</a>
	        </div>
	        <c:if test="${not empty indexFaces.promocao.precoPromocional and not empty indexFaces.promocao.precoOriginal}">
				<p class="percentual">${indexFaces.promocao.percentualDesconto}%</p>
				<p class="fontYi font10px">desconto</p>
			</c:if>
		</div>
	    
		<blockquote class="fontYi">
			<p>${indexFaces.promocao.descricao}</p>
		    <c:if test="${indexFaces.promocao.tipoPromocaoModel.id == 1}">
				<p class="timePromo">Tempo restante:</p>
				<p id="tempo" class="time"></p>
			</c:if>
		</blockquote>
	
		<div class="map">
	
			<script>
			
				 var map;
				
				 function initializeMap() {
				// Creating a map
				var lat = ${indexFaces.promocao.fornecedorModel.latitude}
				var lng = ${indexFaces.promocao.fornecedorModel.longitude}
				var latlng = new google.maps.LatLng(lat, lng); 
				var map = new google.maps.Map(document.getElementById('map_canvas'), {  
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
				
				 google.maps.event.addDomListener(window, 'load', initializeMap);
				 
			</script>
	           	
	       	<div id="map_canvas"></div>
	        <div class="shadow1"></div>
	        <div class="shadow2"></div>
	        <div class="shadow3"></div>
	        <div class="shadow4"></div>
	               
		</div>
	           
		<div class="clear"></div>
		<div class="barraCompartilhamento">
			<div class="recomende"><a href="http://www.facebook.com/sharer.php?u=URL_da_materia" target="_blank" title="Facebook"><img src="img/btnFb.jpg" title="Recomendar" /></a></div>
	                    <div class="fb-like" data-href="http://www.zapeat.com.br" data-send="false" data-layout="button_count" data-width="200" data-show-faces="false"></div>
		</div>
	            
	</div>

	<c:if test="${not empty indexFaces.promocoes}">
	
		<div id="outrosDestaques">
		
			<h2>Outros Zapeat da Hora</h2>
   		
			<ul id="listagem">
				<c:forEach var="promocao" items="${indexFaces.promocoes}">
					<li>
						<a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocao.id}&estabelecimento_id=${promocao.fornecedorModel.id}" title="">
							<div class="marca floatLeft">
                   				<img src="${promocao.imagemThumbView}" alt="" title="${promocao.fornecedorModel.nomeFantasia}" />
                  			</div>
							<!-- SE PROMOÇÃO EM PRODUTO -->
		                   <div class="info">
		                       <p class="titulo">${promocao.titulo}</p>
		                       <p class="resumo fontYi">
		                       ${promocao.descricao}
		                       </p>
		                   </div>
						</a>
						
		               <div class="dados">
							<p><span class="icons tel"></span>${promocao.fornecedorModel.telefone}</p>
							<c:if test="${not empty promocao.fornecedorModel.site}">
								<p><span class="icons site"></span> <a href="${promocao.fornecedorModel.site}" target="_blank" title="${promocao.fornecedorModel.site}">Visite o site</a></p>
							</c:if>
							<p><span class="icons indicacao"></span>${promocao.indicacoes}</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
  
	</c:if>
   
</c:if>