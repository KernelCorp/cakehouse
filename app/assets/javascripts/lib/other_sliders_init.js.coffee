ready = ->
  $("#cake-slider-inner").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
  )
  $("#feedback-slider").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
  )
$(document).ready ready