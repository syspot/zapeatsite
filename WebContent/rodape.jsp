<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<div id="rodape">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<h:form prependId="false">
			<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
		    <label>em<h:inputText id="info2" value="#{cidadeFaces.cidadeSelecionada}"/><span id="btnInit" class="icons" ></span></label>
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
         <div class="contRodape">
             <div class="col floatLeft">
                <p>Sobre o Zapeat</p>
                <ul>
                     <li>&raquo; <a href="" title="">Sobre</a></li>
                    <li>&raquo; <a href="" title="">Trabalhe no Zapeat</a></li>
                     <li>&raquo; <a href="" title="">Seja um Community Manager</a></li>
                    <li>&raquo; <a href="" title="">Zapeat na Mídia</a></li>
                     <li>&raquo; <a href="" title="">Fale com o Zapeat</a></li>
                </ul>
                <p>Usuário Zapeat</p>
                <ul>
                     <li>&raquo; <a href="" title="">Termos de Uso</a></li>
                    <li>&raquo; <a href="" title="">Política de Privacidade</a></li>
                     <li>&raquo; <a href="" title="">Como escrever opiniões construtivas?</a></li>
                    <li>&raquo; <a href="" title="">Perguntas Frequentes </a></li>
                 </ul>
            </div>
            <div class="col floatLeft marginLeft20">
                <p>Donos de Negócios</p>
                <ul>
                    <li>&raquo; <a href="" title="">Adicione uma empresa gratuitamente </a></li>
                     <li>&raquo; <a href="" title="">Anuncie no site</a></li>
                </ul>
            </div>
            <div class="col floatRight">
                 <div class="fb-like-box" data-href="http://www.facebook.com/fanpageTigurio" data-width="292" data-height="330" data-show-faces="true" data-border-color="#D9A300" data-stream="false" data-header="false"></div>
             </div>
         </div>
        
    </div>

</div>

<!-- TERMINA RODAPE -->

<!-- NAO INDICO -->
<div id="mascaraRanking">    
	
	<div class="container">
	
		<a class="closeRanking" rel="modalclose"><img src="img/btnFechar.png" alt="Botão Fechar" class="btnFechar"></a>
		<h:form id="signup2" prependId="false">
    	
        <div class="header">
        
            <h3>Indicação</h3>
            
            <p>Deixe um comentário sobre sua indicação.</p>
            
        </div>
        
        <div class="sep"></div>
        
        <div class="inputs">
        	
        	<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />
        	<input type="hidden" id="estabelecimentoId" name="id" />        	
        	
        	<textarea name="comentario" rows="3" cols="43"></textarea>
        	
        	<script type="text/javascript">
				$('#comentario').attr('placeholder','Deixe o seu comentário').attr('autofocus','');
	        </script>
	        
        </div>

        <div class="inputs">
        
        	<h:commandButton value="COMENTAR" styleClass="submit" action="#{estabelecimentoFaces.naoIndicar}" />
           
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