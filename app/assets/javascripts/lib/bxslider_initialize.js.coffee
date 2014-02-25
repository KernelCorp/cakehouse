$(window).load ->
  $(".bxslider").bxSlider (
    pager: false
    auto: true
    startSlide: 0
    pause: 4000
  )
  $("#feedback-slider").bxSlider (
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true
    maxSlides: 1
  )

return
