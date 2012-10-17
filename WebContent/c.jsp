<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>

<f:view>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery.jcountdown1.3.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function() {
			
	//contando tempo restante a partir de data determinada
	$("#time2").countdown({
		date: "october 17, 2012, 16:03", //Counting TO a date
		//htmlTemplate: "%{h} <span class=\"cd-time\">hours</span> %{m} <span class=\"cd-time\">mins</span> %{s} <span class=\"cd-time\">sec</span>",
		
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
	
	//$("#time2").countdown('pause');
	
	//$("#time2").countdown('resume');
	
	
	/*
	$("#time2").countdown({
		date: "may 1, 2011",
		direction: 'up', //Counting FROM a date
		leadingZero: true
	});
	*/

});
</script>

<script src="js/jquery.countdown-pt-BR.js" type="text/javascript"></script>
</head>

<body>
<p>contando tempo passado a partir de data determinada</p>
<p id="time" class="time"></p>


<p>contando tempo restante a partir de data determinada</p>
<p id="time2" class="time"></p>

<input type="button" value="clique aqui" onclick="alert(new Date());"></input>

</body>
</html>
</f:view>