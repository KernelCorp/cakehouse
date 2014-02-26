$(window).load ->
  $(".not_first_slide").removeClass ('not_first_slide')
  $("#main-slider-inner").bxSlider (
    pager: false
    auto: true
    pause: 4000
  )
  return

