<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<c:if test="${not empty promocaoFaces.carroChefeModel}">
	<div class="boxSubCat">
		<a href="promocao.jsf?carroChefeId=${promocaoFaces.carroChefeModel.id}">
			<h2>Carro-chefe</h2>
			<img src="${promocaoFaces.carroChefeModel.imagemThumbView}" alt="" title="" />
			<p class="titulo">${promocaoFaces.carroChefeModel.fornecedorModel.nomeFantasia}</p>
			<p class="categoria">${promocaoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.descricao}</p>
			<p class="item">${promocaoFaces.carroChefeModel.titulo}</p>
    	</a>
    	
    	<div class="votacao">
	       <a href="ranking.jsf?categoriaId=${promocaoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.id}&estabelecimentoId=${promocaoFaces.carroChefeModel.fornecedorModel.id}&indico=1" title="Indico" class="floatLeft"><span class="icons indicacaoRed"></span>Indico [${promocaoFaces.carroChefeModel.fornecedorModel.quantidadeIndicacoes}]</a>
	       <a href="" onclick="nao_indicar(${promocaoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.id}, ${promocaoFaces.carroChefeModel.fornecedorModel.id})" title="Não Indico" class="floatRight"><span class="icons naoindicacaoRed"></span>Não Indico</a>
		</div>
		 
	</div>
</c:if>