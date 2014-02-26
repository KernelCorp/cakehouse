resizing = ->
  slider_height = parseInt $('#slider').css('height')
  $('#slider-order').css('top', (slider_height - 364)/2 )

resize = ->
  clearTimeout(id)
  id = setTimeout(resizing,500)

ready = ->
  $(window).resize resize
$(document).ready ready