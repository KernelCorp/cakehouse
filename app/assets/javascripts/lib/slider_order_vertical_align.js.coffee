resize = ->
  slider_height = parseInt $('#slider').css('height')
#  order_height = parseInt $('#slider-order').css('height')
  $('#slider-order').css('top', (slider_height - 364)/2 )
ready = ->
  $(".bxslider").bxSlider
    onSliderLoad: ->
      resize()
      return
  $(window).resize resize
$(document).ready ready