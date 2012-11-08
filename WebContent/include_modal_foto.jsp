	<script type="text/javascript" src="js/jquery.fancybox.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css" media="screen" />

	<script type="text/javascript">
	
		$(document).ready(function() {
		
			$(".fotoEstab").fancybox({
		
				 padding: 0,
				 openEffect : 'elastic',
				 openSpeed  : 150,
				 closeEffect : 'elastic',
				 closeSpeed  : 150,
				 closeClick : true,
				 helpers : {
					 overlay : {
						 css : {
							 'background' : 'rgba(0,0,0,0.8)'
						 }
					 }
				 }
			 });
		
		});
	
	</script>