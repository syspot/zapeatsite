<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<h:form>

	<c:if test="${not empty indexFaces.carroChefeModel}">

		<input type="hidden" name="estabelecimentoId" value="${indexFaces.carroChefeModel.fornecedorModel.id}" />
		
		<div class="boxSubCat">
			<a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&carroChefeId=${indexFaces.carroChefeModel.id}&estabelecimento_id=${indexFaces.carroChefeModel.fornecedorModel.id}">
				<h2>Carro-chefe</h2>
				<img src="${indexFaces.carroChefeModel.imagemThumbView}" alt="" title="" />
				<p class="titulo">${indexFaces.carroChefeModel.fornecedorModel.nomeFantasia}</p>
				<p class="categoria">${indexFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.descricao}</p>
				<p class="item">${indexFaces.carroChefeModel.titulo}</p>
	    	</a>
	    	
		</div>
	</c:if>

</h:form>