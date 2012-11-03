<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty estabelecimentoFaces.comentarioModel}">
   <div class="boxSubCat">
   	   <h2>Quem Indica</h2>
       <span class="imgDestaque-peq posRel">
       	   <a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${estabelecimentoFaces.comentarioModel.fornecedorModel.id}" title="">
               <img src="${estabelecimentoFaces.comentarioModel.fornecedorModel.imagemThumbView}" alt="" title="" />
               <p class="tituloIndica">${estabelecimentoFaces.comentarioModel.fornecedorModel.nomeFantasia}</p>
           </a>
       </span>
       <c:if test="${!empty estabelecimentoFaces.comentarioModel.id}">
       <p class="comment">${estabelecimentoFaces.comentarioModel.descricao}</p>
       </c:if>
       <p class="autor">${estabelecimentoFaces.comentarioModel.usuarioModel.nome}</p>
   </div>
</c:if>