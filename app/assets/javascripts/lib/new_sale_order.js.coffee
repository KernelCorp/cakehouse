ready = ->
  $('#new_sale_order').bind 'ajax:success', ->
    $(this).parent().hide('slow')
    $('#sale-order-success').show('slow')
    $('#sale-order-success').addClass('visible')
    return true

  $('#new_sale_order').bind 'ajax:error', ->
    $('.message-wrap').show('slow')
    return true

$(document).ready ready