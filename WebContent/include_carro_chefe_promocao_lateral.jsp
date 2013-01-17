<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty promocaoFaces.carroChefeModel}">
	<div class="boxSubCat">
		<a href="promocao.jsf?cidade=${cidadeFaces.cidadeSelecionada}&carroChefeId=${promocaoFaces.carroChefeModel.id}">
			<h2>Carro-chefe</h2>
			<img src="${promocaoFaces.carroChefeModel.imagemThumbView}" width="180" height="109" />
			<p class="titulo">${promocaoFaces.carroChefeModel.fornecedorModel.nomeFantasia}</p>
			<p class="categoria">${promocaoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.descricao}</p>
			<p class="item">${promocaoFaces.carroChefeModel.titulo}</p>
    	</a>
    	
    	
		 
	</div>
</c:if>