<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<h:form>
	<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
    <label>em<h:inputText id="info" value="#{buscaFaces.localBuscado}"/><span id="btnInit" class="icons" ></span></label>
    <h:commandButton value="" action="#{buscaFaces.buscar}" />
</h:form>