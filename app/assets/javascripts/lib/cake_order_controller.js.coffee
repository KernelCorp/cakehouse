class CakeOrderController
  constructor: ->
    $('.order-cake').click @show_popup
    $('.modal-shadow').click @hide_popup
    $('#new_cake_order').bind 'ajax:success', ->
      $(this).parent().hide('slow')
      $('#order-success').show('slow')
      return true

    $('#new_cake_order').bind 'ajax:error', ->
      $('.message-wrap').show('slow')
      $('.message-wrap').addClass('visible')
      return true
    $('.close-modal').click @hide_popup
    return

  show_popup: ->
    $('.modal-shadow').show('slow')
    $('.modal-window').show('slow')
    $('#cake_order_stuff').val = $(this).data('stuff')
    $('.modal-window #order-form-block').show()
    $('#order-success').hide('slow')
    return
  hide_popup: ->
    $('.modal-shadow').hide('slow')
    $('.modal-window').hide('slow')


ready = ->
  new CakeOrderController
  return
$(document).ready ready