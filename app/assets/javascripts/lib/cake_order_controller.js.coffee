class CakeOrderController
  constructor: ->
    $('.order-cake').click @show_popup
    $('.modal-shadow').click @hide_popup
    return

  show_popup: ->
    $('.modal-shadow').show('slow')
    $('.modal-window').show('slow')
    return
  hide_popup: ->
    $('.modal-shadow').hide('slow')
    $('.modal-window').hide('slow')


ready = ->
  new CakeOrderController
  return
$(document).ready ready