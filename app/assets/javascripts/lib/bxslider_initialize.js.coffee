ready = ->
  $(".bxslider").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
  )
  $("#feedback-slider").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
    maxSlides: 1
  )
$(document).ready ready