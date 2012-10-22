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
			<!-- <p><span class="precoDe">De: R$789,00</span>&nbsp;&nbsp;<span class="precoPor">Por: R$254,00</span>  -->
			
            
    	</a>
    	
    	<div class="votacao">
			<p><a href="carro.jsf?estabelecimentoId=${promocaoFaces.carroChefeModel.fornecedorModel.id}&indico=1" title=""><span class="icons indicacaoRed"></span> Indico [${promocaoFaces.carroChefeModel.fornecedorModel.quantidadeIndicacoes}]</a></p>
			<p><a title="" class="linkRanking"><span class="icons naoindicacaoRed"></span> Não indico</a></p>
	       <a href="" title="Indico" class="floatLeft"><span class="icons indicacaoRed"></span>Indico [3]</a>
	       <a href="" title="Não Indico" class="floatRight"><span class="icons naoindicacaoRed"></span>Não Indico</a>
		</div>
		 
	</div>
</c:if>