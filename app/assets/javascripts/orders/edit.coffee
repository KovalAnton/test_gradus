
$(document).on "ready page:loaded", ->
  mapCanvas = document.getElementById('map')
  lat = $("#order_lat").val()
  lng = $("#order_lng").val()
  myLatLng =  if(lat & lng)
                new google.maps.LatLng(lat, lng)
              else
                new google.maps.LatLng(55.7522222, 37.6155556)
  mapOptions = 
    center: myLatLng
    zoom: 8
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new (google.maps.Map)(mapCanvas, mapOptions)
  marker = new (google.maps.Marker)(
    position: myLatLng
    map: map
    draggable: true
  )

  google.maps.event.addListener marker, 'drag', ->
    document.getElementById('order_lat').value = marker.position.lat()
    document.getElementById('order_lng').value = marker.position.lng()

  google.maps.event.addListener map, 'click', (event) ->
    lat = event.latLng.lat()
    lng = event.latLng.lng()
    marker.setPosition(new google.maps.LatLng(lat,lng))
    $("#order_lat").val(lat)
    $("#order_lng").val(lng)
