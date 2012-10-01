<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="p" uri="http://primefaces.prime.com.tr/ui" %>



<h:form>
	<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
    <label>em<p:autoComplete value="#{buscaFaces.termoBuscado}" completeMethod="#{buscaFaces.completeCidades}"></p:autoComplete><span id="btnInit" class="icons" ></span></label>
    <h:commandButton value="" action="#{buscaFaces.buscar}" />
</h:form>