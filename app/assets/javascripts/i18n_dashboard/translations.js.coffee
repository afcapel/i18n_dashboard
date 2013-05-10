jQuery ->
  $('#form-translation textarea').autosize()
  $('.edit-translation').click (event) ->
    event.preventDefault()
    $('#form-translation #locale').val($(@).data('locale'))
    $('#form-translation #key').val($(@).data('key'))
    $('#form-translation #value').val($(@).html().trim())

    $('#form-translation #value').trigger('autosize')
    $('#form-translation #value').focus()
    $('#form-translation #value')[0].setSelectionRange(0,0)
