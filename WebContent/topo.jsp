<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>


<script type="text/javascript">
	$(document).ready(function(e) {
		$('.linkLogin').click(function(){
			$('.formLogin').slideToggle().animate({opacity:1})
		});
		$('.linkCadastro,.close').click(function(){
			$('#mascara').slideToggle();
		});
		
		$('.linkRanking,.closeRanking').click(function(){
			$('#mascaraRanking').slideToggle();
		});
		
		$('.closeLembrete').click(function(){
			$('#mascaraLembrete').slideToggle();
		});

		$('.mensagem .btnFechar').click(function(){
          $('.mensagem').fadeOut().css('display','none');
        });
		$('.lembrete').click(function(){
			$('#mascaraLembrete').slideToggle().animate({opacity:1})
		})
    });
</script>

<div id="topo">
	<!-- COMECA BUSCA -->
	<div class="barraBusca">
    	<h:form prependId="false">
			<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
			
		    <c:if test="${not empty sessionScope.cidadeEstado}">
		    	<label>em<h:inputText id="cidade" value="#{sessionScope.cidadeEstado}" /><span id="btnInit" class="icons" ></span></label>
		    	<input type="hidden" name="cidade" value="${sessionScope.cidadeEstado}"></input>
		    	<h:commandButton id="buscar" value="" action="#{buscaFaces.buscar(sessionScope.cidadeEstado)}" />
		    </c:if>
		    <c:if test="${empty sessionScope.cidadeEstado}">
		    <label>em<h:inputText id="cidade" value="#{cidadeFaces.cidadeSelecionada}" /><span id="btnInit" class="icons" ></span></label>
		    <input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}"></input>
		    <h:commandButton id="buscar" value="" action="#{buscaFaces.buscar(cidadeFaces.cidadeSelecionada)}" />
		    </c:if>
		    
		    
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
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/index.jsf?cidade=#{cidadeFaces.cidadeSelecionada}" title="P�gina Inicial">
				<h:graphicImage value="img/marca.png" />
			</h:outputLink>	
		</h1>
		<div class="superbanner">
			<a href="${bannerFaces.bannerTopo.url}">
				<img src="${bannerFaces.bannerTopo.imagemSuperiorGrandeView}" alt="" title="" />
			</a>
		</div>
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
					  

						  <h:outputLink styleClass="logout" value="logout.jsf?cidade=#{cidadeFaces.cidadeSelecionada}" rendered="#{!empty sessionScope.idUsuarioLogado and sessionScope.loginAplicacao}">
						  		Logout (sair)
						  </h:outputLink>
						  
						  <h:outputLink styleClass="logout" value="#{faceBookFaces.logout}" rendered="#{!empty sessionScope.idUsuarioLogado and !sessionScope.loginAplicacao}">
						  		Logout (sair)
						  </h:outputLink>
					  
                    </div>
                    
                    <c:if test="${empty sessionScope.idUsuarioLogado}">
	                    <div id="local">
	                        <span class="chamadaCadastro">N�o tem Facebook?</span>
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
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=3" title="zapeat da semana">zapeat da semana</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=2" title="zapeat do dia">zapeat do dia</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=1" title="zapeat da hora">zapeat da hora</a></li>
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
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=3" title="zapeat da semana">zapeat da semana</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=2" title="zapeat do dia">zapeat do dia</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=1" title="zapeat da hora">zapeat da hora</a></li>
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
				
				<!-- LINK LEMBRAR SENHA -->
				<span class="lembrete" style="margin-left:10px; font-size:10px; cursor:pointer;">[ esqueci a senha ]</span>
				
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
	<span id="status">Ol�, ${sessionScope.nomeUsuarioLogado}</span>, temos �timas promo��es pra voc�!
</c:if> 

</div>

<t:div styleClass="mensagem alertRed" rendered="#{!empty facesContext.maximumSeverity && facesContext.maximumSeverity.ordinal==2}">
<span class="btnFechar">[X]</span>
	<p><h:messages showDetail="true" showSummary="false"/></p>
</t:div>

<t:div styleClass="mensagem alertGreen" rendered="#{!empty facesContext.maximumSeverity && facesContext.maximumSeverity.ordinal==0}">
<span class="btnFechar">[X]</span>
	<p><h:messages showDetail="true" showSummary="false"/></p>
</t:div>

<!-- 
<div align="center">
	<h:messages errorClass="erros msg erro" infoClass="infos msg ok" fatalClass="erros msg erro" showDetail="true"/>
</div>
 -->

<div id="mascara">    
	
	<div class="container">
	
		<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="Bot�o Fechar" class="btnFechar"></a>

		<h:form id="signup" prependId="false">
    
	        <div class="header">
	        
	            <h3>Cadastro</h3>
	            
	            <p>Preencha os dados abaixo para cadastro</p>
	            
	        </div>
        
        	<div class="sep"></div>

        	<div class="inputs">

				<h:inputText tabindex="100" required="true" id="nome_div" maxlength="100" value="#{cadastroFaces.usuarioModel.nome}"/>

				<h:inputText tabindex="101" required="true" id="email_div" maxlength="100" value="#{cadastroFaces.usuarioModel.email}" />

				<h:inputSecret tabindex="102" required="true" id="senha_div" maxlength="100" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>
				
				<span id="span_flag_aceito">
				<input type="checkbox" id="flag_aceito" tabindex="103"/>
				<h:outputText value="Li e aceito os " styleClass="header"/>
				<a href="files/TermosCondicoesGeraisUsoSiteZapeat.pdf" target="_blank">Termos e Condi��es Gerais de Uso</a>
				</span>
	             <script type="text/javascript">
             		$('#nome_div').attr('placeholder','Nome').attr('autofocus','');
             		$('#email_div').attr('placeholder','E-mail');
             		$('#senha_div').attr('placeholder','Senha');
             		
             		$('#btnCadastrarUsuario').live('click', function () {
             	  	    return !isEmpty(new Array("#nome_div", "#email_div", "#senha_div")) && isChecked("#flag_aceito") && validarEmail("#email_div");
             	  	});
	            </script>

        	</div>

        	<div class="inputs">
        		
        		<h:commandButton id="btnCadastrarUsuario" tabindex="104" styleClass="submit"  value="CADASTRAR" action="#{cadastroFaces.insertEvent}"/>
            
        	</div>
        	
        	<input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}" />

    	</h:form>
    	
	</div>
	
</div>

<div id="mascaraLembrete">    
	
	<div class="container">
	
		<a href="#" class="closeLembrete" rel="modalclose"><img src="img/btnFechar.png" alt="Bot�o Fechar" class="btnFechar"></a>

		<h:form id="signup3" prependId="false">
    
	        <div class="header">
	        
	            <h3>Reenviar Senha</h3>
	            
	            <p>Informe seu e-mail para que possamos lhe enviar sua senha.</p>
	            
	        </div>
        
        	<div class="sep"></div>

        	 <div class="inputs">			

				<h:inputText tabindex="101" required="true" id="email3_div" maxlength="100" value="#{cadastroFaces.usuarioModel.email}" />

				
	             <script type="text/javascript">
             		$('#email3_div').attr('placeholder','E-mail').attr('autofocus','');
             		
             		$('#btnCadastrarUsuario3').live('click', function () {
             	  	    return !isEmpty(new Array("#email3_div")) && validarEmail("#email3_div");
             	  	});
	            </script>

        	</div>

        	<div class="inputs">
        		
        		<h:commandButton id="btnCadastrarUsuario3" tabindex="104" styleClass="submit"  value="ENVIAR EMAIL" action="#{cadastroFaces.recuperarSenha}"/>
            
        	</div> 
        	<h:inputHidden value="#{cidadeFaces.cidadeSelecionada}"/>
    	</h:form>
    	
	</div>
	
</div>
