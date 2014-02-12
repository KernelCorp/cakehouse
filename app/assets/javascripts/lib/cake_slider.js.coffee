ready = ->
  $("#cake-slider-inner").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
    maxSlides: 1
  )
$(document).ready ready