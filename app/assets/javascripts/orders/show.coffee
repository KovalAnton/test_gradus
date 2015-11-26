
$(document).on "ready", ->
  mapCanvas = document.getElementById('map')
  lat = $("#order_lat").val()
  lng = $("#order_lng").val()
  myLatLng =  if(lat & lng)
                new google.maps.LatLng(lat, lng)
              else
                new google.maps.LatLng(55.7522222, 37.6155556)
  mapOptions = 
    center: myLatLng
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new (google.maps.Map)(mapCanvas, mapOptions)
  marker = new (google.maps.Marker)(
    position: myLatLng
    map: map
  )
