ready = ->
  $("#cake-slider-inner").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
    slideWidth: 1100
    slideHeight: 500
    maxSlides: 1
  )
$(document).ready ready