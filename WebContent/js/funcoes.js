function nao_indicar(estabelecimentoId){
	
	$("#estabelecimentoId").val(estabelecimentoId);
	
}

function indicar(categoriaId, estabelecimentoId){
	
	$("#categoriaId").val(categoriaId);
	$("#estabelecimentoId").val(estabelecimentoId);
	
	alert(estabelecimentoId);
	
}

function processarVoto(){
	
	var id = $("#id").val();
	var carroChefeId = $("#id").val();
	
	$("#idPagina").val(id);
	$("#idCarroChefe").val(carroChefeId);
	
}

function isEmpty(campos) {
    var aux = false;
    var retorno = false;
    for (var i = 0; i < campos.length; i++) {
    	if ($(campos[i]).val().trim() == "") {
            $(campos[i]).css('border-color', 'red');
            aux = true;
        } else {
            $(campos[i]).css('border-color', 'green');
            aux = false;
        }
        if (aux == true) {
            retorno = true;
        }
    }
    return retorno;
}

function isChecked(campo){
	
	var retorno = $(campo).is(':checked');
	
	if(!retorno){
		alert('\u00c9 necess\u00E1rio aceitar os termos e condi\u00E7\u00f5es gerais de uso');	
	}
	
	return retorno;
}

function validarEmail(campo){
	
	var retorno = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}$/i.test($(campo).val());
	 
	 if (!retorno) {
         alert('Email inv\u00E1lido');
     }
	 
	 return retorno;
	
}

