<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="topo">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<h:form prependId="false">
			<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
		    <label>em<h:inputText id="info" value="#{buscaFaces.localBuscado}"/><span id="btnInit" class="icons" ></span></label>
		    <h:commandButton value="" action="#{buscaFaces.buscar}" />
		</h:form>
		
		<script src="js/jquery-1.8.2.js"></script>
		<script src="js/jquery.ui.core.js"></script>
		<script src="js/jquery.ui.widget.js"></script>
		<script src="js/jquery.ui.position.js"></script>
		<script src="js/jquery.ui.autocomplete.js"></script>
		
		<script type="text/javascript">
		  
			var availableTags = ${cidadeFaces.cidades};
			$( "#info" ).autocomplete({
				source: availableTags
			});
		
		</script>
    </div>
    
    <h:inputHidden value="#{categoriaFaces}"/>
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
                	<c:forEach items="${categoriaFaces.categorias}" var="item">
                    <li>
                        <span class="iconografia"><img src="${item.imagemView}" alt="${item.descricao}" title="${item.descricao}" /></span>
                        <span class="titMenu">${item.descricao}</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=${item.id}" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=5" title="carro-chefe">carro-chefe</a></li>
                            
                        </ul>
                    </li>
                    </c:forEach>
               </ul>
            </nav>
        </div>
</div>
