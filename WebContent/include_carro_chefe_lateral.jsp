<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>

<h:form>

	<c:if test="${not empty promocaoFaces.carroChefeModel}">

		<input type="hidden" name="estabelecimentoId" value="${promocaoFaces.carroChefeModel.fornecedorModel.id}" />
		
		<div class="boxSubCat">
			<a href="promocao.jsf?carroChefeId=${promocaoFaces.carroChefeModel.id}">
				<h2>Carro-chefe</h2>
				<img src="${promocaoFaces.carroChefeModel.imagemThumbView}" alt="" title="" />
				<p class="titulo">${promocaoFaces.carroChefeModel.fornecedorModel.nomeFantasia}</p>
				<p class="categoria">${promocaoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.descricao}</p>
				<p class="item">${promocaoFaces.carroChefeModel.titulo}</p>
	    	</a>
	    	
	    	<div class="votacao">
		       <h:commandLink action="#{indicacaoFaces.indicarComida}" styleClass="floatLeft"><span class="icons indicacaoRed"></span>Indico [${promocaoFaces.carroChefeModel.fornecedorModel.quantidadeIndicacoes}]</h:commandLink>
		       <a title="N�o indicar" onclick="nao_indicar(${promocaoFaces.carroChefeModel.fornecedorModel.categoriaPrincipal.id}, ${promocaoFaces.carroChefeModel.fornecedorModel.id})" class="linkRanking floatRight"><span class="icons naoindicacaoRed"></span> N�o indico</a>
			</div>
			 
		</div>
	</c:if>

</h:form>