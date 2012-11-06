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
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/index.jsf?cidade=#{cidadeFaces.cidadeSelecionada}" title="Página Inicial">
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

				<h:inputText tabindex="100" required="true" id="nome_div" maxlength="100" value="#{cadastroFaces.usuarioModel.nome}"/>

				<h:inputText tabindex="101" required="true" id="email_div" maxlength="100" value="#{cadastroFaces.usuarioModel.email}"/>

				<h:inputSecret tabindex="102" required="true" id="senha_div" maxlength="100" value="#{cadastroFaces.usuarioModel.senha}" redisplay="true"/>
				
				<textarea name="comentario" rows="3" cols="41">
				Termos e Condições Gerais de uso do site ZAPEAT.COM

Estes Termos e Condições Gerais aplicam-se ao uso dos serviços oferecidos por INTERMÉDIA ELETRÔNICA CORPORAÇÃO LTDA, empresa devidamente inscrita no CNPJ/MF sob o nº 13.691.256/0001-34, usuária da marca ZAPEAT. Qualquer pessoa, doravante nominada USUÁRIO, que pretenda utilizar os serviços do site www.zapeat.com ou www.zapeat.com.br deverá aceitar os Termos e Condições Gerais, e todas as demais políticas e princípios que o regem. 
A ACEITAÇÃO E ENTENDIMENTO DESTES TERMOS E CONDIÇÕES GERAIS DE USO PELO USUÁRIO SÃO ABSOLUTAMENTE INDISPENSÁVEIS PARA A CONCLUSÃO DO CADASTRO E POSTERIOR UTILIZAÇÃO DO SITE ZAPEAT.COM.BR E DE SEUS SERVIÇOS.

O usuário deverá ler, certificar-se de haver entendido e aceitar todas as condições estabelecidas nos Termos e Condições Gerais, assim como nos demais documentos incorporados aos mesmos por referência, antes de seu cadastro como Usuário do ZAPEAT.COM.BR



OBJETO


O serviço objeto do presente Termos e Condições Gerais de Uso consistem em ofertar ao Usuário uma plataforma desenvolvida exclusivamente como um instrumento de busca de promoções e divulgação de restaurantes, bares, shows e similares. O ZAPEAT, portanto, possibilita aos usuários receberem ou buscarem de forma ativa promoções divulgadas exclusivamente por responsabilidade dos estabelecimentos cadastrados, funcionando independentemente, agindo o site como um facilitador na divulgação, permitindo que eles negociem entre si diretamente, sem sua intervenção na finalização das vendas, não participando da realização comercial dos mesmos.



CADASTRO


O cadastramento no site ZAPEAT é gratuito, sendo necessário que o USUÁRIO seja pessoa física, devendo indicar em campo específico o e-mail preferencial seguido da senha de acesso. O login será o e-mail cadastrado.

Não se permitirá a manutenção de mais de um cadastro para um mesmo e-mail.

O USUÁRIO será o único responsável pelas operações efetuadas em sua CONTA, que apenas poderá ser acessada através de LOGIN e senha pessoal intransferível. O USUÁRIO compromete-se a não informar a terceiros os dados da sua CONTA, responsabilizando-se civil e criminalmente pelo seu uso indevido ou por quaisquer práticas ilícitas que interfiram, manipulem ou prejudiquem o funcionamento do site ou das informações nele contidas.


MODIFICAÇÕES DOS TERMOS E CONDIÇÕES GERAIS

O ZAPEAT poderá alterar, a qualquer tempo, estes Termos e Condições Gerais, visando seu aprimoramento e melhoria dos serviços prestados. Os novos Termos e Condições entrarão em vigor no mesmo dia da publicação no site. No prazo de 15 (cinco) dias contados a partir da publicação das modificações, o Usuário deverá comunicar-se por e-mail caso não concorde com os termos alterados. Nesse caso, o vínculo contratual deixará de existir. Não havendo manifestação no prazo estipulado, entender-se-á que o Usuário aceitou tacitamente os novos Termos e Condições e o contrato continuará vinculando as partes.


DOS TERMOS UTILIZADOS E SUAS DEFINIÇÕES

Usuário: qualquer pessoa física devidamente cadastrada.
Promoção da Hora: promoção publicada pelo estabelecimento por período de 01 hora, devidamente registrado o inicio da publicação.

Promoção do Dia: promoção publicada pelo estabelecimento por período de 01 dia, devidamente registrado o inicio da publicação.

Promoção da Semana: promoção publicada pelo estabelecimento por período de 01 semana, devidamente registrado o inicio da publicação.

Carro Chefe: publicação de prato típico ou destaque do estabelecimento.

Ranking: posicionamento do estabelecimento conforme avaliações dos usuários.



CONDIÇÕES GERAIS.


O ZAPEAT é uma plataforma criada para facilitar a divulgação de promoções de estabelecimentos de alimentos, como restaurantes e bares, para o público em geral. O site não se responsabiliza por substituição, promoções, intermediação de venda, capacidade logística, estoque, envio, recebimento, pagamento ou qualquer negócio que fuja do objeto deste termo de contrato.

A publicação das promoções é de inteira responsabilidade dos estabelecimentos alimentícios, não tendo o ZAPEAT qualquer responsabilidade sobre efetivação da venda, entrega do produto ou publicação enganosa ao consumidor.

Não nos responsabilizamos, sob quaisquer circunstâncias, por eventuais prejuízos decorrentes de falhas técnicas, operacionais, de estrutura de comunicação ou de acesso ao sistema, que impossibilitem ou dificultem a participação do USUÁRIO. Efetuamos a manutenção constante de nossos serviços, mas não garantimos possíveis dificuldades ou falhas de conexão com os nossos servidores, pois o sistema está sujeito à interferência de fatores externos. Da mesma forma, nas situações de contratação dos serviços de mensagem por celular, não garantimos o completo envio das mensagens, sendo de inteira responsabilidade das concessionárias telefônicas este serviço.

A promoção será garantida pelo estabelecimento durante o período discriminado da promoção, contando desde sua publicação no sistema até o término do prazo pré-estabelecido.

O layout do sistema, bem como supressão ou acréscimo de categorias e produtos ou quaisquer alterações que o ZAPEAT achar necessário será realizado sem prévia alteração dos usuários, bastando apenas que ocorra um comunicado no site num período de 15 dias anterior a modificação implantada.



COOKIES


O utilizador e o visitante do site do ZAPEAT manifesta conhecer e aceitar que poderá ser utilizado um sistema de monitoramento mediante a utilização de cookies. Os cookies são pequenos arquivos que se instalam no disco rígido, comum a duração limitada de tempo que ajudam a personalizar os serviços. Também serão ofertadas algumas funcionalidades que só estarão disponíveis pelo emprego dos cookies. Os cookies são utilizados com o fim de conhecer os interesses, o comportamento e a demografia de quem visita ou é utilizador do site, e dessa forma, compreender melhor suas necessidades e interesses e dar-lhes um melhor serviço ou prover-lhes informação relacionada. Também será usada a informação obtida por intermédio dos cookies para analisar as páginas navegadas pelo visitante ou utilizador, as buscas realizadas, melhorar as iniciativas comerciais e promocionais, mostrar publicidade ou promoções, banners de interesse, notícias sobre o ZAPEAT, aperfeiçoar a oferta de conteúdos e bens, personalizar esses conteúdos.

O ZAPEAT poderá adicionar cookies nos e-mails que envia para medir a efetividade das promoções. Utiliza-se adicionalmente os cookies para que o utilizador não tenha que introduzir sua senha tão freqüentemente durante uma seção de navegação, também para contabilizar e corroborar os registros, a atividade do utilizador e outros fins relacionados. A instalação, permanência e existência dos cookies no computador do utilizador dependem de sua exclusiva vontade e pode ser eliminado de seu computador quando o utilizador assim o deseje. Para saber como retirar os cookies do sistema é necessário revisar a seção Ajuda (Help) do navegador. Adicionalmente, podem ser encontrados cookies ou outros sistemas similares instalados por terceiros em certas páginas do website do ZAPEAT. Por exemplo, ao navegar por uma página criada por um utilizador pode ser que exista um cookie embutido ali. Fica esclarecido que estas políticas cobrem a utilização de cookies por este website e não a utilização de cookies por parte de anunciantes. O ZAPEAT não tem controle do uso de cookies por terceiros.


GRATUIDADE


A utilização do site é de forma gratuita.



PRIVACIDADE DA INFORMAÇÃO


Toda informação ou dado pessoal, prestado pelo Usuário do ZAPEAT, é armazenada em servidores ou meios magnéticos de alta segurança. ZAPEAT  tomará todas as medidas possíveis para manter a confidencialidade e a segurança descritas, porém não responderá por prejuízo que possa ser derivado da violação dessas medidas por parte de terceiros que utilizem as redes públicas ou a internet, subvertendo os sistemas de segurança para acessar as informações de Usuários.

O Usuário expressamente autoriza que suas informações e dados pessoais sejam compartilhados pelo ZAPEAT com as demais marcas integrantes da INTERMEDIA ELETRONICA CORPORAÇÃO LTDA.



RESPONSABILIDADES


O ZAPEAT não é intermediador de vendas, não possui quadro de profissionais a ofertar serviços e não possui qualquer vínculo trabalhista com os usuários cadastrados. De forma que funciona somente com a disponibilização de um novo canal para divulgação das promoções dos estabelecimentos de alimentos.

O ZAPEAT não será responsável pelo efetivo cumprimento das obrigações assumidas pelos estabelecimentos. O Usuário reconhece e aceita que ao realizar negociações com os fornecedores ou terceiros faz por sua conta e risco. Em nenhum caso ZAPEAT será responsável por qualquer dano e/ou prejuízo que o Usuário possa sofrer devido às negociações realizadas ou não realizadas após o processo de divulgação das promoções através do site e decorrentes da conduta dos estabelecimentos.

Estes Termos e Condições Gerais não geram nenhum contrato de sociedade, de mandato, franquia ou relação de trabalho entre ZAPEAT e o Usuário. O Usuário manifesta ciência de que ZAPEAT não é parte de nenhuma transação, nem possui controle algum sobre a qualidade, segurança ou legalidade dos serviços dos fornecedores. ZAPEAT sempre buscará o registro de atividade dos fornecedores e se as empresas se apresentam ativas. ZAPEAT não pode assegurar o êxito de qualquer transação.

Caso seja identificado qualquer descumprimento da regra estabelecida entre o ZAPEAT e o estabelecimento, este será excluído imediatamente do quadro de parceiros para promoções no ZAPEAT.COM.

ZAPEAT não será responsável pela correspondência ou acordos que o Usuário realize com terceiros.


LEGISLAÇÃO APLICÁVEL E FORO DE ELEIÇÃO


Todos os itens destes Termos e Condições Gerais estão regidos pelas leis vigentes na República Federativa do Brasil. Para todos os assuntos referentes à interpretação e ao cumprimento deste Contrato, as partes se submetem ao Foro da Cidade de Salvador, exceção feita a reclamações apresentadas por usuários que se enquadrem no conceito legal de consumidores, que poderão submeter às mesmas ao foro de seu domicílio.
				
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