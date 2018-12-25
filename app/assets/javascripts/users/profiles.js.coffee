$ ->
  $('form').on 'click', '.remove_fields', (event) ->
    console.log("clicl")
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('ul').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
