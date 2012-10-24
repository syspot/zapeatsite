function nao_indicar(categoriaId, estabelecimentoId){
	
	$("#categoriaId").val(categoriaId);
	$("#estabelecimentoId").val(estabelecimentoId);
	
}

function processarVoto(){
	
	var id = $("#id").val();
	var carroChefeId = $("#id").val();
	
	$("#idPagina").val(id);
	$("#idCarroChefe").val(carroChefeId);
	
}