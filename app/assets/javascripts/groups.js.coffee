$ ->
  $("#pickadate").pickadate(
    format: 'yyyy/mm/dd',
    formatSubmit: 'yyyy/mm/dd',
    hiddenPrefix: 'submit__',
    hiddenSuffix: '',
    min: new Date()
  )

  $('.select-multiple').select2()

  $('.question_btn').click ->
    type = $('#message_type').val() == 'true'
    $('#message_type').val(!type)
    if (type)
      $('.question_btn').css('background', '#05728f none repeat scroll 0 0');
      $('#status-area').flash_message
        text: '質問モードを解除しました'
        how: 'append'
        class_name: 'p-4 text-white'
      return
    else
      $('.question_btn').css('background', '#da4a16 none repeat scroll 0 0');
      $('#status-area').flash_message
        text: '質問モードです'
        how: 'append'
        class_name: 'p-4 text-white'
      return
