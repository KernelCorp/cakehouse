ready = ->
  $('.inputs').submit ->
    $('#make-order').hide()
    $('#order-form-block').hide()
    $('#order-success').show()
    return true
$(document).ready ready