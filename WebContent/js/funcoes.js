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