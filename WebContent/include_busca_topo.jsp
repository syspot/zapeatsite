<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://primefaces.prime.com.tr/ui" prefix="p" %>

<h:form>
	<label>Buscar<h:inputText value="#{buscaFaces.termoBuscado}"/></label>
    <label>em
    
    <p:autoComplete id="info" value="#{buscaFaces.localBuscado}" completeMethod="#{buscaFaces.completeCidades}" />
                        
    <span id="btnInit" class="icons" ></span></label>
    <h:commandButton value="" action="#{buscaFaces.buscar}" />
</h:form>