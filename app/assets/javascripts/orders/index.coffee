
$(document).on "ready page:loaded", ->
  mapCanvas = document.getElementById('map')
  lat = $("#order_lat").val()
  lng = $("#order_lng").val()
  mapOptions = 
    center: new google.maps.LatLng(55.7522222, 37.6155556)
    zoom: 13
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new (google.maps.Map)(mapCanvas, mapOptions)
  markers = []
  $('.geopositions').each (index, geoposition) ->
    geoposition = JSON.parse(geoposition.value)
    markers[index] = new (google.maps.Marker)(
      position: new google.maps.LatLng(geoposition.lat, geoposition.lng)
      map: map
      url: window.location.protocol + '//' + window.location.host + '/orders/' + geoposition.id
    )
  i = 0
  while i < markers.length
    google.maps.event.addListener markers[i], 'click', ->
      window.location.href = @url
      return
    i++

