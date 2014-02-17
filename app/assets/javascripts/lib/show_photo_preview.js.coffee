handleFileSelect = (evt)->
  f = evt.target.files[0]
  if f.type.match 'image\/*'
    reader = new FileReader()
    onload = (e)->

    reader.onload = (->
      return (e)->
        $('#preview-block .preview').attr('src', e.target.result)
        return)(f)
    reader.readAsDataURL(f)

$(document).ready ->
  $('#cake_order_photo').bind('change', handleFileSelect);