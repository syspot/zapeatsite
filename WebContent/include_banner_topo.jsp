<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<h1>
	<h:outputLink value="#{facesContext.externalContext.requestContextPath}/" title="Página Inicial">
		<h:graphicImage value="img/marca.png" />
	</h:outputLink>	
</h1>
<div class="superbanner">
	<a href="${bannerFaces.bannerTopo.url}">
		<img src="${bannerFaces.bannerTopo.imagemSuperiorGrandeView}" alt="" title="" />
	</a>
</div>