<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty estabelecimentoFaces.carroChefeModel}">
	<div class="boxSubCat">
		<a href="promocao.jsf?carroChefeId=${estabelecimentoFaces.carroChefeModel.id}">
			<h2>Carro-chefe</h2>
			<img src="${estabelecimentoFaces.carroChefeModel.imagemThumbView}" alt="" title="" />
			<p class="titulo">${estabelecimentoFaces.carroChefeModel.fornecedorModel.nomeFantasia}</p>
			<p class="categoria">${estabelecimentoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.descricao}</p>
			<p class="item">${estabelecimentoFaces.carroChefeModel.titulo}</p>
    	</a>
    	
	</div>
</c:if>
