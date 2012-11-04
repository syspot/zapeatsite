<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty bannerFaces.bannerLateral}">
	<div class="boxSubCat">
		<div class="banner">
			<a href="${bannerFaces.bannerLateral.url}">
				<img src="${bannerFaces.bannerLateral.imagemLateralView}" alt="" title="" />
			</a>
		</div>
	</div>
</c:if>