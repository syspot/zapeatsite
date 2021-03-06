<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<div id="rodape">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<h:form prependId="false">
			<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
			
		    <c:if test="${not empty sessionScope.cidadeEstado}">
		    	<label>em<h:inputText id="cidade2" value="#{sessionScope.cidadeEstado}" /><span id="btnInit" class="icons" ></span></label>
		    	<input type="hidden" name="cidade" value="${sessionScope.cidadeEstado}"></input>
		    	<h:commandButton id="buscar2" value="" action="#{buscaFaces.buscar(sessionScope.cidadeEstado)}" />
		    </c:if>
		    <c:if test="${empty sessionScope.cidadeEstado}">
		    <label>em<h:inputText id="cidade2" value="#{cidadeFaces.cidadeSelecionada}" /><span id="btnInit" class="icons" ></span></label>
		    <input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}"></input>
		    <h:commandButton id="buscar2" value="" action="#{buscaFaces.buscar(cidadeFaces.cidadeSelecionada)}" />
		    </c:if>
		    
		    
		</h:form>
		
		<script src="js/jquery-1.8.2.js"></script>
		<script src="js/jquery.ui.core.js"></script>
		<script src="js/jquery.ui.widget.js"></script>
		<script src="js/jquery.ui.position.js"></script>
		<script src="js/jquery.ui.autocomplete.js"></script>
		
		<script type="text/javascript">
		  
			var availableTags = ${cidadeFaces.cidades};
			$( "#info2" ).autocomplete({
				source: availableTags
			});
		
		</script>
    </div>
    <!-- TERMINA BUSCA -->
	<div id="infos">
         <div class="contRodape">
             <div class="col floatLeft">
                <p>Sobre o Zapeat</p>
                <ul>
                    <li>&raquo; <a href="sobre.jsf?cidade=${cidadeFaces.cidadeSelecionada}" title="Sobre o Zapeat">Sobre</a></li>
                    <li>&raquo; <a href="namidia.jsf?cidade=${cidadeFaces.cidadeSelecionada}" title="Zapeat na M�dia">Zapeat na M�dia</a></li>
                    <li>&raquo; <a href="" title="">Fale com o Zapeat</a></li>
                </ul>
                <p>Usu�rio Zapeat</p>
                <ul>
                    <li>&raquo; <a href="termos.jsf?cidade=${cidadeFaces.cidadeSelecionada}" title="">Termos de Uso</a></li>
                    <li>&raquo; <a href="" title="">Pol�tica de Privacidade</a></li>
                    <li>&raquo; <a href="" title="">Perguntas Frequentes </a></li>
                 </ul>
            </div>
            <div class="col floatLeft marginLeft20">
                <p>Donos de Neg�cios</p>
                <ul>
                    <li>&raquo; <a href="divulgue.jsf?cidade=${cidadeFaces.cidadeSelecionada}" title="Divulgue sua empresa">Divulgue sua empresa </a></li>
                    <li>&raquo; <a href="anuncie.jsf?cidade=${cidadeFaces.cidadeSelecionada}" title="">Anuncie no site</a></li>
                </ul>
            </div>
            <div class="col floatRight">
                 <div class="fb-like-box" data-href="http://www.facebook.com/zapeat" data-width="292" data-height="330" data-show-faces="true" data-border-color="#D9A300" data-stream="false" data-header="false"></div>
             </div>
         </div>
        
    </div>

</div>

<!-- TERMINA RODAPE -->

<!-- NAO INDICO -->
<div id="mascaraRanking">    
	
	<div class="container">
	
		<a class="closeRanking" rel="modalclose"><img src="img/btnFechar.png" alt="Bot�o Fechar" class="btnFechar"></a>
		<h:form id="signup2" prependId="false">
    	
        <div class="header">
        
            <h3>Indica��o</h3>
            
            <p>Deixe um coment�rio sobre sua indica��o.</p>
            
        </div>
        
        <div class="sep"></div>
        
        <div class="inputs">
        	
        	<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />
        	<input type="hidden" id="estabelecimentoId" name="id" />        	
        	
        	<textarea name="comentario" rows="3" cols="43"></textarea>
        	
        	<script type="text/javascript">
				$('#comentario').attr('placeholder','Deixe o seu coment�rio').attr('autofocus','');
	        </script>
	        
        </div>

        <div class="inputs">
        
        	<h:commandButton value="N�O INDICAR" styleClass="submit" action="#{estabelecimentoFaces.naoIndicar}" />
           
        </div>
		
    </h:form>
	</div>
	
</div>	

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>