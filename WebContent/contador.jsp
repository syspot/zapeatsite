<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://pluginjquery.com.br/labs/countdown1.3/script/jquery.jcountdown1.3.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {

	//contando tempo passado a partir de data determinada
	$("#time").countdown({
		date: new Date(), //Counting TO a date
		//htmlTemplate: "%{h} <span class=\"cd-time\">hours</span> %{m} <span class=\"cd-time\">mins</span> %{s} <span class=\"cd-time\">sec</span>",
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
	$("#time2").countdown({
		date: "2012-10-20 17:23:47.0",
		//htmlTemplate: "%{h} <span class=\"cd-time\">hours</span> %{m} <span class=\"cd-time\">mins</span> %{s} <span class=\"cd-time\">sec</span>",
		offset: 1,
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
</head>

<body>
<p>contando tempo passado a partir de data determinada</p>
<p id="time" class="time"></p>


<p>contando tempo restante a partir de data determinada</p>
<p id="time2" class="time"></p>
</body>
</html>