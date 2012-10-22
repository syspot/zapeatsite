<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>


<c:if test="${not empty indexFaces.promocaoHora}">

<div id="destaque">
        	
   	<div id="fotoDestaque">
   	
        <a href="promocao.jsf?id=${indexFaces.promocaoHora.id}">
        	<img src="${indexFaces.promocaoHora.imagemPromocaoFullView}" alt="" title="" />
        </a>
            <div class="tituloPromo">
           		<p><span class="tipoPromo">Promoção da hora</span></p>
				<p><span class="nomePromo"><c:out value="${indexFaces.promocaoHora.titulo}"/>/${indexFaces.promocaoHora.fornecedorModel.nomeFantasia}</span></p>
			</div>
	</div>
       
	<div id="faixa">
        <div class="marca">
        	<img src="${indexFaces.promocaoHora.fornecedorModel.logoMarcaView}" alt="" title="${indexFaces.promocaoHora.fornecedorModel.nomeFantasia}" />
        </div>
          <p class="percentual">${indexFaces.promocaoHora.percentualDesconto}%</p>
          <p class="fontYi font10px">desconto</p>
	</div>
       
	<blockquote class="fontYi">
		<p>${indexFaces.promocaoHora.descricao}</p>
		<p class="timePromo">Tempo restante:</p>
		<p id="tempo" class="time"></p>
	</blockquote>

	<div class="map">

		<script>
		
			 var map;
			
			 function initializeMap() {
			// Creating a map
			var lat = ${indexFaces.promocaoHora.fornecedorModel.latitude}
			var lng = ${indexFaces.promocaoHora.fornecedorModel.longitude}
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

	<c:if test="${not empty indexFaces.promocoesHora}">
	
		<div id="outrosDestaques">
			
			<h2>Outras Promoções da Hora</h2>
	   		
				<ul id="listagem">
					<c:forEach var="promocao" items="${indexFaces.promocoesHora}">
						<li>
							<a href="promocao.jsf?id=${promocao.id}" title="">
								<div class="marca floatLeft">
	                   				<img src="${promocao.imagemPromocaoThumbView}" alt="" title="${promocao.fornecedorModel.nomeFantasia}" />
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
									<p><div ><span class="icons site"></span> <a href="${promocao.fornecedorModel.site}" target="_blank" title="${promocao.fornecedorModel.site}">Visite o site</a> </div></p>
								</c:if>
								<p><span class="icons indicacao"></span>${promocao.indicacoes}</p>
							</div>
						</li>
					</c:forEach>
				</ul>
	   </div>
   
   </c:if>
   
</c:if>