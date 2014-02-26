class SliderOrderController
  constructor: ->
    $('#slider_cake_order').submit @form_submit
    return

  form_submit: (event)=>
    formData = new FormData($('#slider_cake_order')[0])
    res = $.ajax {
      type: 'post'
      url: '/cake_orders'
      data: formData
      dataType: 'json'
      async: false
      success: @ajax_success
      error: @ajax_error
      cache: false
      contentType: false
      processData: false
    }
    if res.status == 200
      SliderOrderController.ajax_success()
    else
      SliderOrderController.ajax_error()
    return false

  @ajax_success: ()->
    $('#order-form-block').hide('slow')
    $('#slider-order-success').show('slow')
    $('#slider-order-success').addClass('visible')
    return false

  @ajax_error: ()->
    $('#slider-order-error').show('slow')
    $('#slider-order-error').addClass('visible')
    return false

ready = ->
  new SliderOrderController
  return
$(document).ready ready