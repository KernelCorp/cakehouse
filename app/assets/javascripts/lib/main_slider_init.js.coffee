$(window).load ->
  $(".not_first_slide").removeClass ('not_first_slide')
  $("#main-slider-inner").bxSlider (
    pager: false
    auto: true
    stopAuto: false
    pause: 4000
    #Set vertical position of form on slider load.
    onSliderLoad: ->
      slider_height = parseInt $('#slider').css('height')
      $('#slider-order').css('top', (slider_height - 364)/2 )
      return
  )
  return

