ready = ->
  myMap = ''
  init = ->
    myMap = new ymaps.Map "map", {
      center: [55.0152, 82.9453],
      zoom: 16
    }
    myPlacemark = new ymaps.Placemark([55.0152, 82.94625], {} ,{
      iconImageHref: '/images/map-point.png'
      iconImageSize: [60, 84],
      iconImageOffset: [-40, -100]
    })
    myMap.geoObjects.add(myPlacemark)
    myMap.controls.add('zoomControl');
  if $('#map').length > 0
    ymaps.ready(init)
  return
$(document).ready ready