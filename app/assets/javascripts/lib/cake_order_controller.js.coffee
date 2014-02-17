class CakeOrderController
  constructor: ->
    $('.order-cake').click @show_popup
    $('.modal-shadow').click @hide_popup
#    $('#new_cake_order').bind 'ajax:success', @ajax_success
#
#    $('#new_cake_order').bind 'ajax:error', @ajax_error
    $('.close-modal').click @hide_popup
    $('#new_cake_order').submit @form_submit
    return

  form_submit: (event)=>
    data = cake_order: {
      customer: {
        name: $('#cake_order_customer_name').val()
        email: $('#cake_order_customer_email').val()
        delivery: $('#cake_order_customer_delivery').val()
      }

      photo: $('#cake_order_photo').val()
      stuff: $('#cake_order_stuff').val()
    }
    res = $.ajax {
      type: 'post'
      url: '/cake_orders'
      data: data
      dataType: 'json'
      async: false
      success: @ajax_success
      error: @ajax_error
    }
    if res.status == '200'
      CakeOrderController.ajax_success()
    else
      CakeOrderController.ajax_error()

    return false

  @ajax_success: ()->
    $(this).parent().hide('slow')
    $('#cake-order-success').show('slow')
    $('#cake-order-success').addClass('visible')
    return false

  @ajax_error: ()->
    $('.message-wrap').show('slow')
    $('.message-wrap').addClass('visible')
    return false

  show_popup: ->
    $('.modal-shadow').show('slow')
    $('.modal-window').show('slow')
    $('#new_cake_order input[type=text]').val('')
    $('#cake_order_stuff').val($(this).data('stuff'))
    $('.modal-window #order-form-block').show()
    $('#cake-order-success').hide('slow')
    $('#cake-order-success').removeClass('visible')
    $('.message-wrap').hide('slow')
    $('.message-wrap').removeClass('visible')
    return
  hide_popup: ->
    $('.modal-shadow').hide('slow')
    $('.modal-window').hide('slow')




ready = ->
  new CakeOrderController
  return
$(document).ready ready