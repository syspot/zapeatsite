<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty estabelecimentoGeralFaces.estabelecimentos}">

	<div class="boxSubCat">
		<h2>Estabelecimentos</h2>
		<c:forEach items="${estabelecimentoGeralFaces.estabelecimentos}" var="estabelecimento">
	    	<div class="marca floatLeft">
	    		<a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${estabelecimento.id}" title="${estabelecimento.nomeFantasia}">
	    			<img src="${estabelecimento.logoMarcaView}" alt="" title="${estabelecimento.nomeFantasia}" />
	    		</a>
	    	</div>
	    </c:forEach>
	</div>

</c:if>