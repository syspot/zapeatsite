<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<div id="rodape">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<h:form prependId="false">
			<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
		    <label>em<h:inputText id="info2" value="#{buscaFaces.localBuscado}"/><span id="btnInit" class="icons" ></span></label>
		    <h:commandButton value="" action="#{buscaFaces.buscar}" />
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
    	<div class="fb-like-box" data-href="http://www.facebook.com/fanpageTigurio" data-width="292" data-height="330" data-show-faces="true" data-border-color="#D9A300" data-stream="false" data-header="false"></div>
    </div>
    <div id="copy">Zapeat 2012 - O Zapeat não é autor e não endossa nenhuma das opiniões e/ou comentários. Eles são de exclusiva responsabilidade dos respectivos autores.</div>
</div>

<!-- TERMINA RODAPE -->

<!-- NAO INDICO -->
<div id="mascaraRanking">    
	
	<div class="container">
	
		<a class="closeRanking" rel="modalclose"><img src="img/btnFechar.png" alt="Botão Fechar" class="btnFechar"></a>
		<h:form id="signup2" enctype="multipart/form-data" prependId="false">
    	
        <div class="header">
        
            <h3>Indicação</h3>
            
            <p>Deixe um comentário sobre sua indicação.</p>
            
        </div>
        
        <div class="sep"></div>
        
         <div align="center">
                <h:messages errorStyle="color:red;" fatalStyle="color:red;" infoClass="info" infoStyle="color:green;" showDetail="true" showSummary="false" fatalClass="error" errorClass="error" id="msg"/>
            </div>
        
        <div class="inputs">
        	
        	<t:inputHidden id="categoriaId" forceId="true"/>
        	<t:inputHidden id="estabelecimentoId" forceId="true"/>
        	<t:inputHidden id="indico" forceId="true"/>
        	
        	<t:inputTextarea id="comentario" forceId="true" cols="43"/>
        	
        	<script type="text/javascript">
				$('#comentario').attr('placeholder','Deixe o seu comentário').attr('autofocus','');
	        </script>
	        
        </div>

        <div class="inputs">
        
        	<h:commandButton value="COMENTAR" styleClass="submit" action="#{rankingFaces.indicacaoNegativa}"/>  
           
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