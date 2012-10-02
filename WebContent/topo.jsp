<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<div id="topo">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<h:form>
			<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
		    <label>em<h:inputText id="info" value="#{buscaFaces.localBuscado}"/><span id="btnInit" class="icons" ></span></label>
		    <h:commandButton value="" action="#{buscaFaces.buscar}" />
		</h:form>

		<script src="js/jquery.autocomplete.js"></script>
		
		<script type="text/javascript">
		  $(document).ready(function(){
			var availableTags = [
				"ActionScript",
				"AppleScript",
				"Asp",
				"BASIC",
				"C",
				"C++",
				"Clojure",
				"COBOL",
				"ColdFusion",
				"Erlang",
				"Fortran",
				"Groovy",
				"Haskell",
				"Java",
				"JavaScript",
				"Lisp",
				"Perl",
				"PHP",
				"Python",
				"Ruby",
				"Scala",
				"Scheme"
			];
			$( "#info" ).autocomplete({
				source: availableTags
			});
		});
		</script>
    </div>
    <!-- TERMINA BUSCA -->
    <!-- COMECA PUBLICIDADE/MARCA -->
    <div id="marcaPublicidade">
    	<h1>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/index.jsf" title="Página Inicial">
				<h:graphicImage value="img/marca.png" />
			</h:outputLink>	
		</h1>
		<div class="superbanner"><img src="${bannerFaces.bannerTopo.imagemSuperiorGrandeView}" alt="" title="" /></div>
    </div>
    <!-- TERMINA PUBLICIDADE/MARCA -->    
    <!-- COMECA MENU -->
    <div id="menu">
            <nav id="categorias">
            	<div id="cadastro">
            		<div id="facebook">
						
					  <h:outputLink value="#{faceBookFaces.url}" rendered="#{empty sessionScope.usuarioLogado.id}">
						<h:graphicImage value="img/facebook.gif"/>
					  </h:outputLink>
					  
					  <div align="center">
					  <h:outputLink value="#{faceBookFaces.logout}" rendered="#{!empty sessionScope.usuarioLogado.id and !sessionScope.loginAplicacao}">
					  	<h:graphicImage value="img/botao_sair.png"/>
					  </h:outputLink>
					  </div>
					  
					  <div align="center">
					  <h:outputLink value="logout.jsf" rendered="#{!empty sessionScope.usuarioLogado.id and sessionScope.loginAplicacao}">
					  	<h:graphicImage value="img/botao_sair.png"/>
					  </h:outputLink>
					  </div>
					  
                    </div>
                    
                    <c:if test="${empty sessionScope.usuarioLogado.id}">
                    <div id="local">
                        <span class="chamadaCadastro">Não tem Facebook?</span>
                        
                        <div><a class="linkCadastro" title="Cadastrar"><span class="icons iconCadastrar"></span>cadastrar</a></div>
<div><a class="linkLogin" title="Login"><span class="icons iconLogin"></span>login</a></div>
                    </div>
                    </c:if>
            	</div>
                
                <ul id="principal">
                    <li>
                        <span class="icons maisIndicados"></span>
                        <span class="titMenu">mais indicados</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=7&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=7&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=7&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=7" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=7&tipo=5" title="carro-chefe">carro-chefe</a></li>
                            
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconBaladas"></span>
                        <span class="titMenu">baladas</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=1&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=1&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=1&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=1" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=1&tipo=5" title="carro-chefe">carro-chefe</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconBares"></span>
                        <span class="titMenu">bares</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=2&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=2&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=2&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=2" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=2&tipo=5" title="carro-chefe">carro-chefe</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconDelivery"></span>
                        <span class="titMenu">delivery</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=3&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=3&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=3&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=3" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=3&tipo=5" title="carro-chefe">carro-chefe</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconLanchonete"></span>
                        <span class="titMenu">lanchonetes</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=4&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=4&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=4&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=4" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=4&tipo=5" title="carro-chefe">carro-chefe</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconPizzaria"></span>
                        <span class="titMenu">pizzarias</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=5&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=5&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=5&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=5" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=5&tipo=5" title="carro-chefe">carro-chefe</a></li>
                        </ul>
                    </li>
                    <li>
                        <span class="icons iconRestaurante"></span>
                        <span class="titMenu">restaurantes</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=6&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=6&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=6&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=6" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=6&tipo=5" title="carro-chefe">carro-chefe</a></li>
                        </ul>
                    </li>
                    
               </ul>
            </nav>
        </div>
</div>
