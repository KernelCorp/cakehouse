ready = ->
  $('#new_sale_order').submit ->
    $(this).parent().hide()
    $('#order-success').show()
    return true
$(document).ready ready