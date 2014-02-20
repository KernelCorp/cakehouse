ready = ->
  $(".bxslider").bxSlider (
    pager: false
    auto: true
    pause: 4000
    delay: 4000
  )
  $("#feedback-slider").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
    maxSlides: 1
  )
$(document).ready ready