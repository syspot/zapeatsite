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
		    <label>em<h:inputText id="cidade" value="#{cidadeFaces.cidadeSelecionada}" /><span id="btnInit" class="icons" ></span></label>
		    <input type="hidden" name="cidade" value="${cidadeFaces.cidadeSelecionada}"></input>
		    <h:commandButton id="buscar" value="" action="#{buscaFaces.buscar(cidadeFaces.cidadeSelecionada)}" />
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
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=3" title="promo��o da semana">promo��o da semana</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=2" title="promo��o do dia">promo��o do dia</a></li>
                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=7&tipo=1" title="promo��o da hora">promo��o da hora</a></li>
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
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=3" title="promo��o da semana">promo��o da semana</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=2" title="promo��o do dia">promo��o do dia</a></li>
	                            <li><a href="listagem.jsf?cidade=${cidadeFaces.cidadeSelecionada}&categoriaId=${item.id}&tipo=1" title="promo��o da hora">promo��o da hora</a></li>
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
	<span id="status">Ol�, ${sessionScope.nomeUsuarioLogado}</span>, temos �timas promo��es pra voc�!
</c:if> 

</div>

<div align="center">
	<h:messages errorClass="erros msg erro" infoClass="infos msg ok" fatalClass="erros msg erro" showDetail="true"/>
</div>

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

				<h:inputText tabindex="101" required="true" id="email_div" maxlength="100" value="#{cadastroFaces.usuarioModel.email}"/>

				<h:inputSecret tabindex="102" required="true" id="senha_div" maxlength="100" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>
				
				<textarea name="comentario" rows="3" cols="41">
				Termos e Condi��es Gerais de uso do site ZAPEAT.COM

Estes Termos e Condi��es Gerais aplicam-se ao uso dos servi�os oferecidos por INTERM�DIA ELETR�NICA CORPORA��O LTDA, empresa devidamente inscrita no CNPJ/MF sob o n� 13.691.256/0001-34, usu�ria da marca ZAPEAT. Qualquer pessoa, doravante nominada USU�RIO, que pretenda utilizar os servi�os do site www.zapeat.com ou www.zapeat.com.br dever� aceitar os Termos e Condi��es Gerais, e todas as demais pol�ticas e princ�pios que o regem. 
A ACEITA��O E ENTENDIMENTO DESTES TERMOS E CONDI��ES GERAIS DE USO PELO USU�RIO S�O ABSOLUTAMENTE INDISPENS�VEIS PARA A CONCLUS�O DO CADASTRO E POSTERIOR UTILIZA��O DO SITE ZAPEAT.COM.BR E DE SEUS SERVI�OS.

O usu�rio dever� ler, certificar-se de haver entendido e aceitar todas as condi��es estabelecidas nos Termos e Condi��es Gerais, assim como nos demais documentos incorporados aos mesmos por refer�ncia, antes de seu cadastro como Usu�rio do ZAPEAT.COM.BR



OBJETO


O servi�o objeto do presente Termos e Condi��es Gerais de Uso consistem em ofertar ao Usu�rio uma plataforma desenvolvida exclusivamente como um instrumento de busca de promo��es e divulga��o de restaurantes, bares, shows e similares. O ZAPEAT, portanto, possibilita aos usu�rios receberem ou buscarem de forma ativa promo��es divulgadas exclusivamente por responsabilidade dos estabelecimentos cadastrados, funcionando independentemente, agindo o site como um facilitador na divulga��o, permitindo que eles negociem entre si diretamente, sem sua interven��o na finaliza��o das vendas, n�o participando da realiza��o comercial dos mesmos.



CADASTRO


O cadastramento no site ZAPEAT � gratuito, sendo necess�rio que o USU�RIO seja pessoa f�sica, devendo indicar em campo espec�fico o e-mail preferencial seguido da senha de acesso. O login ser� o e-mail cadastrado.

N�o se permitir� a manuten��o de mais de um cadastro para um mesmo e-mail.

O USU�RIO ser� o �nico respons�vel pelas opera��es efetuadas em sua CONTA, que apenas poder� ser acessada atrav�s de LOGIN e senha pessoal intransfer�vel. O USU�RIO compromete-se a n�o informar a terceiros os dados da sua CONTA, responsabilizando-se civil e criminalmente pelo seu uso indevido ou por quaisquer pr�ticas il�citas que interfiram, manipulem ou prejudiquem o funcionamento do site ou das informa��es nele contidas.


MODIFICA��ES DOS TERMOS E CONDI��ES GERAIS

O ZAPEAT poder� alterar, a qualquer tempo, estes Termos e Condi��es Gerais, visando seu aprimoramento e melhoria dos servi�os prestados. Os novos Termos e Condi��es entrar�o em vigor no mesmo dia da publica��o no site. No prazo de 15 (cinco) dias contados a partir da publica��o das modifica��es, o Usu�rio dever� comunicar-se por e-mail caso n�o concorde com os termos alterados. Nesse caso, o v�nculo contratual deixar� de existir. N�o havendo manifesta��o no prazo estipulado, entender-se-� que o Usu�rio aceitou tacitamente os novos Termos e Condi��es e o contrato continuar� vinculando as partes.


DOS TERMOS UTILIZADOS E SUAS DEFINI��ES

Usu�rio: qualquer pessoa f�sica devidamente cadastrada.
Promo��o da Hora: promo��o publicada pelo estabelecimento por per�odo de 01 hora, devidamente registrado o inicio da publica��o.

Promo��o do Dia: promo��o publicada pelo estabelecimento por per�odo de 01 dia, devidamente registrado o inicio da publica��o.

Promo��o da Semana: promo��o publicada pelo estabelecimento por per�odo de 01 semana, devidamente registrado o inicio da publica��o.

Carro Chefe: publica��o de prato t�pico ou destaque do estabelecimento.

Ranking: posicionamento do estabelecimento conforme avalia��es dos usu�rios.



CONDI��ES GERAIS.


O ZAPEAT � uma plataforma criada para facilitar a divulga��o de promo��es de estabelecimentos de alimentos, como restaurantes e bares, para o p�blico em geral. O site n�o se responsabiliza por substitui��o, promo��es, intermedia��o de venda, capacidade log�stica, estoque, envio, recebimento, pagamento ou qualquer neg�cio que fuja do objeto deste termo de contrato.

A publica��o das promo��es � de inteira responsabilidade dos estabelecimentos aliment�cios, n�o tendo o ZAPEAT qualquer responsabilidade sobre efetiva��o da venda, entrega do produto ou publica��o enganosa ao consumidor.

N�o nos responsabilizamos, sob quaisquer circunst�ncias, por eventuais preju�zos decorrentes de falhas t�cnicas, operacionais, de estrutura de comunica��o ou de acesso ao sistema, que impossibilitem ou dificultem a participa��o do USU�RIO. Efetuamos a manuten��o constante de nossos servi�os, mas n�o garantimos poss�veis dificuldades ou falhas de conex�o com os nossos servidores, pois o sistema est� sujeito � interfer�ncia de fatores externos. Da mesma forma, nas situa��es de contrata��o dos servi�os de mensagem por celular, n�o garantimos o completo envio das mensagens, sendo de inteira responsabilidade das concession�rias telef�nicas este servi�o.

A promo��o ser� garantida pelo estabelecimento durante o per�odo discriminado da promo��o, contando desde sua publica��o no sistema at� o t�rmino do prazo pr�-estabelecido.

O layout do sistema, bem como supress�o ou acr�scimo de categorias e produtos ou quaisquer altera��es que o ZAPEAT achar necess�rio ser� realizado sem pr�via altera��o dos usu�rios, bastando apenas que ocorra um comunicado no site num per�odo de 15 dias anterior a modifica��o implantada.



COOKIES


O utilizador e o visitante do site do ZAPEAT manifesta conhecer e aceitar que poder� ser utilizado um sistema de monitoramento mediante a utiliza��o de cookies. Os cookies s�o pequenos arquivos que se instalam no disco r�gido, comum a dura��o limitada de tempo que ajudam a personalizar os servi�os. Tamb�m ser�o ofertadas algumas funcionalidades que s� estar�o dispon�veis pelo emprego dos cookies. Os cookies s�o utilizados com o fim de conhecer os interesses, o comportamento e a demografia de quem visita ou � utilizador do site, e dessa forma, compreender melhor suas necessidades e interesses e dar-lhes um melhor servi�o ou prover-lhes informa��o relacionada. Tamb�m ser� usada a informa��o obtida por interm�dio dos cookies para analisar as p�ginas navegadas pelo visitante ou utilizador, as buscas realizadas, melhorar as iniciativas comerciais e promocionais, mostrar publicidade ou promo��es, banners de interesse, not�cias sobre o ZAPEAT, aperfei�oar a oferta de conte�dos e bens, personalizar esses conte�dos.

O ZAPEAT poder� adicionar cookies nos e-mails que envia para medir a efetividade das promo��es. Utiliza-se adicionalmente os cookies para que o utilizador n�o tenha que introduzir sua senha t�o freq�entemente durante uma se��o de navega��o, tamb�m para contabilizar e corroborar os registros, a atividade do utilizador e outros fins relacionados. A instala��o, perman�ncia e exist�ncia dos cookies no computador do utilizador dependem de sua exclusiva vontade e pode ser eliminado de seu computador quando o utilizador assim o deseje. Para saber como retirar os cookies do sistema � necess�rio revisar a se��o Ajuda (Help) do navegador. Adicionalmente, podem ser encontrados cookies ou outros sistemas similares instalados por terceiros em certas p�ginas do website do ZAPEAT. Por exemplo, ao navegar por uma p�gina criada por um utilizador pode ser que exista um cookie embutido ali. Fica esclarecido que estas pol�ticas cobrem a utiliza��o de cookies por este website e n�o a utiliza��o de cookies por parte de anunciantes. O ZAPEAT n�o tem controle do uso de cookies por terceiros.


GRATUIDADE


A utiliza��o do site � de forma gratuita.



PRIVACIDADE DA INFORMA��O


Toda informa��o ou dado pessoal, prestado pelo Usu�rio do ZAPEAT, � armazenada em servidores ou meios magn�ticos de alta seguran�a. ZAPEAT  tomar� todas as medidas poss�veis para manter a confidencialidade e a seguran�a descritas, por�m n�o responder� por preju�zo que possa ser derivado da viola��o dessas medidas por parte de terceiros que utilizem as redes p�blicas ou a internet, subvertendo os sistemas de seguran�a para acessar as informa��es de Usu�rios.

O Usu�rio expressamente autoriza que suas informa��es e dados pessoais sejam compartilhados pelo ZAPEAT com as demais marcas integrantes da INTERMEDIA ELETRONICA CORPORA��O LTDA.



RESPONSABILIDADES


O ZAPEAT n�o � intermediador de vendas, n�o possui quadro de profissionais a ofertar servi�os e n�o possui qualquer v�nculo trabalhista com os usu�rios cadastrados. De forma que funciona somente com a disponibiliza��o de um novo canal para divulga��o das promo��es dos estabelecimentos de alimentos.

O ZAPEAT n�o ser� respons�vel pelo efetivo cumprimento das obriga��es assumidas pelos estabelecimentos. O Usu�rio reconhece e aceita que ao realizar negocia��es com os fornecedores ou terceiros faz por sua conta e risco. Em nenhum caso ZAPEAT ser� respons�vel por qualquer dano e/ou preju�zo que o Usu�rio possa sofrer devido �s negocia��es realizadas ou n�o realizadas ap�s o processo de divulga��o das promo��es atrav�s do site e decorrentes da conduta dos estabelecimentos.

Estes Termos e Condi��es Gerais n�o geram nenhum contrato de sociedade, de mandato, franquia ou rela��o de trabalho entre ZAPEAT e o Usu�rio. O Usu�rio manifesta ci�ncia de que ZAPEAT n�o � parte de nenhuma transa��o, nem possui controle algum sobre a qualidade, seguran�a ou legalidade dos servi�os dos fornecedores. ZAPEAT sempre buscar� o registro de atividade dos fornecedores e se as empresas se apresentam ativas. ZAPEAT n�o pode assegurar o �xito de qualquer transa��o.

Caso seja identificado qualquer descumprimento da regra estabelecida entre o ZAPEAT e o estabelecimento, este ser� exclu�do imediatamente do quadro de parceiros para promo��es no ZAPEAT.COM.

ZAPEAT n�o ser� respons�vel pela correspond�ncia ou acordos que o Usu�rio realize com terceiros.


LEGISLA��O APLIC�VEL E FORO DE ELEI��O


Todos os itens destes Termos e Condi��es Gerais est�o regidos pelas leis vigentes na Rep�blica Federativa do Brasil. Para todos os assuntos referentes � interpreta��o e ao cumprimento deste Contrato, as partes se submetem ao Foro da Cidade de Salvador, exce��o feita a reclama��es apresentadas por usu�rios que se enquadrem no conceito legal de consumidores, que poder�o submeter �s mesmas ao foro de seu domic�lio.
				
				</textarea>
				
				<input type="checkbox" id="flag_aceito" /><p>Li e aceito</p>

	             <script type="text/javascript">
             		$('#nome_div').attr('placeholder','Nome').attr('autofocus','');
             		$('#email_div').attr('placeholder','E-mail');
             		$('#senha_div').attr('placeholder','Senha');
             		
             		$('#btnCadastrarUsuario').live('click', function () {
             	  	    return !isEmpty(new Array("#nome_div", "#email_div", "#senha_div")) && $('#flag_aceito').is(':checked');
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