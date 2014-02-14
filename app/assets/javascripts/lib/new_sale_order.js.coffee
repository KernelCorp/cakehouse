ready = ->
  $('#new_sale_order').bind 'ajax:success', ->
    $(this).parent().hide('slow')
    $('#order-success').show('slow')
    return true

  $('#new_sale_order').bind 'ajax:error', ->
    $('.message-wrap').show('slow')
    return true

$(document).ready ready