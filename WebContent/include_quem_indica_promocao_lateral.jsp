<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty promocaoFaces.comentarioModel}">
   <div class="boxSubCat">
   	   <h2>Quem Indica</h2>
       <span class="imgDestaque-peq posRel">
       	   <a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${promocaoFaces.comentarioModel.fornecedorModel.id}" title="">
               <img src="${promocaoFaces.comentarioModel.fornecedorModel.imagemThumbView}" alt="" title="" />
               <p class="tituloIndica">${promocaoFaces.comentarioModel.fornecedorModel.nomeFantasia}</p>
           </a>
       </span>
       <c:if test="${!empty promocaoFaces.comentarioModel.id}">
       <p class="comment">${promocaoFaces.comentarioModel.descricao}</p>
       </c:if>
       <p class="autor">${promocaoFaces.comentarioModel.usuarioModel.nome}</p>
   </div>
</c:if>