<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://myfaces.apache.org/tomahawk"%>

<f:view>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
	<%@ include file="/head.jsp" %>
</head>

<body>

	<!-- COMECA TOPO -->
	<%@ include file="/topo.jsp" %>

<!-- COMECA CENTRAL -->
<div id="central">
	<!-- COMECA CONTEUDO -->
	<div id="conteudo">
    
    	<!-- COMECA COLUNA PRINCIPAL  -->
    	<div id="conteudoRanking">
        	<div id="tituloSessao">
            	<img src="${rankingFaces.categoriaModel.imagemView}" class="floatLeftMargin4" />
            	<h2>Sobre o Zapeat</h2>
                <p>Sobre</p>
            </div>
            
            <div class="conteudoSobre">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sodales tortor ac dolor placerat at rhoncus lorem consectetur. Praesent ut orci consectetur est auctor pellentesque. Fusce ullamcorper, neque ac molestie mattis, odio risus sollicitudin neque, et ornare leo odio non purus. Mauris adipiscing mauris quis velit pellentesque mollis. Donec pellentesque dignissim erat, eget sodales enim tincidunt at. Aliquam ut velit dolor. Suspendisse consectetur porta nibh, auctor consectetur nisi pulvinar at. Duis at tincidunt tellus. Curabitur nec lacus sed neque luctus dapibus eget sed est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi at diam dui, in elementum lectus. Cras in urna non mauris ornare pharetra.</p>
                
                <p>Sed eu nibh augue. Fusce in sem nec augue aliquet mollis in et mauris. Morbi facilisis ultricies imperdiet. Suspendisse id nulla a dui convallis viverra eu eu quam. Aliquam nisi mi, tempus quis vulputate et, gravida in enim. Ut vehicula diam eu urna ullamcorper consequat. Suspendisse lobortis felis in ligula imperdiet porta.</p>
                
                <p>Nam commodo est ac diam interdum at consectetur eros semper. Cras nec erat erat, quis egestas elit. Aliquam vitae eleifend neque. Aliquam erat volutpat. Mauris quis dolor eget augue rutrum vulputate ac tempus diam. Donec cursus varius dolor non facilisis. Vestibulum gravida eleifend turpis. Suspendisse consequat ornare est sit amet blandit. Ut sagittis dui ultrices lectus sodales sagittis. Pellentesque quis accumsan risus. Suspendisse feugiat interdum euismod. Vestibulum eget dignissim libero. Aenean id enim nec arcu varius commodo eu vel erat. Integer porttitor purus eu sapien ullamcorper auctor. Morbi purus sapien, ultricies euismod pretium id, tincidunt a nisi. Morbi eu leo tortor, vitae porttitor purus.</p>
                
                <p>Nam mauris ante, feugiat eget adipiscing ac, varius ut nunc. Sed vitae ipsum nec nibh semper consequat. Nullam accumsan sodales mi ac laoreet. Praesent dictum facilisis urna, at pulvinar nibh porta in. Ut tempor eros ac velit bibendum facilisis. Nam id orci elit. Mauris gravida orci sed tellus euismod placerat facilisis sem tristique. Donec quis quam diam. Proin euismod felis nec arcu imperdiet sed tempus ipsum ullamcorper. Integer tincidunt elit eu elit condimentum imperdiet.</p>
                
                <p>Sed congue semper euismod. Ut aliquam orci augue. Donec bibendum pulvinar ligula, at bibendum lacus placerat quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Maecenas non neque sapien, eget ultricies ipsum. Suspendisse pulvinar eleifend nisl eu blandit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed pharetra euismod neque et pellentesque. Vivamus fermentum facilisis blandit. Mauris sollicitudin semper lectus et feugiat. Nunc dolor risus, congue vitae placerat in, vulputate in velit. Vivamus fringilla lacinia pharetra. Suspendisse et massa sit amet turpis aliquam dapibus vitae nec est. Vestibulum gravida dolor vitae leo cursus rutrum. Proin eget metus nisi, interdum faucibus velit. </p>
            
            </div>
            
        </div>
        
        <!-- COMECA COLUNA DIREITA -->
        <div id="dir">
        
        	<div class="boxSubCat">
            	<img src="img/app.jpg" alt="banner para download app" title="Baixe o Aplicativo" />
            </div>
            
        </div>
    </div>
    <!-- TERMINA CONTEUDO -->
</div>
	
	<!-- TERMINA CENTRAL -->
	<%@ include file="/rodape.jsp" %>


	

</body>
</html>
</f:view>
