class CakeOrderController
  constructor: ->
    $('.order-cake').click @show_popup
    $('.modal-shadow').click @hide_popup
    $('.close-modal').click @hide_popup
    $('#new_cake_order').submit @form_submit
    return

  form_submit: (event)=>
    formData = new FormData($('#new_cake_order')[0])
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
      CakeOrderController.ajax_success()
    else
      CakeOrderController.ajax_error()

    return false

  @ajax_success: ()->
    $('#new-cake-form-block').hide('slow')
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
    $('#new-cake-form-block').show('slow')
    $('#new_cake_order input[type=text]').val('')
    $('#cake_order_stuff').val($(this).data('stuff'))
    $('.modal-window #order-form-block').show()
    $('#cake-order-success').hide('slow')
    $('#cake-order-success').removeClass('visible')
    $('.message-wrap').hide('slow')
    $('.message-wrap').removeClass('visible')
    $('#preview-block .preview').attr('src', '/images/placeholder_new_photo.png')
    return
  hide_popup: ->
    $('.modal-shadow').hide('slow')
    $('.modal-window').hide('slow')




ready = ->
  new CakeOrderController
  return
$(document).ready ready