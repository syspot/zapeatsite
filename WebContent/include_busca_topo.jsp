<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<h:form prependId="false">
	<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
    <label>em<h:inputText id="info2" value="#{buscaFaces.localBuscado}"/><span id="btnInit" class="icons" ></span></label>
    <h:commandButton value="" action="#{buscaFaces.buscar}" />
</h:form>

<script src="js/jquery-1.8.2.js"></script>
<script src="js/jquery.ui.core.js"></script>
<script src="js/jquery.ui.widget.js"></script>
<script src="js/jquery.ui.position.js"></script>
<script src="js/jquery.ui.autocomplete.js"></script>

<script type="text/javascript">
  
	var availableTags = ${cidadeFaces.cidades};
	$( "#info2" ).autocomplete({
		source: availableTags
	});

</script>