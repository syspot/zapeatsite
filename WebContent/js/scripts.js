      $(document).ready(function() {
		$('#outrosDestaques > #listagem > li:even').css('background', '#CCE5FF');
		$('#principal ul:eq(0)').css('left','0px');
		$('#principal ul:eq(1)').css('left','-75px');
		$('#principal ul:eq(2)').css('left','-150px');
		$('#principal ul:eq(3)').css('left','-225px');
		$('#principal ul:eq(4)').css('right','-225px');
		$('#principal ul:eq(5)').css('right','-150px');
		$('#principal ul:eq(6)').css('right','-75px');
		$('#principal ul:eq(7)').css('right','0px');
	  })

  var map;
  function initialize() {
    var latlng = new google.maps.LatLng(-12.973393753658488, -38.51103549999999);
    var myOptions = {
      zoom: 13,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      disableDefaultUI: true
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    prepareGeolocation();
    doGeolocation();
  }

  function doGeolocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(positionSuccess, positionError);
    } else {
      positionError(-1);
    }
  }

  function positionError(err) {
    var msg;
    switch(err.code) {
      case err.UNKNOWN_ERROR:
        msg = "Impossível encontrar sua localização";
        break;
      case err.PERMISSION_DENINED:
        msg = "Permissão negada para encontrar sua localização";
        break;
      case err.POSITION_UNAVAILABLE:
        msg = "Sua localização é no momento, indefinida";
        break;
      case err.BREAK:
        msg = "Attempt to find location took too long";
        break;
      default:
        msg = "Seu browser não suporta detector de localização";
    }
    document.getElementById('info').innerHTML = msg;
  }

  function positionSuccess(position) {
    // Centre the map on the new location
    var coords = position.coords || position.coordinate || position;
    var latLng = new google.maps.LatLng(coords.latitude, coords.longitude);
    map.setCenter(latLng);
    map.setZoom(13);
    var marker = new google.maps.Marker({
	    map: map,
	    position: latLng,
	    title: 'Why, there you are!'
    });
    //document.getElementById('info').innerHTML = 'Looking for <b>' +
    //    coords.latitude + ', ' + coords.longitude + '</b>...';

    // And reverse geocode.
    (new google.maps.Geocoder()).geocode({latLng: latLng}, function(resp) {
		  var place = "You're around here somewhere!";
		  if (resp[0]) {
			  var bits = [];
			  for (var i = 0, I = resp[0].address_components.length; i < I; ++i) {
				  var component = resp[0].address_components[i];
				  //if (contains(component.types, 'political')) {
				  //if (contains(component.types, 'postal_code')) {
				  if (contains(component.types, 'locality')) {
				  //if (contains(component.types, 'country')) {
				  //if (contains(component.types, 'administrative_area_level_1')) {
					  bits.push('<b>' + component.long_name + '</b>');
					}
				}
				if (bits.length) {
					place = bits.join(' / ');
				}
				marker.setTitle(resp[0].formatted_address);
			}
			document.getElementById('info').innerHTML = place;
	  });
  }

  function contains(array, item) {
	  for (var i = 0, I = array.length; i < I; ++i) {
		  if (array[i] == item) return true;
		}
		return false;
	}

    $(document).ready(function(){
			$('a.modal').modal({
				closeClickOut:true,
				backgroundColor:"#fff"
		});
    });
