<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty comentarioFaces.comentarioModel.id}">
   <div class="boxSubCat">
   	   <h2>Quem Indica</h2>
       <span class="imgDestaque-peq posRel">
       	   <a href="estabelecimento.jsf?cidade=${cidadeFaces.cidadeSelecionada}&id=${comentarioFaces.comentarioModel.fornecedorModel.id}" title="">
               <img src="${comentarioFaces.comentarioModel.fornecedorModel.imagemThumbView}" alt="" title="" />
               <p class="tituloIndica">${comentarioFaces.comentarioModel.fornecedorModel.nomeFantasia}</p>
           </a>
       </span>
       <c:if test="${!empty comentarioFaces.comentarioModel.id}">
       <p class="comment">${comentarioFaces.comentarioModel.descricao}</p>
       </c:if>
       <p class="autor">${comentarioFaces.comentarioModel.usuarioModel.nome}</p>
   </div>
</c:if>