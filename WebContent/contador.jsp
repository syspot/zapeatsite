<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>

<f:view>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://pluginjquery.com.br/labs/countdown1.3/script/jquery.jcountdown1.3.js" type="text/javascript"></script>
<script src="js/jquery.countdown-pt-BR.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {

	//contando tempo passado a partir de data determinada
	$("#time").countdown({
		date: "october 16, 2012", //Counting TO a date
		htmlTemplate: "%{h} <span class=\"cd-time\">:</span> %{m} <span class=\"cd-time\">:</span> %{s} <span class=\"cd-time\"></span>",
		//date: "july 1, 2011 19:24", //Counting TO a date
		onChange: function( event, timer ){
		},
		onComplete: function( event ){

			$(this).html("Completo");
		},
		leadingZero: true,
		direction: "up"
	});

	//contando tempo restante a partir de data determinada
	$("#tempo").countdown({
		date: "${sessionScope.promocaoHora.dataFormatada}", //Counting TO a date
		htmlTemplate: "%{h} <span class=\"cd-time\">:</span> %{m} <span class=\"cd-time\">:</span> %{s} <span class=\"cd-time\"></span>",
		
		onChange: function( event, timer ){



		},
		onComplete: function( event ){

			$(this).html("Finalizado");
		},
		onPause: function( event, timer ){

			$(this).html("Pause");
		},
		onResume: function( event ){

			$(this).html("Resumed");
		},
		leadingZero: true
	});

});
</script>
</head>

<body>

<p id="tempo" class="time"></p>

</body>
</html>
</f:view>