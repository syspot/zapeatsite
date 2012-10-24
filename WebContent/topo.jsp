<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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


<script type="text/javascript">
$(document).ready( function() {
	$("#signup").validate({
		// Define as regras
		rules:{
			nome:{
				// campoNome ser� obrigat�rio (required) e ter� tamanho m�nimo (minLength)
				required: true
			},
			email:{
				// campoEmail ser� obrigat�rio (required) e precisar� ser um e-mail v�lido (email)
				required: true, email: true

			},
			senha:{
				// campoMensagem ser� obrigat�rio (required) e ter� tamanho m�nimo (minLength)
				required: true, minlength: 6
			}
		},
		// Define as mensagens de erro para cada regra
		messages:{
			nome:{
				required: "Nome: Obrigat�rio",

			},
			email:{
				required: "E-mail: Obrigat�rio",
				email: "E-mail inv�lido"

			},

			senha:{
				required: "Senha: Obrigat�rio",
				minlength: "Sua senha deve ter no m�nimo, 6 caracteres"
			}
		},

	});
});
</script>

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
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/index.jsf" title="P�gina Inicial">
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
					  <h:outputLink styleClass="logout" value="#{faceBookFaces.logout}" rendered="#{!empty sessionScope.usuarioLogado.id and !sessionScope.loginAplicacao}">
					  	Logout (sair)
					  </h:outputLink>
					  </div>
					  
					  <div align="center">
						  <h:outputLink styleClass="logout" value="logout.jsf" rendered="#{!empty sessionScope.usuarioLogado.id and sessionScope.loginAplicacao}">
						  	Logout (sair)
						  </h:outputLink>
					  </div>
					  
                    </div>
                    
                    <c:if test="${empty sessionScope.usuarioLogado.id}">
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
                            <li><a href="listagem.jsf?categoriaId=7&tipo=3" title="promo��o da semana">promo��o da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=7&tipo=2" title="promo��o do dia">promo��o do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=7&tipo=1" title="promo��o da hora">promo��o da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=7" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=7&tipo=5" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="listagem.jsf?categoriaId=7&tipo=6" title="estabelecimento">estabelecimento</a></li>
                        </ul>
                    </li>
                	<c:forEach items="${categoriaFaces.categorias}" var="item">
                    <li>
                        <span class="iconografia"><img src="${item.imagemView}" alt="" title="${item.descricao}" /></span>
                        <span class="titMenu">${item.descricao}</span>
                        <ul id="sub">
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=3" title="promo��o da semana">promo��o da semana</a></li>
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=2" title="promo��o do dia">promo��o do dia</a></li>
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=1" title="promo��o da hora">promo��o da hora</a></li>
                            <li><a href="ranking.jsf?categoriaId=${item.id}" title="ranking">ranking</a></li>
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=5" title="carro-chefe">carro-chefe</a></li>
                            <li><a href="listagem.jsf?categoriaId=${item.id}&tipo=6" title="estabelecimento">estabelecimento</a></li>
                        </ul>
                    </li>
                    </c:forEach>
                    <li>
                    	<a href="outrasCat.jsf">
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
    	<div class="inputs">
        	Preencha os dados ao lado para acessar: 
        	<h:inputText title="E-mail" id="emailLogin" value="#{loginFaces.usuarioModel.email}" required="false" requiredMessage="Email: Obrigat�rio" tabindex="1" maxlength="100"/>
            <h:inputSecret tabindex="2" required="false" id="senhaLogin" maxlength="100" value="#{loginFaces.usuarioModel.senha}" requiredMessage="Senha: Obrigat�rio" redisplay="true"/>
			<h:commandButton tabindex="3" styleClass="submit" action="#{loginFaces.autenticar}" id="submit2" value="ACESSAR"></h:commandButton>
			<script type="text/javascript">
	             		$('#emailLogin').attr('placeholder','E-mail').attr('autofocus','');
	             		$('#senhaLogin').attr('placeholder','Senha');

	        </script>
        </div>
        </h:form>
</div>

<c:if test="${!empty sessionScope.usuarioLogado.id}">
<span id="status">Ol�, ${sessionScope.usuarioLogado.nome}</span>, temos �timas promo��es pra voc�!
</c:if> 

</div>

<div align="center">
	<h:messages errorClass="erros msg erro" infoClass="infos msg ok" fatalClass="erros msg erro" showDetail="true"/>
</div>

<div id="mascara">    
	
	<div class="container">
	
		<a href="#" class="close" rel="modalclose"><img src="img/btnFechar.png" alt="Bot�o Fechar" class="btnFechar"></a>

		<h:form id="signup" enctype="multipart/form-data" prependId="false">
    
	        <div class="header">
	        
	            <h3>Cadastro</h3>
	            
	            <p>Preencha os dados abaixo para cadastro</p>
	            
	        </div>
        
        	<div class="sep"></div>

        	<div class="inputs">

				<h:inputText tabindex="100" required="false" id="nome" maxlength="100" value="#{cadastroFaces.usuarioModel.nome}"/>

				<h:inputText tabindex="101" required="false" id="email" maxlength="100" value="#{cadastroFaces.usuarioModel.email}"/>

				<h:inputSecret tabindex="102" required="false" id="senha" maxlength="100" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>

	             <script type="text/javascript">
	             		$('#nome').attr('placeholder','Nome').attr('autofocus','');
	             		$('#email').attr('placeholder','E-mail');
	             		$('#senha').attr('placeholder','Senha');

	            </script>

        	</div>

        	<div class="inputs">
        	
        		<h:commandButton tabindex="103" styleClass="submit"  value="CADASTRAR" action="#{cadastroFaces.insertEvent}"/>
            
        	</div>

    	</h:form>

	</div>
	
</div>