<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>


<script type="text/javascript">
	$(document).ready(function(e) {
		$('.linkLogin').click(function(){
			$('.formLogin').slideToggle().animate({opacity:1})
		})
		$('.linkCadastro,.close').click(function(){
			$('#mascara').slideToggle();
		})
		
		$('.linkRanking,.closeRanking').click(function(){
			$('#mascaraRanking').slideToggle();
		})
    });
</script>

<div id="topo">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<h:form prependId="false">
			<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
		    <label>em<h:inputText id="cidade" value="#{cidadeFaces.cidadeSelecionada}"/><span id="btnInit" class="icons" ></span></label>
		    <input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}"></input>
		    <h:commandButton value="" action="#{buscaFaces.buscar}" />
		</h:form>
		
		<script src="js/jquery-1.8.2.js"></script>
		<script src="js/jquery.ui.core.js"></script>
		<script src="js/jquery.ui.widget.js"></script>
		<script src="js/jquery.ui.position.js"></script>
		<script src="js/jquery.ui.autocomplete.js"></script>
		
		<script type="text/javascript">
			var availableTags = ${cidadeFaces.cidades};
			$( "#cidade" ).autocomplete({
				source: availableTags
			});
		</script>
    </div>
    <h:inputHidden value="#{categoriaFaces}"/>
    <!-- TERMINA BUSCA -->
    <!-- COMECA PUBLICIDADE/MARCA -->
    <div id="marcaPublicidade">
    	<h1>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/index.jsf?cidade=#{cidadeFaces.cidadeSelecionada}" title="Página Inicial">
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
						
					  <h:outputLink value="#{faceBookFaces.url}" rendered="#{empty sessionScope.idUsuarioLogado}">
						<h:graphicImage value="img/facebook.gif"/>
					  </h:outputLink>
					  
					  <div align="center">

						  <h:outputLink styleClass="logout" value="logout.jsf?cidade=#{cidadeFaces.cidadeSelecionada}" rendered="#{!empty sessionScope.idUsuarioLogado and sessionScope.loginAplicacao}">
						  		Logout (sair)
						  </h:outputLink>
						  
						  <h:outputLink styleClass="logout" value="#{faceBookFaces.logout}" rendered="#{!empty sessionScope.idUsuarioLogado and !sessionScope.loginAplicacao}">
						  		Logout (sair)
						  </h:outputLink>
						  
					  </div>
					  
                    </div>
                    
                    <c:if test="${empty sessionScope.idUsuarioLogado}">
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
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=3" title="promoção da semana">promoção da semana</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=2" title="promoção do dia">promoção do dia</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=1" title="promoção da hora">promoção da hora</a></li>
                            <li><a href="ranking.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=5" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=6" title="estabelecimento">estabelecimento</a></li>
                        </ul>
                    </li>
                    
                	<c:forEach items="${categoriaFaces.categorias}" var="item">
	                    <li>
	                        <span class="iconografia"><img src="${item.imagemView}" alt="" title="${item.descricao}" /></span>
	                        <span class="titMenu">${item.descricao}</span>
	                        <ul id="sub">
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=3" title="promoção da semana">promoção da semana</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=2" title="promoção do dia">promoção do dia</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=1" title="promoção da hora">promoção da hora</a></li>
	                            <li><a href="ranking.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}" title="ranking">ranking</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=5" title="carro-chefe">carro-chefe</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=6" title="estabelecimento">estabelecimento</a></li>
	                        </ul>
	                    </li>
                    </c:forEach>
                    
                    <li>
                    	<a href="outrasCat.jsf?cidade=${cidadeFaces.cidadeSelecionada}">
	                    	<span class="iconografia"><img src="img/outrasCategorias.png" alt="" title="outras categorias" /></span>
	                        <span class="titMenu">outras categorias</span>
                        </a>
	                </li>
               </ul>
            </nav>
        </div>
	</div>


<div id="id-Breadcrumb">
	<div class="formLogin">
    	<h:form prependId="false" id="form1">
    		<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />
	    	<div class="inputs">
	        	Preencha os dados ao lado para acessar: 
	        	<h:inputText tabindex="1" title="E-mail" id="emailLogin" maxlength="100" value="#{loginFaces.usuarioModel.email}"  />
	            <h:inputSecret tabindex="2" id="senhaLogin" maxlength="100" value="#{loginFaces.usuarioModel.senha}" redisplay="true"/>
				<h:commandButton tabindex="3" styleClass="submit" action="#{loginFaces.autenticar}" id="submit2" value="ACESSAR"></h:commandButton>
				<script type="text/javascript">
	           		$('#emailLogin').attr('placeholder','E-mail').attr('autofocus','');
	           		$('#senhaLogin').attr('placeholder','Senha');
	           		
	           		$('#submit2').live('click', function () {
	         	  	    return !isEmpty(new Array("#emailLogin", "#senhaLogin"));
	         	  	});
		        </script>
	        </div>
        </h:form>
	</div>

<c:if test="${!empty sessionScope.idUsuarioLogado}">
	<span id="status">Olá, ${sessionScope.nomeUsuarioLogado}</span>, temos ótimas promoções pra você!
</c:if> 

</div>

<div align="center">
	<h:messages errorClass="erros msg erro" infoClass="infos msg ok" fatalClass="erros msg erro" showDetail="true"/>
</div>

<div id="mascara">    
	
	<div class="container">
	
		<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="Botão Fechar" class="btnFechar"></a>

		<h:form id="signup" prependId="false">
    
	        <div class="header">
	        
	            <h3>Cadastro</h3>
	            
	            <p>Preencha os dados abaixo para cadastro</p>
	            
	        </div>
        
        	<div class="sep"></div>

        	<div class="inputs">

				<h:inputText tabindex="100" required="true" id="nome" maxlength="100" value="#{cadastroFaces.usuarioModel.nome}"/>

				<h:inputText tabindex="101" required="true" id="email" maxlength="100" value="#{cadastroFaces.usuarioModel.email}"/>

				<h:inputSecret tabindex="102" required="true" id="senha" maxlength="100" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>

	             <script type="text/javascript">
             		$('#nome').attr('placeholder','Nome').attr('autofocus','');
             		$('#email').attr('placeholder','E-mail');
             		$('#senha').attr('placeholder','Senha');
             		
             		$('#btnCadastrarUsuario').live('click', function () {
             	  	    return !isEmpty(new Array("#nome", "#email", "#senha"));
             	  	});
	            </script>

        	</div>

        	<div class="inputs">
        	
        		<h:commandButton id="btnCadastrarUsuario" tabindex="103" styleClass="submit"  value="CADASTRAR" action="#{cadastroFaces.insertEvent}"/>
            
        	</div>
        	
        	<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />

    	</h:form>

	</div>
	
</div>